FROM  alpine:3.12.0

RUN apk update
RUN apk add mysql mysql-client openrc

COPY src ./tmp/
RUN mkdir -p /var/www/localhost/htdocs

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN openrc
RUN touch /run/openrc/softlevel

RUN sh tmp/db-setup.sh
ADD src/run.sh .
RUN chmod +x /run.sh


ENTRYPOINT [ "/run.sh" ]

#kubectl cp pod_name:path_to_file ./chose_name