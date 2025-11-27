ARG PHP_VERSION="8.0"
ARG DEBIAN_VERSION="bullseye"

FROM php:${PHP_VERSION}-fpm-${DEBIAN_VERSION} AS pimcore_php_fpm

RUN set -eux; \
    DPKG_ARCH="$(dpkg --print-architecture)"; \
    apt-get update; \
    apt-get install -y lsb-release; \
    echo "deb https://archive.debian.org/debian $(lsb_release -sc)-backports main" > /etc/apt/sources.list.d/backports.list; \
    echo "deb https://www.deb-multimedia.org $(lsb_release -sc) main non-free" > /etc/apt/sources.list.d/deb-multimedia.list; \
    apt-get update -oAcquire::AllowInsecureRepositories=true; \
    apt-get install -y --allow-unauthenticated deb-multimedia-keyring; \
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
    apt-get install -y imagemagick-7 libmagickwand-7-dev; \
    \
    docker-php-ext-configure gd -enable-gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-install gd; \
    pecl install -f xmlrpc imagick apcu redis; \
    docker-php-ext-enable redis imagick apcu; \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install imap; \
    docker-php-ext-enable imap; \
    ldconfig /usr/local/lib; \
    \
    cd /tmp; \
    \
    wget -O wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_${DPKG_ARCH}.deb; \
        dpkg -i wkhtmltox.deb; \
        rm wkhtmltox.deb; \
    \
    apt-get autoremove -y; \
        apt-get remove -y autoconf automake libtool nasm make cmake ninja-build pkg-config libz-dev build-essential g++; \
        apt-get clean; \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer || true; \
    sync;

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

FROM pimcore_php_fpm AS pimcore_php_debug

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
      autoconf automake libtool nasm make pkg-config libz-dev build-essential g++ iproute2; \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    apt-get autoremove -y; \
    apt-get remove -y autoconf automake libtool nasm make pkg-config libz-dev build-essential g++; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer || true

# allow container to run as custom user, this won't work otherwise because config is changed in entrypoint.sh
RUN chmod -R 0777 /usr/local/etc/php/conf.d

ENV PHP_IDE_CONFIG=serverName=localhost

COPY files/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]

FROM pimcore_php_fpm AS pimcore_php_supervisord

RUN apt-get update && apt-get install -y supervisor cron
COPY files/supervisord.conf /etc/supervisor/supervisord.conf

RUN chmod gu+rw /var/run
RUN chmod gu+s /usr/sbin/cron

CMD ["/usr/bin/supervisord"]
