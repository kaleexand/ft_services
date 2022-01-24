FROM alpine:3.12

RUN apk update && apk upgrade
# RUN apk update

RUN mkdir -p /run/nginx
RUN mkdir -p /run/php
RUN mkdir -p /var/log/php-fpm

RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli php7-mbstring php7-json php7-session php7-xml nginx supervisor openrc
#установка модулей PHP для нормальной работы панели управления базами данных

# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add telegraf

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf ./etc/supervisord.conf
# COPY ./telegraf.conf /etc/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz ; tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz ; rm phpMyAdmin-5.1.0-all-languages.tar.gz ; mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin
COPY ./config.inc.php /var/www/phpmyadmin
RUN mkdir /var/www/phpmyadmin/tmp && chmod 777 /var/www/phpmyadmin/tmp

EXPOSE 5000

CMD /usr/bin/supervisord -c /etc/supervisord.conf
