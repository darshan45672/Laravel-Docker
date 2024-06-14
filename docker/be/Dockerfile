# Use Alpine as base image
FROM alpine:3.19 as STAGE1

# Install PHP 8.2, Nginx, PHP-FPM, Composer, Node.js, and npm
RUN apk --no-cache add php82 php82-fpm php82-json php82-mbstring \
    php82-openssl php82-pdo php82-pdo_mysql mysql-client nginx php82-tokenizer \
    php82-dom php82-xml php82-session php82-xmlwriter php82-fileinfo \
    && apk --no-cache add composer nodejs npm

# Set working directory
WORKDIR /var/www/html

# Copy Laravel application files
COPY . /var/www/html/

# Set permissions
RUN chown -R nobody:nobody /var/www/html && \
    chmod -R 755 /var/www/html/

# Copy Nginx configuration file
COPY docker/be/php/nginx.conf /etc/nginx/nginx.conf

# Copy PHP-FPM configuration file
COPY docker/be/php/php-fpm.conf /etc/php82/php-fpm.conf

WORKDIR /var/www/html

# Install PHP extensions and dependencies, then run composer update and npm install
RUN apk --no-cache composer update && npm install
