# установка контейнерной ОС по сабжекту alpine
FROM alpine:3.12

# установка образa
RUN apk update && apk upgrade
RUN mkdir -p /run/nginx

RUN apk add nginx openssl supervisor

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY ./nginx.conf ./etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./telegraf.conf /etc/


# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add telegraf

# настройка ssl сертификата и ключа (по сабжекту для порта 443 (в конфиге nginx), мы должны установить ключ SSL в Dockerfile)
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russian/L=Kazan/O=Kalexand/OU=21school/CN=localhost" \
-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

EXPOSE 80 443

CMD /usr/bin/supervisord -c /etc/supervisord.conf