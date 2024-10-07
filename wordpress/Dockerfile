FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	curl less php
RUN apt-get install -y mariadb-client
RUN apt-get update && apt-get upgrade -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY srcs/wp-config.php /etc/php/7.3/fpm/pool.d/wp-config.php
COPY srcs/wp.sh /tmp

CMD ["sh", "/tmp/wp.sh"]
