FROM php:7.0-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxslt1.1 \
        libxslt1-dev \
        libicu52 \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        iconv \
        mcrypt \
        xsl \
        intl \
        mbstring \
        zip \
        pdo_mysql \
        soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && mkdir -p /var/www/.composer \
 && mkdir -p /var/www/magento2 \
 && chown -R www-data:www-data /var/www

ENV TERM xterm
USER www-data
WORKDIR /var/www

ADD php.ini /usr/local/etc/php/php.ini

ADD deploy.sh /bin/mage-deploy
ADD install.sh /bin/mage-install
ADD install-sampledata.sh /bin/mage-install-sampledata

