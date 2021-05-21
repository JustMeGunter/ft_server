#!/bin/bash

#rm -f /etc/nginx/sites-available/default
#rm -f /etc/nginx/sites-enabled/default
#cp /srcs/default /etc/nginx/sites-available/
#ln -s /etc/nginx/sites-availables/default /etc/nginx/sites-enabled/
service nginx start
service php7.3-fpm  start
service mysql start

