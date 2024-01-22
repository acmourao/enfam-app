FROM php:8.2-fpm
# Use the default development configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
#COPY ./php.ini /opt/bitnami/php/etc/php.ini
COPY ./.bashrc /root