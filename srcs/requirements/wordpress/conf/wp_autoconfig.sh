#!/bin/bash

sleep 10 # Wait for MariaDB to start

if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
    wp config create --allow-root \
                     --dbname=$MY_DATABASE \
                     --dbuser=$MYDB_USER \
                     --dbpass=$MYDB_PASSWORD \
                     --dbhost=mariadb:3306 \
                     --path='/var/www/html/wordpress'
    sleep 5
    wp core install --url=mriant.42.fr \
                    --title=INCEPTION \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --allow-root \
                    --path='/var/www/html/wordpress'


    wp user create $WP_USER $WP_USER_EMAIL --allow-root \
                   --user_pass=$WP_USER_PASSWORD \
                   --role=$WP_USER_ROLE \
                   --porcelain \
                   --path='/var/www/html/wordpress'

fi

exec php-fpm7.4 -F