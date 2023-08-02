FROM debian:11

# Install nginx
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install nginx

# copy configuration file into container
COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN apt-get install openssl -y && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42Paris/CN=mriant.42.fr/UID=mriant" && \
    echo "ssl_certificate /etc/ssl/certs/inception.crt;\nssl_certificate_key /etc/ssl/private/inception.key;" > /etc/nginx/snippets/self-signed.conf

RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

COPY ./conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]