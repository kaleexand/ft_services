FROM alpine:3.12

RUN apk update
RUN apk add supervisor

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add grafana

# RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add telegraf

COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./telegraf.conf /etc/

COPY ./grafana.db /usr/share/grafana/data/grafana.db

EXPOSE 3000

CMD /usr/bin/supervisord -c /etc/supervisord.conf