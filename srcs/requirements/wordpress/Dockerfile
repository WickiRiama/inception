FROM debian:11

# Install php-fpm
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install php-fpm  -y

# Create the PID file
RUN mkdir /run/php

# Allow external connections
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create index.php
COPY ./conf/index.php /var/www/html/wordpress/index.php

EXPOSE 9000

ENTRYPOINT [ "php-fpm7.4", "-F" ]
