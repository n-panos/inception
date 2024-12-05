FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client \
&& rm -rf /var/lib/apt/lists/* \
# purge and re-create /var/lib/mysql with appropriate ownership
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/create_db.sh /usr/local/bin/
COPY ./tools/wordpress.sql /usr/local/bin/
ENTRYPOINT ["create_db.sh"]

#Command to launch mariadb and enable the database to listen globally

CMD ["mysqld", "--bind-address=0.0.0.0"]
