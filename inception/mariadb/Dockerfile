FROM alpine:3.12.0
RUN apk update
RUN apk add mariadb mariadb-common mariadb-client openrc
COPY src ./tmp/
RUN openrc
RUN touch /run/openrc/softlevel
ADD src/run.sh .
COPY src/wordpress.sql .
RUN chmod +x /run.sh
ENTRYPOINT [ "./run.sh" ]
