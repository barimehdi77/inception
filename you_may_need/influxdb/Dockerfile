FROM  alpine:3.12.0

RUN apk update
RUN apk add openrc influxdb vim

RUN openrc
RUN touch /run/openrc/softlevel

ADD src/run.sh .
RUN chmod +x /run.sh


ENTRYPOINT [ "/run.sh" ]

#kubectl cp pod_name:path_to_file ./chose_name