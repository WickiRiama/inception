#!/bin/bash

sleep 10 # Wait for MariaDB to start

if [ ! -f wp-config.php ]
then
    wp config create --allow-root \
                     --dbname=$MY_DATABASE \
                     --dbuser=$MYDB_USER \
                     --dbpass=$MYDB_PASSWORD \
                     --dbhost=mariadb:3306 \
                     --path='/var/www/wordpress'
fi

php-fpm7.4 -F