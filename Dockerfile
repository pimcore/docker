ARG PHP_VERSION="8.2"
ARG DEBIAN_VERSION="bullseye"

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} as pimcore_php_min

COPY files/build-cleanup.sh /usr/local/bin
COPY files/build-install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/build-*

RUN set -eux; \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    echo "deb http://deb.debian.org/debian bullseye-backports main" > /etc/apt/sources.list.d/backports.list; \
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
    
RUN apt-get install -y openssh-client nodejs npm cifs-utils iputils-ping htop nano autoconf automake libtool m4 librabbitmq-dev; \
    pecl install amqp; \
    docker-php-ext-enable amqp;

RUN set -eux; build-cleanup.sh;

RUN echo "upload_max_filesize = 1024M" >> /usr/local/etc/php/conf.d/20-pimcore.ini; \
    echo "memory_limit = 521M" >> /usr/local/etc/php/conf.d/20-pimcore.ini; \
    echo "post_max_size = 1024M" >> /usr/local/etc/php/conf.d/20-pimcore.ini

RUN echo "user = root" >> /usr/local/etc/php-fpm.d/zz-docker.conf; \
    echo "group = root" >> /usr/local/etc/php-fpm.d/zz-docker.conf;

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
COPY --from=composer/composer:2-bin /composer /usr/bin/composer

WORKDIR /var/www/html

CMD ["php-fpm", "--allow-to-run-as-root"]





FROM pimcore_php_min as pimcore_php_default

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

CMD ["php-fpm", "--allow-to-run-as-root"]





FROM pimcore_php_default as pimcore_php_max

RUN set -eux; build-install.sh;
RUN set -eux; \
    apt-get install -y libxml2-dev libreoffice chromium-sandbox openssl libc-client-dev libkrb5-dev;  \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install soap imap; \
    docker-php-ext-enable soap imap; \
    \
    sync;
RUN set -eux; build-cleanup.sh;

CMD ["php-fpm", "--allow-to-run-as-root"]




FROM pimcore_php_default as pimcore_php_debug

RUN set -eux; build-install.sh;
RUN pecl install xdebug; \
    docker-php-ext-enable xdebug;
RUN set -eux; build-cleanup.sh;

# allow container to run as custom user, this won't work otherwise because config is changed in entrypoint.sh
RUN chmod -R 0777 /usr/local/etc/php/conf.d

ENV PHP_IDE_CONFIG serverName=localhost

COPY files/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm", "--allow-to-run-as-root"]

FROM pimcore_php_default as pimcore_php_supervisord

RUN apt-get update; \
    apt-get install -y supervisor cron;

COPY files/supervisord.conf /etc/supervisor/supervisord.conf

RUN chmod gu+rw /var/run
RUN chmod gu+s /usr/sbin/cron

CMD ["/usr/bin/supervisord"]
