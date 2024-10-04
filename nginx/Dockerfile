FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -out /etc/ssl/nginx-selfsigned.crt -keyout /etc/ssl/nginx-selfsigned.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42 School/OU=42Madrid/CN=ipanos"

COPY ./srcs/nginx.conf ./etc/nginx/sites-enabled/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
