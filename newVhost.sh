#!/bin/bash

echo "Please specify the domain of this site"
read DOMAIN

mkdir -p /srv/www/$DOMAIN/application
mkdir -p /srv/www/$DOMAIN/application/public
mkdir -p /srv/www/$DOMAIN/application/log
mkdir -p /srv/www/$DOMAIN/application/tmp
mkdir -p /srv/www/$DOMAIN/logs
mkdir -p /srv/www/$DOMAIN/public

cp ./nginx.conf.template /opt/nginx/sites-config/$DOMAIN.conf

sed -i "s/SERVER/$DOMAIN/g" /opt/nginx/sites-config/$DOMAIN.conf

ln -s /srv/www/$DOMAIN/ /root/Vhosts
touch /srv/www/$DOMAIN/application/sinatra.log && chmod 0777 /srv/www/$DOMAIN/application/sinatra.log && chown nobody /srv/www/$DOMAIN/application/sinatra.log

/etc/init.d/nginx reload

echo -e "\nSite Created for $DOMAIN"
echo "--------------------------"
echo "Host: "`hostname`
echo "URL: $DOMAIN"
echo "--------------------------"
exit 0;
