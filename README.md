# Pimcore PHP-FPM Image

## Supported tags and respective Dockerfile links
 - PHP7.1
    - cli (pimcore/pimcore:PHP7.1-cli or pimcore/pimcore:PHP7.1-cli-stretch)
    - apache (pimcore/pimcore:PHP7.1-apache or pimcore/pimcore:PHP7.1-apache-stretch)
    - fpm (pimcore/pimcore:PHP7.1-fpm or pimcore/pimcore:PHP7.1-fpm-stretch)
 - PHP7.2
    - cli (pimcore/pimcore:PHP7.2-cli or pimcore/pimcore:PHP7.2-cli-stretch)
    - apache (pimcore/pimcore:PHP7.2-apache or pimcore/pimcore:PHP7.2-apache-stretch)
    - fpm (pimcore/pimcore:PHP7.2-fpm or pimcore/pimcore:PHP7.2-fpm-stretch)
 - PHP7.3 - buster and stretch
    - cli (pimcore/pimcore:PHP7.3-cli-buster or pimcore/pimcore:PHP7.3-cli-stretch, pimcore/pimcore:PHP7.3-cli will give you stretch)
    - apache (pimcore/pimcore:PHP7.3-apache-buster or pimcore/pimcore:PHP7.3-apache-stretch, pimcore/pimcore:PHP7.3-apache will give you stretch)
    - fpm (pimcore/pimcore:PHP7.3-fpm-buster or pimcore/pimcore:PHP7.3-fpm-stretch, pimcore/pimcore:PHP7.3-fpm will give you stretch)
 - PHP7.4 - buster
    - cli (pimcore/pimcore:PHP7.4-cli or pimcore/pimcore:PHP7.4-cli-buster)
    - apache (pimcore/pimcore:PHP7.4-apache or pimcore/pimcore:PHP7.4-apache-buster)
    - fpm (pimcore/pimcore:PHP7.4-fpm or pimcore/pimcore:PHP7.4-fpm-buster)

## Debug Images
All of the above mentioned Images also come with a debug version where xdebug is enabled automatically. You can use the debug image by prefixing the tab with `-debug` (eg. `PHP7.3-apache-debug`)
