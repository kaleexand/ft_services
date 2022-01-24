FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    ca-certificates \
    supervisor \
    wget

RUN wget --quiet https://dl.influxdata.com/influxdb/releases/influxdb-1.8.5_linux_amd64.tar.gz && \
    tar -xzvf influxdb-1.8.5_linux_amd64.tar.gz && \
    rm -rf influxdb-1.8.5_linux_amd64.tar.gz && \
    mv ./influxdb-1.8.5-1 /etc/influxdb

RUN wget --quiet https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_amd64.tar.gz && \
    tar -xzvf telegraf-1.18.2_linux_amd64.tar.gz && \
    rm -rf telegraf-1.18.2_linux_amd64.tar.gz && \
    cp -r /telegraf-1.18.2/* /

RUN wget --quiet --output-document /etc/apk/keys/sgerrand.rsa.pub \
    https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget --quiet https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk && \
    apk add glibc-2.33-r0.apk && \
    rm -f glibc-2.33-r0.apk

RUN ./usr/bin/telegraf -sample-config --input-filter docker \
    --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
