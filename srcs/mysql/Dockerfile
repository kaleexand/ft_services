FROM alpine:3.12

RUN apk update && apk upgrade
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
#openrc - команда для запуска сервисов
RUN apk add mariadb mariadb-client mysql mysql-client openrc supervisor

# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add telegraf

COPY ./init_server.sh ./
COPY ./supervisord.conf ./etc/supervisord.conf
# COPY ./telegraf.conf /etc/
COPY ./my.cnf ./etc/my.cnf
COPY ./wordpress.sql ./

# RUN chmod +x ./etc/mysql/my.cnf
RUN chmod +x ./init_server.sh

EXPOSE 3306

CMD sh init_server.sh
