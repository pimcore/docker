ARG PHP_VERSION="8.2"
ARG DEBIAN_VERSION="bookworm"

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} AS pimcore_php_min

COPY files/build-*.sh /usr/local/bin
RUN chmod +x /usr/local/bin/build-*.sh

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
    build-cleanup.sh; \
    \
    ldconfig /usr/local/lib; \
    \
    sync

RUN { \
        echo "upload_max_filesize = 100M"; \
        echo "memory_limit = 256M"; \
        echo "post_max_size = 100M"; \
    } > /usr/local/etc/php/conf.d/20-pimcore.ini

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
COPY --from=composer/composer:2-bin /composer /usr/local/bin/composer

WORKDIR /var/www/html

CMD ["php-fpm"]




FROM pimcore_php_min AS pimcore_php_default

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
        imagick \
        redis \
    ; \
    docker-php-ext-enable \
        apcu \
        imagick \
        redis \
    ; \
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
    build-cleanup.sh

# Allow running as an arbitrary user, as the config will be changed through the
# entrypoint.sh script
RUN chmod -R 0777 /usr/local/etc/php/conf.d

ENV PHP_IDE_CONFIG serverName=localhost

COPY files/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

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

COPY files/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord"]
