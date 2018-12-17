FROM php:7.2
LABEL maintainer="DevOps <devops@kyanicorp.com>"

# set environment variables
ENV app_name=Join-Kyani-Devel

RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring

WORKDIR /app
COPY eb-laravel /app
RUN composer install

CMD php artisan serve
EXPOSE 80
