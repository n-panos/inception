FROM debian:buster

ARG DB_DATABASE
ARG DB_USERPASS
ARG DB_USER
ARG DB_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN mkdir -p /var/run/mysql
RUN chown -R mysql:mysql /var/run/mysql
RUN service mysql start

COPY ./srcs/my.cnf /etc/mysql/my.cnf
EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]
