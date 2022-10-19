# Pimcore PHP-FPM Docker Image

This is a customized `php` Docker image specifically optimized for running [Pimcore](https://github.com/pimcore/pimcore).
It doesn't include the Pimcore software itself, it just provides an environment that fulfills all system requirements
of Pimcore, so that you can leverage the full functionality.

You can either use this image directly by mounting Pimcore into the container, or as a template for your customized 
ready-to-deploy images. As a starting point please see [example docker-compose configuration](https://github.com/pimcore/skeleton/blob/HEAD/docker-compose.yaml).

## Image flavors
We're providing 3 different image flavors: 
- PHP image for FPM and CLI (e.g. `php8.1-latest`)
- PHP debug image based on PHP image above, including preconfigured Xdebug for FPM and CLI (e.g. `php8.1-debug-latest`)
- Supervisord image based on PHP image above, for cron & queue processing  (e.g. `php8.1-supervisord-latest`)

## Versioning
Our images are versioned using a version-suffix staring with `-v` following SemVer.   
With that we're able to allow smooth upgrades, breaking changes are only delivered with major versions.  
Additionally we're offering 2 special tag suffixes: 
- `-latest` always points to the latest available tag (recommended for local development)
- `-dev` always points to the work in progress

We're also offering special tags for specific PHP versions, e.g. `php8.1.11-v1.0`. 

## Examples 

### PHP images
```text
php8.1-latest # always use the latest PHP 8.1 image
php8.1-v1 # always point to the latest minor version of v1
php8.1-v1.0 # pin to specific image version, always using the latest bugfixes from PHP 8.1
php8.1.11-v1.0 # pin to a specific PHP version & image version 
php8.1-dev # development image (build from the default branch) 
```

### PHP Debug images
Same as PHP images, but using `-debug` after the PHP version:
```text
php8.1-debug-latest
php8.1-debug-v1
...
```

### Supervisord
Same as PHP images, but using `-supervisor` after the PHP version:
```text
php8.1-supervisor-latest
php8.1-supervisor-v1
...
```