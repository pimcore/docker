FROM dpfaffenbauer/pimcore:PHP7.2-apache

RUN apt-get update && apt-get -y install gnupg2

RUN wget -q -O - https://packagecloud.io/gpg.key | apt-key add - \
    && echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list 
    
RUN apt-get update && apt-get install -y blackfire-agent blackfire-php \
    && apt-get autoremove -y \
    && apt-get remove -y autoconf automake libtool nasm make pkg-config libz-dev build-essential g++ \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

CMD ["apache2-foreground"]