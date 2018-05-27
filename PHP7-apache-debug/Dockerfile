FROM dpfaffenbauer/pimcore-docker-php-fpm:PHP7-apache

RUN pecl install xdebug redis imagick \
    && docker-php-ext-enable xdebug

ENV PHP_DEBUG 1

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]