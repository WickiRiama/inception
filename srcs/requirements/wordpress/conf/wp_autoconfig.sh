#!/bin/bash

# sleep 10 # Wait for MariaDB to start

echo coucou
if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
    cd /var/www/html/wordpress
    echo a
    wp config create --allow-root \
                     --dbname=$MY_DATABASE \
                     --dbuser=$MYDB_USER \
                     --dbpass=$MYDB_PASSWORD \
                     --dbhost=mariadb:3306
    # sleep 5
    echo b
    wp core install --url=mriant.42.fr \
                    --title=INCEPTION \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --skip-email \
                    --allow-root
    echo c
    wp user create $WP_USER $WP_USER_EMAIL \
                   --user_pass=$WP_USER_PASSWORD \
                   --role=$WP_USER_ROLE \
                   --porcelain \
                   --allow-root
    echo d
fi

exec php-fpm7.4 -F