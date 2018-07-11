FROM php:7.2-apache
# Copy files from local machine
COPY . /var/www/html
# Install php extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql
# Remote apache config
RUN rm /etc/apache2/sites-available/000-default.conf
COPY 000-default.conf /etc/apache2/sites-available/
# Change folder owner
RUN chown -R www-data:www-data var/
RUN service apache2 restart