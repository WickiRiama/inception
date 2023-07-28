FROM debian:11

# update and install
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install adminer -y

# conf files
COPY ./conf/000-default.conf /etc/apache2/sites-availables//000-default.conf
RUN echo 'ServerName adminer' >> /etc/apache2/apache2.conf

# start
RUN service apache2 start && \
    a2enconf adminer.conf
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]