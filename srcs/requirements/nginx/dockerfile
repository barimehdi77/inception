FROM  alpine:3.12.0

# Update System and Install Tools
RUN apk update
RUN apk add nginx openrc vim openssl

# Create the root folder for nginx
RUN mkdir -p /var/www/html/

# change owner of The folder to nginx user
RUN chown -R nginx:nginx /var/lib/nginx
RUN chown -R nginx:nginx /var/www/html

# COPY Files to container
COPY ./conf/nginx.conf /etc/nginx/

# start openrc
RUN openrc
RUN touch /run/openrc/softlevel

# Create folder
RUN mkdir -p /run/nginx

# Copy installing script and make it executable
COPY tools/run.sh /
RUN chmod +x ./run.sh

ENTRYPOINT [ "./run.sh" ]
