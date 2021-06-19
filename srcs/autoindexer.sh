#!/bin/bash
if [ $1 = "on" ]; then
	sed -i 's/autoindex off/autoindex on/' nginx_config
elif [ $1 = "off" ]; then
	sed -i 's/autoindex on/autoindex off/' nginx_config
fi
service nginx reload
