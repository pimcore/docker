FROM dpfaffenbauer/pimcore:PHP7.1-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
      autoconf automake libtool nasm make pkg-config libz-dev build-essential g++ iproute2 \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apt-get autoremove -y \
    && apt-get remove -y autoconf automake libtool nasm make pkg-config libz-dev build-essential g++ \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

RUN echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
    echo "xdebug.default_enable = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
    echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
    echo "xdebug.remote_autostart = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
    echo "xdebug.remote_connect_back = 0" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
    echo "xdebug.profiler_enable = 0" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
    echo "xdebug.remote_host = 127.0.0.1" >> /usr/local/etc/php/conf.d/20-xdebug.ini

ENV PHP_DEBUG 1

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
