FROM debian:11

# Install nginx
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install nginx

# copy configuration file into container
COPY ./conf/nginx.conf /etc/nginx/

RUN mkdir -p /etc/nginx/ssl && \
    apt-get install openssl -y && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mriant.42.fr/UID=mriant"

# give rights to access root file and to set the owner as www-data
RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]