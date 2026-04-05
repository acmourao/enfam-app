FROM webdevops/apache:ubuntu-18.04

ENV WEB_PHP_SOCKET=php:9000
ENV WEB_DOCUMENT_ROOT=/var/www/html
ENV APACHE_HTTP2=false
ENV WEB_PHP_TIMEOUT=60
ENV LOG_STDOUT=/var/log/access.log
ENV LOG_STDERR=/var/log/error.log

WORKDIR /var/www/html

COPY vhost.conf /opt/docker/etc/httpd/vhost.conf
