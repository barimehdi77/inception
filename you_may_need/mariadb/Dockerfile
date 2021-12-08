FROM  alpine:3.12.0

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client openrc

COPY src ./tmp/
RUN mkdir -p /var/www/localhost/htdocs

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN openrc
RUN touch /run/openrc/softlevel

RUN /etc/init.d/mariadb setup
RUN sh tmp/db-setup.sh
RUN mv tmp/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
ADD src/run.sh .
RUN chmod +x /run.sh


ENTRYPOINT [ "/run.sh" ]