#!/bin/sh

#показывает уровень запуска службы, запускаем в дефолтном режиме
rc default

#устанавливаем и запускаем  mariadb
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "create database wordpress;"
mysql -e "grant all on *.* to admin@'%' identified by 'admin' with grant option;"
mysql -e "flush privileges;"

mysql wordpress < wordpress.sql

#останавливаем клиентскую версию
rc-service mariadb stop

# supervisord - служба для управления процессами в системе
/usr/bin/supervisord -c /etc/supervisord.conf