FROM debian:buster

#RUN apt-get update && apt-get install -y curl
RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -out /etc/ssl/nginx-selfsigned.crt -keyout /etc/ssl/nginx-selfsigned.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42_Madrid/CN=ipanos.42.fr"

RUN rm -rf /etc/nginx/sites-enabled/*

COPY ./srcs/nginx.conf ./etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
