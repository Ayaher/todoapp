FROM httpd:2.4-alpine

COPY ./test.html /usr/local/apache2/htdocs/

EXPOSE 80
EXPOSE 443
CMD ["httpd-foreground"]
