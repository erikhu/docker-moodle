FROM php:7.3-apache
#install some base extensions
RUN apt-get update && apt-get install -y \
        libzip-dev \
        zip \
	libpng-dev \ 
	libicu-dev \
	libxml2-dev \
	libxml2 \
  && docker-php-ext-install zip \
  && docker-php-ext-install opcache && docker-php-ext-enable opcache \
  && docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
  && docker-php-ext-install gd && docker-php-ext-enable gd \
  && docker-php-ext-install intl && docker-php-ext-enable intl \
  && docker-php-ext-install xmlrpc && docker-php-ext-enable xmlrpc \
  && docker-php-ext-install soap && docker-php-ext-enable soap

# PERMISSION
RUN chown -R root /var/www/html && chmod -R 0755 /var/www/html && find /var/www/html -type f -exec chmod 0644 {} \; 
RUN mkdir /moodle_data && chmod 0777 /moodle_data
EXPOSE 80
WORKDIR /var/www/html
