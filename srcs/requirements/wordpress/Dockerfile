FROM debian:11

# Install php-fpm and mariaDB client
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install php-fpm  -y && \
    apt-get install mariadb-client -y

# Create the PID file
RUN mkdir /run/php

# Allow external connections
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create index.php
# COPY ./conf/index.php /var/www/html/wordpress/index.php

# Wordpress
RUN apt-get install wget -y && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www/ && \
    tar -xvf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress

# CLI Wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Wordpress config
COPY ./conf/wp_autoconfig.sh /wp_autoconfig.sh
RUN chmod +x /wp_autoconfig.sh

EXPOSE 9000

ENTRYPOINT [ "/wp_autoconfig.sh" ]
