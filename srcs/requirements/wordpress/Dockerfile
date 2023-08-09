FROM debian:11

# Install php-fpm and mariaDB client
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install php-fpm php-mysql -y && \
    apt-get install mariadb-client -y

# Create the PID file
RUN mkdir /run/php

# Allow external connections
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create index.php
# COPY ./conf/index.php /var/www/html/wordpress/index.php

# Wordpress
RUN apt-get install wget -y && \
    wget https://wordpress.org/latest.tar.gz && \
    mkdir -p /var/www/html/ && \
    tar -xzvf latest.tar.gz -C /var/www/html/ && \
    rm -rf latest.tar.gz && \
    chown -R root:root /var/www/html/wordpress

# CLI Wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Wordpress config
COPY ./conf/wp_autoconfig.sh /wp_autoconfig.sh
RUN chmod +x /wp_autoconfig.sh

EXPOSE 9000

ENTRYPOINT [ "/wp_autoconfig.sh" ]
