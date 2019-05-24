#!/bin/bash

#define variables
POSTGRE_VER=10
JAVA_VER=8
CONTAINER_NAME=postgre
CONTAINER_IMAGE=postgreben

# check OS

# check docker, if no exists  - install

# check status docker???

# build container postgreUbuntu, checks no necessary
set +x
docker build -t $CONTAINER_IMAGE:$POSTGRE_VER --build-arg POSTGRE_VER=$POSTGRE_VER -f postgreUbuntuDocfile .
# docker build -t postgreben:ver --build-arg POSTGRE_VER=10 -f postgreUbuntuDocfile .

###add check
###volumes???
# run container
### ports?

#docker rm $CONTAINER_NAME 
#mkdir -p volumes/{gerrit, postgre}
#mkdir -p $(pwd)/volumes/postgre/{etc/,var\/log,var\/lib}
mkdir -p  $(pwd)/var/lib/postgresql

### if net
docker network create gerrit-net
docker volume create posvol
docker rm -f $CONTAINER_NAME
#docker run  -d --restart=always --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER 
#docker run  -d  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER 
docker run  -d  -v posvol:/var/lib/postgresql  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER

#docker run  -d -v $(pwd)/volumes/postgre/etc:/etc/postgresql -v $(pwd)/volumes/postgre/var/log:/var/log/postgresql -v $(pwd)/volumes/postgre/var/lib:/var/lib/postgresql  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER
