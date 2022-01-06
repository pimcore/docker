# Pimcore PHP-FPM Docker Image

This is a customized `php` Docker image specifically optimized for running [Pimcore](https://github.com/pimcore/pimcore).
It doesn't include the Pimcore software itself, it just provides an environment that fulfills all system requirements
of Pimcore, so that you can leverage the full functionality. 

You can either use this image directly by mounting Pimcore into the container, or as a template for your customized 
ready-to-deploy images. 

## Supported tags and respective Dockerfile links
 - PHP7.4 - buster
    - cli (`pimcore/pimcore:PHP7.4-cli` or `pimcore/pimcore:PHP7.4-cli-buster`)
    - fpm (`pimcore/pimcore:PHP7.4-fpm` or `pimcore/pimcore:PHP7.4-fpm-buster`)
 - PHP8.0 - bullseye
    - cli (`pimcore/pimcore:PHP8.0-cli` or `pimcore/pimcore:PHP8.0-cli-bullseye`)
    - fpm (`pimcore/pimcore:PHP8.0-fpm` or `pimcore/pimcore:PHP8.0-fpm-bullseye`)
 - PHP8.1 - bullseye
    - cli (`pimcore/pimcore:PHP8.1-cli` or `pimcore/pimcore:PHP8.1-cli-bullseye`)
    - fpm (`pimcore/pimcore:PHP8.1-fpm` or `pimcore/pimcore:PHP8.1-fpm-bullseye`)

## Debug Images
All of the above mentioned Images also come with a debug version where xdebug is enabled automatically. You can use the debug image by appending `-debug` to the tag (eg. `PHP8.0-fpm-debug`)
