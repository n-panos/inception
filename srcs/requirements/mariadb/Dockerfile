FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client \
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./tools/db_init.sh /usr/local/bin/
COPY ./conf/wp.sql /usr/local/bin/

RUN chmod +x /usr/local/bin/db_init.sh

ENTRYPOINT ["/usr/local/bin/db_init.sh"]


CMD ["mysqld", "--bind-address=0.0.0.0"]
