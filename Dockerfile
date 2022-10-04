FROM php:7.3.0-apache
ARG DEBIAN_FRONTEND=noninteractive
RUN docker-php-ext-install mysqli
# Include alternative DB driver
RUN docker-php-ext-install pdo_mysql
RUN apt-get update \
    && apt-get install -y sendmail libpng-dev \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libonig-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN a2enmod rewrite

# Add a new user "tfmdevops" with user id 8877
RUN useradd -u 8877 tfmdevops
# Change to non-root privilege
USER tfmdevops

