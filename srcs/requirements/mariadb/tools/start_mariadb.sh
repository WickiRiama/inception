#!/bin/sh

# set -x

service mariadb start

max_tries=10
current_try=1

while !(mysqladmin ping > /dev/null) && [ $current_try -le $max_tries ]
do
    echo "Waiting for database..."
    sleep 3
    current_try=$((current_try + 1))
done

# service start mariadb
# sleep 10

mysql -e "CREATE USER IF NOT EXISTS \`${MYDB_USER}\`@'%' IDENTIFIED BY '${MYDB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MY_DATABASE}\`.* TO \`${MYDB_USER}\`@'%' IDENTIFIED BY '${MYDB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'wordpress' IDENTIFIED BY '$MY_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MY_DATABASE}\`;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# set +x
