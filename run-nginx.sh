#!/bin/bash

if [ $# -ne 1 ]; then
    echo "$0 <setting file>"
    exit 1
fi

settings=$1
cdir=`cd $(dirname $0); pwd`
if [ ! -f "$settings" ]; then
    echo "setting file $settings not exists"
    exit 1
else
    source $settings
fi

if [ -n "$webroot" ]; then
    if [ ! -d "$webroot" ]; then
        echo "ERROR: '$webroot' not exists"
        exit 1
    fi
    volume="-v $webroot:/usr/share/nginx/html"
    command="exec nginx -g 'daemon off;'"
else
    volume=""
    command="echo Nginx Running: \$(hostname) > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"
fi

if [ -n "$http_port" ]; then
    http="-p $http_port:80"
fi
if [ -n "$https_port" ]; then
    https="-p $https_port:443"
fi

echo "INFO : cleaning container if exists $container_name"
docker rm --force $container_name > /dev/null 2>&1

echo "INFO : starting container $container_name .."
docker run \
    --name $container_name \
    -itd \
    $http $https \
    -v $cdir/conf.d:/etc/nginx/conf.d \
    $volume \
    nginx:latest \
    /bin/bash -c "$command"

sleep 1
docker ps -a | grep $container_name
