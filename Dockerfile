FROM httpd:2.4-alpine

COPY ./test.html /usr/local/apache2/htdocs/

EXPOSE 80
EXPOSE 443
CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf && httpd-foreground
