# syntax=docker/dockerfile:1

ARG PHP_VERSION="8.2"
ARG DEBIAN_VERSION="bookworm"

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} AS pimcore_php_min

COPY --chmod=0755 files/build-*.sh /usr/local/bin/

RUN set -eux; \
    \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    echo "deb http://deb.debian.org/debian bookworm-backports main" > /etc/apt/sources.list.d/backports.list; \
    apt-get update; \
    apt-get upgrade -y; \
    \
    # tools used by Pimcore
    apt-get install -y \
        iproute2 \
        unzip \
    ; \
    \
    # dependencies for building PHP extensions
    apt-get install -y \
        libicu-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        zlib1g-dev \
        librabbitmq-dev \
    ; \
    \
    docker-php-ext-configure gd --enable-gd --with-jpeg; \
    docker-php-ext-configure pcntl --enable-pcntl; \
    docker-php-ext-install \
        bcmath \
        exif \
        gd \
        intl \
        opcache \
        pcntl \
        pdo_mysql \
        sockets \
        zip \
    ; \
    \
    pecl install -f \
        amqp \
    ; \
    docker-php-ext-enable \
        amqp \
    ; \
    build-cleanup.sh; \
    \
    ldconfig /usr/local/lib; \
    \
    sync

COPY files/conf/php/php.ini /usr/local/etc/php/conf.d/20-pimcore.ini
COPY files/conf/php-fpm/php-fpm.conf /usr/local/etc/php-fpm.d/zz-www.conf

# env php.ini
ENV PHP_MEMORY_LIMIT "256M"
ENV PHP_POST_MAX_SIZE "100M"
ENV PHP_UPLOAD_MAX_FILESIZE "100M"
ENV PHP_DISPLAY_STARTUP_ERRORS 1
ENV PHP_MAX_EXECUTION_TIME "30"
ENV PHP_ERROR_REPORTING "E_ALL"

# opcache settings
ENV OPCACHE_ENABLE 1
ENV OPCACHE_ENABLE_CLI 0
ENV OPCACHE_MEMORY_CONSUMPTION 128
ENV OPCACHE_MAX_ACCELERATED_FILES 10000
ENV OPCACHE_VALIDATE_TIMESTAMPS 1
ENV OPCACHE_CONSISTENCY_CHECKS 0

# fpm settings
ENV PHP_FPM_LISTEN 127.0.0.1:9000
ENV PHP_FPM_PM dynamic
ENV PHP_FPM_PM_MAX_CHILDREN 5
ENV PHP_FPM_PM_START_SERVERS 2
ENV PHP_FPM_PM_MAX_SPARE_SERVERS 3
ENV PHP_FPM_PM_MIN_SPARE_SERVERS 1
ENV PHP_FPM_PM_MAX_REQUESTS 10000

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
COPY --from=composer/composer:2-bin /composer /usr/local/bin/composer

WORKDIR /var/www/html

CMD ["php-fpm"]




FROM pimcore_php_min AS pimcore_php_default

ARG IMAGICK_VERSION_FROM_SRC="";

RUN set -eux; \
    \
    build-install.sh; \
    \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    echo "deb https://www.deb-multimedia.org bookworm main non-free" > /etc/apt/sources.list.d/deb-multimedia.list; \
    apt-get update -oAcquire::AllowInsecureRepositories=true; \
    apt-get install -y --allow-unauthenticated deb-multimedia-keyring; \
    apt-get update; \
    \
    # tools used by Pimcore
    apt-get install -y \
        exiftool \
        ffmpeg \
        ghostscript \
        git \
        graphviz \
        jpegoptim \
        locales \
        locales-all \
        optipng \
        pngquant \
        poppler-utils \
        webp \
    ; \
    \
    # dependencies for building PHP extensions
    apt-get install -y \
        libfreetype6-dev \
        libwebp-dev \
    ; \
    \
    # ImageMagick
    apt-get install -y \
        imagemagick-7 \
        libmagickwand-7-dev \
    ; \
    \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-install gd; \
    \
    pecl install -f \
        apcu \
        redis \
    ; \
    docker-php-ext-enable \
        apcu \
        redis \
    ; \
    \
    # Install Imagick from PECL if no build arg IMAGICK_VERSION_FROM_SRC is given
    [ -z "$IMAGICK_VERSION_FROM_SRC" ] && \
        pecl install -f imagick && \
        docker-php-ext-enable imagick; \
    \
    # Install Imagick from source as long as no official version compatible with PHP 8.3 is released yet
    # See https://github.com/Imagick/imagick/issues/640
    # Provide the build argument IMAGICK_VERSION_FROM_SRC containing a commit hash or "refs/tags/3.7.0" or "refs/heads/master"
    [ -n "$IMAGICK_VERSION_FROM_SRC" ] &&  \
        mkdir -p /usr/src/php/ext/imagick && \
        curl -fsSL https://github.com/Imagick/imagick/archive/"$IMAGICK_VERSION_FROM_SRC".tar.gz | tar xvz -C "/usr/src/php/ext/imagick" --strip 1 && \
        docker-php-ext-install imagick; \
    \
    build-cleanup.sh; \
    \
    ldconfig /usr/local/lib; \
    \
    sync

CMD ["php-fpm"]




FROM pimcore_php_default AS pimcore_php_max

RUN set -eux; \
    \
    build-install.sh; \
    \
    apt-get install -y \
        chromium-sandbox \
        libc-client-dev \
        libkrb5-dev \
        libreoffice \
        libxml2-dev \
        openssl \
    ; \
    \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install \
        imap \
        soap \
    ; \
    docker-php-ext-enable \
        imap \
        soap \
    ; \
    \
    build-cleanup.sh; \
    \
    sync

CMD ["php-fpm"]




FROM pimcore_php_default AS pimcore_php_debug

RUN set -eux; \
    \
    build-install.sh; \
    \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    \
    build-cleanup.sh; \
    \
    # For local development, it should be possible to use any local (Git) Composer repository - that's safe in debug image flavor
    git config --global --add safe.directory "*"; \
    \
    # Allow running as an arbitrary user, as the config will be changed through
    # the entrypoint.sh script
    chmod -R 0777 /usr/local/etc/php/conf.d/

ENV PHP_IDE_CONFIG serverName=localhost

COPY --chmod=0755 files/entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]




FROM pimcore_php_default AS pimcore_php_supervisord

RUN set -eux; \
    \
    apt-get update; \
    apt-get install -y \
        cron \
        supervisor \
    ; \
    \
    chmod gu+rw /var/run; \
    chmod gu+s /usr/sbin/cron

COPY files/conf/supervisord/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord"]
