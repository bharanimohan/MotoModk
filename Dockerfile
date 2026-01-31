FROM php:8.3-apache
COPY . /var/www/html
EXPOSE 80
RUN docker-php-ext-install pdo_mysql