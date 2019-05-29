#!/bin/bash

#define variables
CONTAINER_NAME=nginx
NGINX_VER=1.16.0

CONTAINER_IMAGE=nginxben

# check OS

# check docker, if no exists  - install

# check status docker???

# build container postgreUbuntu, checks no necessary
set -x
docker build -t $CONTAINER_IMAGE:$NGINX_VER --build-arg NGINX_VER=$NGINX_VER -f nginxUbuntuDocfile .

###add check
###volumes???
# run container
### ports?

#docker rm $CONTAINER_NAME 
#mkdir -p volumes/{gerrit, postgre}
#mkdir -p $(pwd)/volumes/postgre/{etc/,var\/log,var\/lib}
#mkdir -p  $(pwd)/var/lib/postgresql

### if net
docker rm -f $CONTAINER_NAME
#docker run  -d --restart=always --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER 
docker run  -d   -v $(pwd)/files/nginx.conf:/usr/local/nginx/conf/nginx.conf -p 80:80  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$NGINX_VER
#docker run  -d    -p 80:80  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$NGINX_VER

