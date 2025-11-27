ARG PHP_VERSION="8.2"
ARG DEBIAN_VERSION="bullseye"

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} AS pimcore_php_min

COPY files/build-cleanup.sh /usr/local/bin
COPY files/build-install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/build-*

RUN set -eux; \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    echo "deb https://archive.debian.org/debian bullseye-backports main" > /etc/apt/sources.list.d/backports.list; \
    apt-get update; \
    apt-get upgrade -y; \
    \
    # tools used by Pimcore
    apt-get install -y iproute2 unzip; \
    \
    # dependencies fór building PHP extensions
    apt-get install -y \
        libicu-dev zlib1g-dev libpng-dev libjpeg62-turbo-dev libzip-dev; \
    \
    docker-php-ext-configure pcntl --enable-pcntl; \
    docker-php-ext-configure gd -enable-gd --with-jpeg; \
    docker-php-ext-install pcntl bcmath pdo_mysql exif zip opcache sockets gd intl; \
    \
    ldconfig /usr/local/lib; \
    \
    sync;

RUN set -eux; build-cleanup.sh;

COPY files/php.ini /usr/local/etc/php/conf.d/20-pimcore.ini
COPY files/php-fpm.conf /usr/local/etc/php-fpm.d/zz-www.conf

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
COPY --from=composer/composer:2-bin /composer /usr/bin/composer

WORKDIR /var/www/html

CMD ["php-fpm"]





FROM pimcore_php_min AS pimcore_php_default

RUN set -eux; build-install.sh;

RUN set -eux; \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    echo "deb https://www.deb-multimedia.org bullseye main non-free" > /etc/apt/sources.list.d/deb-multimedia.list; \
    apt-get update -oAcquire::AllowInsecureRepositories=true; \
    apt-get install -y --allow-unauthenticated deb-multimedia-keyring; \
    apt-get update; \
    \
    # tools used by Pimcore
    apt-get install -y \
        ffmpeg ghostscript jpegoptim exiftool poppler-utils optipng pngquant webp graphviz locales locales-all git; \
    \
    # dependencies fór building PHP extensions
    apt-get install -y libwebp-dev libfreetype6-dev; \
    \
    # ImageMagick
    apt-get install -y imagemagick-7 libmagickwand-7-dev; \
    # Disable AVIF image format because of performance issues, can be removed in Debian bookworm as it has updated avif libraries
    sed -i '\@</policymap>@i <policy domain="coder" rights="none" pattern="AVIF" />' /etc/ImageMagick-7/policy.xml; \
    \
    docker-php-ext-configure gd -enable-gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-install gd; \
    \
    pecl install -f apcu redis imagick; \
    docker-php-ext-enable redis apcu imagick; \
    ldconfig /usr/local/lib; \
    \
    sync;

RUN set -eux; build-cleanup.sh;

CMD ["php-fpm"]





FROM pimcore_php_default AS pimcore_php_max

RUN set -eux; build-install.sh;
RUN set -eux; \
    apt-get install -y libxml2-dev libreoffice chromium-sandbox openssl libc-client-dev libkrb5-dev;  \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install soap imap; \
    docker-php-ext-enable soap imap; \
    \
    sync;
RUN set -eux; build-cleanup.sh;

CMD ["php-fpm"]




FROM pimcore_php_default AS pimcore_php_debug

RUN set -eux; build-install.sh;
RUN pecl install xdebug; \
    docker-php-ext-enable xdebug;
RUN set -eux; build-cleanup.sh;

# allow container to run as custom user, this won't work otherwise because config is changed in entrypoint.sh
RUN chmod -R 0777 /usr/local/etc/php/conf.d

ENV PHP_IDE_CONFIG=serverName=localhost

COPY files/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]

FROM pimcore_php_default AS pimcore_php_supervisord

RUN apt-get update; \
    apt-get install -y supervisor cron;

COPY files/supervisord.conf /etc/supervisor/supervisord.conf

RUN chmod gu+rw /var/run
RUN chmod gu+s /usr/sbin/cron

CMD ["/usr/bin/supervisord"]
