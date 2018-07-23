FROM php:7.2-apache-stretch

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV APACHE_DOCUMENT_ROOT /var/www/html/web

RUN apt-get update && apt-get install -y lsb-release \
    && echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" > /etc/apt/sources.list.d/backports.list \
    && apt-get update && apt-get install -y --no-install-recommends \
      autoconf automake libtool nasm make pkg-config libz-dev build-essential openssl g++ \
      zlib1g-dev libicu-dev libbz2-dev libpng-dev libc-client-dev \
      libkrb5-dev libxml2-dev libxslt1.1 libxslt1-dev locales locales-all \
      ffmpeg html2text ghostscript libreoffice pngcrush jpegoptim exiftool poppler-utils git wget \
      libx11-dev libjpeg-dev python3-pip opencv-data \
    && wget http://www.imagemagick.org/download/ImageMagick.tar.gz \
      && tar -xvf ImageMagick.tar.gz \
      && cd ImageMagick-7.* \
      && ./configure \
      && make \
      && make install \
      && ldconfig /usr/local/lib \
      && pecl install imagick \
      && pecl install apcu \
      && cd .. \
      && rm -rf ImageMagick* \
    && a2enmod rewrite \
    && docker-php-ext-install intl mbstring mysqli bcmath bz2 gd soap xmlrpc xsl pdo pdo_mysql fileinfo exif zip \
    && docker-php-ext-enable intl mbstring mysqli bcmath bz2 gd soap xmlrpc xsl pdo pdo_mysql fileinfo exif zip \
    && pecl install redis \
    && docker-php-ext-enable redis imagick apcu \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-enable imap \
    \
    && cd ~ \
    \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
      && tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
      && mv wkhtmltox/bin/wkhtmlto* /usr/bin/ \
      && rm -rf wkhtmltox \
    \
    && git clone https://github.com/mozilla/mozjpeg.git  \
      && cd mozjpeg \
      && autoreconf -fiv \
      && ./configure \
      && make \
      && make install \
      && ln -s /opt/mozjpeg/bin/cjpeg /usr/bin/cjpeg \
      && cd .. \
      && rm -rf mozjpeg \
    && git clone https://github.com/wavexx/facedetect \
      && pip3 install numpy opencv-python \
      && cd facedetect \
      && cp facedetect /usr/local/bin \
      && cd .. \
      && rm -rf facedetect \  && cp facedetect /usr/local/bin \
    && git clone https://github.com/google/zopfli.git \
      && cd zopfli \
      && make \
      && cp zopfli /usr/bin/zopflipng \
      && cd .. \
      && rm -rf zopfli \
    && wget http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz \
      && tar -xf pngout-20150319-linux.tar.gz \
      && rm pngout-20150319-linux.tar.gz \
      && cp pngout-20150319-linux/x86_64/pngout /bin/pngout \
      && cd .. \
      && rm -rf pngout-20150319-linux \
    && wget http://prdownloads.sourceforge.net/advancemame/advancecomp-1.17.tar.gz \
      && tar zxvf advancecomp-1.17.tar.gz \
      && cd advancecomp-1.17 \
      && ./configure \
      && make \
      && make install \
      && cd .. \
      && rm -rf advancecomp-1.17 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    \
    && a2enmod rewrite \
      && a2enmod ssl \
      && mkdir /etc/apache2/ssl \
      && touch /etc/apache2/ssl/localhost.key \
      && touch /etc/apache2/ssl/localhost.crt \
      && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/localhost.key \
        -subj '/C=UK/ST=London/L=London/O=Digital Web Ltd./CN=localhost/' -out /etc/apache2/ssl/localhost.crt \
    && apt-get autoremove -y \ 
      && apt-get remove -y autoconf automake libtool nasm make pkg-config libz-dev build-essential g++ \
      && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer \
      && usermod -u 1000 www-data \
      && usermod -G staff www-data \
      && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
      && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

COPY 001-ssl.conf /etc/apache2/sites-enabled

CMD ["apache2-foreground"]