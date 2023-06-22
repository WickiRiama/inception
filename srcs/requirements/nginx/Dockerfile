FROM debian:11

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install nginx

COPY ./conf/nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]