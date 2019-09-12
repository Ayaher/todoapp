FROM node:12 AS builder

WORKDIR /app

COPY index.html .
COPY js ./js
COPY test ./test
COPY package.json .

RUN npm install
#RUN npm install karma-jasmine karma-chrome-launcher --save-dev
#RUN npm test
RUN ls -l

FROM httpd:2.4-alpine
RUN rm -rf /usr/local/apache2/htdocs/*
COPY --from=builder /app/index.html /usr/local/apache2/htdocs/
COPY --from=builder /app/js /usr/local/apache2/htdocs/js
COPY --from=builder /app/node_modules /usr/local/apache2/htdocs/node_modules
