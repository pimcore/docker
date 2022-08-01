ARG PHP_VERSION="8.0"
ARG DEBIAN_VERSION="bullseye"

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} as pimcore_php

RUN set -eux; \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    apt-get update; \
    apt-get install -y lsb-release; \
    echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" > /etc/apt/sources.list.d/backports.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        autoconf automake libtool nasm make pkg-config libz-dev build-essential openssl g++ \
        zlib1g-dev libicu-dev libbz2-dev zopfli libc-client-dev default-jre \
        libkrb5-dev libxml2-dev libxslt1.1 libxslt1-dev locales locales-all \
        ffmpeg html2text ghostscript libreoffice pngcrush jpegoptim exiftool poppler-utils git wget \
        libx11-dev python3-pip opencv-data facedetect webp graphviz cmake ninja-build unzip cron \
        liblcms2-dev liblqr-1-0-dev libjpeg-turbo-progs libopenjp2-7-dev libtiff-dev \
        libfontconfig1-dev libfftw3-dev libltdl-dev liblzma-dev libopenexr-dev \
        libwmf-dev libdjvulibre-dev libpango1.0-dev libxext-dev libxt-dev librsvg2-dev libzip-dev \
        libpng-dev libfreetype6-dev libjpeg-dev libxpm-dev libwebp-dev libjpeg62-turbo-dev \
        xfonts-75dpi xfonts-base libjpeg62-turbo \
        libonig-dev optipng pngquant inkscape; \
    \
    apt-get install -y libavif-dev libheif-dev optipng pngquant chromium chromium-sandbox; \
    docker-php-ext-configure pcntl --enable-pcntl; \
    docker-php-ext-install pcntl intl mbstring mysqli bcmath bz2 soap xsl pdo pdo_mysql fileinfo exif zip opcache sockets; \
    \
    wget https://imagemagick.org/archive/ImageMagick.tar.gz; \
        tar -xvf ImageMagick.tar.gz; \
        cd ImageMagick-7.*; \
        ./configure; \
        make --jobs=$(nproc); \
        make install; \
        ldconfig /usr/local/lib; \
        cd ..; \
        rm -rf ImageMagick*; \
    \
    docker-php-ext-configure gd -enable-gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-install gd; \
    pecl install -f xmlrpc; \
    pecl install imagick; \
    pecl install apcu; \
    pecl install redis; \
    docker-php-ext-enable redis imagick apcu; \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install imap; \
    docker-php-ext-enable imap; \
    \
    cd /tmp; \
    \
    wget -O wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_${DPKG_ARCH}.deb; \
        dpkg -i wkhtmltox.deb; \
        rm wkhtmltox.deb; \
    \
    apt-get autoremove -y; \
        apt-get remove -y autoconf automake libtool nasm make cmake ninja-build pkg-config libz-dev build-essential g++; \
        apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

RUN echo "upload_max_filesize = 100M" >> /usr/local/etc/php/conf.d/20-pimcore.ini; \
    echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/20-pimcore.ini; \
    echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/20-pimcore.ini

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir -p /usr/local/var/log/php7/
RUN mkdir -p /usr/local/var/run/

WORKDIR /var/www/html

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]

FROM pimcore_php as pimcore_php_debug

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
      autoconf automake libtool nasm make pkg-config libz-dev build-essential g++ iproute2; \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    apt-get autoremove -y; \
    apt-get remove -y autoconf automake libtool nasm make pkg-config libz-dev build-essential g++; \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer;

# allow container to run as custom user, this won't work otherwise because config is changed in entrypoint.sh
RUN chmod -R 0777 /usr/local/etc/php/conf.d

ENV PHP_IDE_CONFIG serverName=localhost

COPY files/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

FROM pimcore_php as pimcore_php_supervisord

RUN apt-get update && apt-get install -y supervisor cron
COPY files/supervisord.conf /etc/supervisor/supervisord.conf

RUN chmod gu+rw /var/run
RUN chmod gu+s /usr/sbin/cron

CMD ["/usr/bin/supervisord"]
