FROM php:7.0-apache
#COPY index.html /var/www/html/
#COPY js /var/www/html/js
#COPY node_modules /var/www/html/node_modules
COPY . /var/www/html/
ENTRYPOINT []
CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf && docker-php-entrypoint apache2-foreground
