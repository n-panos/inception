FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
	php \
	php-cgi \
	php-fpm \
	php-mysql \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
	wget \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /run/php

# Copiar archivo de configuración
COPY /conf/www.conf /var/www/html/
COPY /tools/wp.sh /tmp

RUN chmod +x /tmp/wp.sh
ENTRYPOINT ["/tmp/wp.sh"]

WORKDIR /var/www/html/

# Exponer puerto PHP-FPM
EXPOSE 9000

# Comando para ejecutar PHP-FPM en modo foreground e ignorar deamonize
CMD ["/usr/sbin/php-fpm7.3", "-F"]
