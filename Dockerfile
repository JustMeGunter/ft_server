FROM debian:buster

COPY srcs/hocus_pocus.sh /
COPY srcs/start.sh /
COPY srcs/config.inc.php /
COPY srcs/nginx_config /
COPY srcs/wp-config.php /
COPY srcs/wordpress.sql /
COPY srcs/autoindexer.sh /
RUN /hocus_pocus.sh
CMD bash start.sh && tail -f > /dev/null 
