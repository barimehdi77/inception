FROM alpine:3.12.0

# Update System and Install Tools
RUN apk update
RUN apk add mariadb mariadb-common mariadb-client openrc

# start openrc
RUN openrc
RUN touch /run/openrc/softlevel

# COPY Files to container
COPY conf/wordpress.sql .

# Copy installing script and make it executable
ADD tools/run.sh .
RUN chmod +x /run.sh

ENTRYPOINT [ "./run.sh" ]
