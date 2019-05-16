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

#docker rm $CONTAINER_NAME 
docker run  -d --restart=unless-stopped --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER 
