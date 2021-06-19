#!/bin/sh

## Customizable constants

MYSQL_PASSWORD="aaaaa"
PHPMA_VERSION="5.0.1"
PHPMA_INSTALL_FOLDER="/opt"  # Will create another folder "phpmyadmin" inside
WORDP_VERSION="5.3.2"
WORDP_INSTALL_FOLDER="$PHPMA_INSTALL_FOLDER"  # Will create another folder "wordpress" inside
WORDP_SQL_USER="wordpress"
WORDP_SQL_PASSWORD="$MYSQL_PASSWORD"
TEMP_FOLDER="/tmp"

## Packages installation

apt-get -y update
apt-get -y install mariadb-server mariadb-client nginx openssl

## MySQL configuration

service mysql start
service mysql status || exit 1
mysql_secure_installation << EOF

y
$MYSQL_PASSWORD
$MYSQL_PASSWORD
y
y
y
y
EOF

# Allow password login
mysql -u root -p "$MYSQL_PASSWORD" << EOF
USE mysql;
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
FLUSH PRIVILEGES;
EOF

## PHPmyAdmin installation

# Dependencies
apt-get -y install wget unzip php php-json php-mbstring php-zip php-gd php-xml php-curl php-mysql php-fpm

mkdir -p "$TEMP_FOLDER"
cd "$TEMP_FOLDER"
wget "https://files.phpmyadmin.net/phpMyAdmin/$PHPMA_VERSION/phpMyAdmin-$PHPMA_VERSION-all-languages.zip"
unzip phpMyAdmin-$PHPMA_VERSION-all-languages.zip -d $PHPMA_INSTALL_FOLDER
rm phpMyAdmin-$PHPMA_VERSION-all-languages.zip
mv $PHPMA_INSTALL_FOLDER/phpMyAdmin-$PHPMA_VERSION-all-languages $PHPMA_INSTALL_FOLDER/phpmyadmin
mv -v /config.inc.php $PHPMA_INSTALL_FOLDER/phpmyadmin
chown -R www-data:www-data $PHPMA_INSTALL_FOLDER/phpmyadmin
ln -sv $PHPMA_INSTALL_FOLDER/phpmyadmin /var/www/html

# Database configuration
mysql -u root -p"$MYSQL_PASSWORD" << EOF
SOURCE $PHPMA_INSTALL_FOLDER/phpmyadmin/sql/create_tables.sql;
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'aaaaa';
FLUSH PRIVILEGES;
EOF

## Nginx config

mv -v /nginx_config /etc/nginx/sites-available/default

##  Wordpress installation

cd "$TEMP_FOLDER"
wget "https://wordpress.org/wordpress-$WORDP_VERSION.tar.gz"
tar xf wordpress-$WORDP_VERSION.tar.gz -C "$WORDP_INSTALL_FOLDER"
rm wordpress-$WORDP_VERSION.tar.gz
chown -R www-data:www-data $WORDP_INSTALL_FOLDER/wordpress
ln -sv $WORDP_INSTALL_FOLDER/wordpress /var/www/html

# Configuration
mv -v /wp-config.php $WORDP_INSTALL_FOLDER/wordpress

# Database configuration
mysql -u root -p"$MYSQL_PASSWORD" << EOF
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO '$WORDP_SQL_USER'@'localhost' IDENTIFIED BY '$WORDP_SQL_PASSWORD';
FLUSH PRIVILEGES;
USE wordpress;
SOURCE /wordpress.sql;
EOF
rm /wordpress.sql

## SSL certificate

mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt << EOF
ES
Madrid
Madrid
a
a
localhost
a@a.a
EOF
