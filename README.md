# Pimcore PHP-FPM Docker Image

This is a customized `php` Docker image specifically optimized for running [Pimcore](https://github.com/pimcore/pimcore).
It doesn't include the Pimcore software itself, it just provides an environment that fulfills all system requirements
of Pimcore, so that you can leverage the full functionality.

You can either use this image directly by mounting Pimcore into the container, or as a template for your customized 

ready-to-deploy images. As a starting point please see [example docker-compose configuration](https://github.com/pimcore/skeleton/blob/HEAD/docker-compose.yaml).

## Supported tags and respective Dockerfile links
- PHP8.0
    - fpm (`pimcore/pimcore:php8.0-bullseye-fpm`)
    - debug (`pimcore/pimcore:php8.0-bullseye-debug`) - with xdebug enabled
    - supervisord (`pimcore/pimcore:php8.0-bullseye-supervisord`)
- PHP8.1
    - fpm (`pimcore/pimcore:php8.1-bullseye-fpm`)
    - debug (`pimcore/pimcore:php8.1-bullseye-debug`) - with xdebug enabled
    - supervisord (`pimcore/pimcore:php8.1-bullseye-supervisord`)
 