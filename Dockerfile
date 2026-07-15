# syntax=docker/dockerfile:1

ARG PHP_VERSION="8.5"
ARG DEBIAN_VERSION="trixie"
ARG PHP_EXTENSION_INSTALLER_VERSION="2.11.1"

FROM mlocati/php-extension-installer:${PHP_EXTENSION_INSTALLER_VERSION} AS php_extension_installer

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} AS pimcore_php_min

ARG DEBIAN_VERSION

RUN set -eux; \
    \
    echo 'Acquire::Retries "3";' > /etc/apt/apt.conf.d/80-retries; \
    echo "deb http://deb.debian.org/debian ${DEBIAN_VERSION}-backports main" > /etc/apt/sources.list.d/backports.list; \
    apt-get update; \
    apt-get upgrade -y; \
    \
    # tools used by Pimcore
    apt-get install -y \
        iproute2 \
        unzip \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN --mount=type=bind,from=php_extension_installer,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
    install-php-extensions \
        amqp \
        bcmath \
        exif \
        gd \
        intl \
        pcntl \
        pdo_mysql \
        sockets \
        zip

COPY files/conf/php/php.ini /usr/local/etc/php/conf.d/20-pimcore.ini
COPY files/conf/php-fpm/php-fpm.conf /usr/local/etc/php-fpm.d/zz-www.conf

# env php.ini
ENV PHP_TIMEZONE="UTC"
ENV PHP_MEMORY_LIMIT="256M"
ENV PHP_POST_MAX_SIZE="100M"
ENV PHP_UPLOAD_MAX_FILESIZE="100M"
ENV PHP_DISPLAY_STARTUP_ERRORS=1
ENV PHP_MAX_EXECUTION_TIME="30"
ENV PHP_ERROR_REPORTING="E_ALL"
ENV PHP_EXPOSE_PHP="Off"

# opcache settings
ENV OPCACHE_ENABLE=1
ENV OPCACHE_ENABLE_CLI=0
ENV OPCACHE_MEMORY_CONSUMPTION=128
ENV OPCACHE_MAX_ACCELERATED_FILES=10000
ENV OPCACHE_VALIDATE_TIMESTAMPS=1
ENV OPCACHE_CONSISTENCY_CHECKS=0

# fpm settings
ENV PHP_FPM_LISTEN=0.0.0.0:9000
ENV PHP_FPM_PM=dynamic
ENV PHP_FPM_PM_MAX_CHILDREN=5
ENV PHP_FPM_PM_START_SERVERS=2
ENV PHP_FPM_PM_MAX_SPARE_SERVERS=3
ENV PHP_FPM_PM_MIN_SPARE_SERVERS=1
ENV PHP_FPM_PM_MAX_REQUESTS=10000

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_MEMORY_LIMIT=-1
COPY --from=composer/composer:2-bin /composer /usr/local/bin/composer

WORKDIR /var/www/html

CMD ["php-fpm"]

FROM pimcore_php_min AS pimcore_php_default

ARG DEBIAN_VERSION

RUN set -eux; \
    \
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
    # ImageMagick
    apt-get install -y -t ${DEBIAN_VERSION}-backports \
        imagemagick \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# Harden ImageMagick against untrusted SVG assets: deny the file-read, text,
# scripting and network coders that SVG xlink:href can invoke.

COPY files/conf/imagemagick/policy.xml /etc/ImageMagick-7/policy.xml

RUN --mount=type=bind,from=php_extension_installer,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
    install-php-extensions \
        apcu \
        imagick \
        redis

CMD ["php-fpm"]

FROM pimcore_php_default AS pimcore_php_max

RUN set -eux; \
    \
    apt-get update; \
    apt-get install -y \
        chromium-sandbox \
        libreoffice \
        openssl \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN --mount=type=bind,from=php_extension_installer,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
    install-php-extensions \
        soap

CMD ["php-fpm"]

FROM pimcore_php_default AS pimcore_php_debug

RUN --mount=type=bind,from=php_extension_installer,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
    install-php-extensions \
        xdebug

RUN set -eux; \
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
