# httpd base image httpd:2.4
FROM acmourao/educaenfam-httpd

# # Copy the Apache virtual host configuration file to the container
# COPY ./apache.vhost.conf /usr/local/apache2/conf/extra/apache.vhost.conf

# # Enable Apache modules to ensure proper functionality
# RUN sed -i \
#     -e '/#LoadModule deflate_module/s/^#//g' \
#     -e '/#LoadModule proxy_module/s/^#//g' \
#     -e '/#LoadModule proxy_fcgi_module/s/^#//g' \
#     -e '/#LoadModule rewrite_module/s/^#//g' \
#     /usr/local/apache2/conf/httpd.conf

# # Include the virtual host configuration file in the main Apache configuration
# RUN echo "Include /usr/local/apache2/conf/extra/apache.vhost.conf" >> /usr/local/apache2/conf/httpd.conf

# COPY ./.bashrc /root
