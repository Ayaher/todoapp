FROM node:12 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable

ENV CHROME_BIN=chromium

WORKDIR /app

COPY index.html .
COPY js ./js
COPY test ./test
COPY package.json .

RUN npm install
#RUN npm install karma-jasmine karma-chrome-launcher --save-dev
#RUN rm -rf node_modules/ts-node
#RUN npm test



FROM php:7.0-apache
RUN rm -rf /usr/local/apache2/htdocs/*
#COPY --from=builder /app/index.html /var/www/html/
COPY index.html /var/www/html/
COPY js /var/www/html/js
COPY node_modules /var/www/html/node_modules
ENTRYPOINT []
CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf && docker-php-entrypoint apache2-foreground
