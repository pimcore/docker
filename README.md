# Pimcore PHP-FPM Image

## Supported tags and respective Dockerfile links
 - PHP7.1 [PHP7.1/Dockerfile](PHP7.1/Dockerfile)
 - PHP7.0 [PHP7/Dockerfile](PHP7/Dockerfile)
 - PHP7.0-Apache [PHP7-apache/Dockerfile](PHP7-apache/Dockerfile)
 - PHP7.1-Apache [PHP7.1-apache/Dockerfile](PHP7.1-apache/Dockerfile)
 - PHP7.2-Apache [PHP7.2-apache/Dockerfile](PHP7.2-apache/Dockerfile)
 - PHP7.0-Apache-debug [PHP7-apache-debug/Dockerfile](PHP7-apache-debug/Dockerfile)
 - PHP7.1-Apache-debug [PHP7.1-apache-debug/Dockerfile](PHP7.1-apache-debug/Dockerfile)
 - PHP7.2-Apache-debug [PHP7.2-apache-debug/Dockerfile](PHP7.2-apache-debug/Dockerfile)

> These images are supposed to be used for DEV only. Because they include and activate Xdebug by default!

Images come with PHP-FPM and all requirements needed by Pimcore, these requirements exist of following applications:

 - PHP-Extensions
 - ffmpeg
 - pngcrush
 - jpegoptim
 - exiftool
 - wkhtmltox
 - mozjpeg
 - zopflipng
 - pngout
 - advpng
 - xdebug

## Apache Images
Images suffixed with apache have the apache and php-fpm in one container. This is due to easier fix of permission issues.

## Debug Images
Images suffiex with debug have xdebug installed. You can deactivate xdebug with env variable `PHP_DEBUG=0`.