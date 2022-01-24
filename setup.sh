#!/bin/sh

# kubectl delete -f srcs/config/nginx.yaml
# kubectl delete -f srcs/config/configmap.yaml
# kubectl delete -f srcs/config/wordpress.yaml
# kubectl delete -f srcs/config/mysql-deployment.yaml
# kubectl delete -f srcs/config/phpmyadmin.yaml
# kubectl delete -f srcs/ftps/ftps.yaml
# kubectl delete -f srcs/config/influxdb.yaml
# kubectl delete -f srcs/config/grafana.yaml

minikube stop
minikube delete

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

docker build -t nginx-image srcs/nginx
kubectl apply -f srcs/config/nginx.yaml
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/config/wordpress.yaml
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/config/mysql-deployment.yaml
docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/config/phpmyadmin.yaml
docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/config/grafana.yaml
docker build -t influx_image srcs/influx
kubectl apply -f srcs/config/influxdb.yaml
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/config/ftps.yaml

minikube addons enable metallb
minikube addons enable dashboard

kubectl apply -f srcs/config/configmap.yaml

minikube dashboard
