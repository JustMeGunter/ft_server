# syntax=docker/dockerfile:1

FROM debian:buster

EXPOSE 80

COPY ./srcs /srcs 

RUN apt-get update \
&& apt-get install -y nginx php7.3 php7.3-fpm mariadb-server wget

CMD bash /srcs/run_config.sh && tail -f > /dev/null
