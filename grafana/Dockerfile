FROM  alpine:3.12.0

RUN apk update
RUN apk add nginx openrc vim
RUN apk add --update binutils
RUN apk add libc6-compat

RUN mkdir -p /var/www/localhost/htdocs
RUN cd /var/www/localhost/htdocs
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.7.linux-amd64.tar.gz
RUN mv grafana-7.3.7 grafana

ADD src/run.sh .
RUN chmod +x /run.sh


ENTRYPOINT [ "/run.sh" ]