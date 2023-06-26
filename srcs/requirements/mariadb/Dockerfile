FROM debian:11

# Install MariaDB
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server mariadb-client -y

# copy congig file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# copy launch file
COPY ./tools/start_mariadb.sh /start_mariadb.sh
RUN chmod 755 /start_mariadb.sh
RUN chmod -R 770 /var/lib/mysql && chgrp -R mysql /var/lib/mysql

CMD ["/start_mariadb.sh"]

# Run MariaDB
# RUN systemctl enable mariadb && \
#     systemctl start mariadb