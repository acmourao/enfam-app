FROM acmourao/educaenfam-php
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini
RUN apk add --no-cache $PHPIZE_DEPS
RUN docker-php-ext-install mysqli pdo pdo_mysql opcache
RUN apk del $PHPIZE_DEPS
# Run your application
#CMD php-fpm
