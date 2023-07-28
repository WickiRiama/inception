#!/bin/sh

# set -x

service mariadb start
# service start mariadb
sleep 20

mysql -e "CREATE USER IF NOT EXISTS \`${MYDB_USER}\`@'%' IDENTIFIED BY '${MYDB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MY_DATABASE}\`.* TO \`${MYDB_USER}\`@'%' IDENTIFIED BY '${MYDB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MY_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MY_DATABASE}\`;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# set +x
