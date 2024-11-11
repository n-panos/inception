FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	curl \
	php \
	php-fpm \
	php-mysql \
	wget \
	unzip \
	&& apt-get clean

RUN apt-get install -y mariadb-client
RUN mkdir -p /var/www/html/wordpress

# Descargar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

# Copiar archivo de configuración
COPY /srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY /srcs/wp.sh /tmp

# Exponer puerto PHP-FPM (si estás usando PHP-FPM)
EXPOSE 9000

# Comando para ejecutar PHP-FPM en modo foreground
CMD ["sh", "/tmp/wp.sh"]
