# FROM php:8.3-apache
# COPY . /var/www/html
# EXPOSE 80
# RUN docker-php-ext-install pdo_mysql

# # Inside your Dockerfile
# RUN apt-get update && apt-get install -y libpq-dev
# RUN docker-php-ext-install pdo pdo_pgsql

# Use the official PHP image with Apache
FROM php:8.2-apache

# 1. Install development packages and the PostgreSQL driver
# (This fixes the "could not find driver" error)
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# 2. Enable Apache mod_rewrite (Optional, but good for most sites)
RUN a2enmod rewrite

# 3. Copy your PHP source code into the container
COPY . /var/www/html/

# 4. Set permissions so Apache can read the files
RUN chown -R www-data:www-data /var/www/html

# 5. Expose port 80 to the web
EXPOSE 80