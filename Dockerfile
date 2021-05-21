# syntax=docker/dockerfile:1

FROM debian:buster

EXPOSE 80

WORKDIR /srcs

RUN apt-get update && apt-get install -y nginx 

CMD tail -f > /dev/null
