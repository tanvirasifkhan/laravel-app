FROM php:8.3-alpine3.20

RUN apk update && apk upgrade && apk add 

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS  https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /laravel-app

COPY . ./

RUN composer install

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0