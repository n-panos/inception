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

RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz \
    && mv wordpress /var/www/html/wordpress \
    && rm latest.tar.gz
RUN chown -R www-data:www-data /var/www/html/wordpress \
    && chmod -R 755 /var/www/html/wordpress

# Copiar archivo de configuración wp-config.php personalizado
COPY /srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY /srcs/wp.sh /tmp/wp.sh

# Exponer puerto PHP-FPM (si estás usando PHP-FPM)
EXPOSE 9000

# Comando para ejecutar PHP-FPM en modo foreground
CMD ["sh", "/tmp/wp.sh"]
