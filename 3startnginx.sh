#!/bin/bash

#define variables
CONTAINER_NAME=bennginx
NGINX_VER=1.16.0
CONTAINER_IMAGE=ben/nginx

#set -x
docker build -t $CONTAINER_IMAGE:$NGINX_VER --build-arg NGINX_VER=$NGINX_VER -f nginxUbuntuDocfile .

docker ps -a  | grep -w $CONTAINER_NAME &>/dev/null; [[ $? -eq 0 ]] && docker rm -f $CONTAINER_NAME
docker run  -d --restart=always  -v $(pwd)/files/nginx.conf:/usr/local/nginx/conf/nginx.conf -p 80:80  \
               --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$NGINX_VER

