FROM php:8.3-apache
COPY . /var/www/html
EXPOSE 80
RUN docker-php-ext-install pdo_mysql

# Inside your Dockerfile
RUN apt-get update && apt-get install -y libpq-dev
RUN docker-php-ext-install pdo pdo_pgsql