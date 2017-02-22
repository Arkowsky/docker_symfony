#!/bin/sh

echo 'CLEARING SYMFONY CACHE AND LOGS..'
rm -rf /app/var/cache/*
rm -rf /app/var/logs/*
echo 'CACHE CLEARED!'

exec $(which nginx) -c /etc/nginx/nginx.conf -g "daemon off;"