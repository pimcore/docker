# Pimcore PHP-FPM Image

## Supported tags and respective Dockerfile links
PHP7.1 [PHP7.1/Dockerfile](PHP7.1/Dockerfile)
PHP7.0 [PHP7/Dockerfile](PHP7/Dockerfile)
PHP7.0-Apache [PHP7-apache/Dockerfile](PHP7-apache/Dockerfile)
PHP7.1-Apache [PHP7.1-apache/Dockerfile](PHP7.1-apache/Dockerfile)

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