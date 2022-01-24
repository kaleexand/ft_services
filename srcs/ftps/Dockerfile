FROM alpine:3.12

RUN apk update && apk --update --no-cache add openssl vsftpd

RUN openssl req -x509 -newkey rsa:2048 -nodes -sha256 \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \
    -subj "/CN=localhost"

RUN echo 'root:root' | chpasswd

EXPOSE 21 30021 30022 30023

ENTRYPOINT ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
