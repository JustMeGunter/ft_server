#!/bin/bash
cp /srcs/default /etc/nginx/sites-available/ 
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-avaliable/default /etc/nginx/sites-enabled/
service nginx start
