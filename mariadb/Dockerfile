FROM debian:buster

ARG DB_DATABASE
ARG DB_USERPASS
ARG DB_USER
ARG DB_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql
RUN service mysql start \
        && mysql -u root -e  "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
                ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
                GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USERPASS'; \
                FLUSH PRIVILEGES;"

COPY ./srcs/my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]
