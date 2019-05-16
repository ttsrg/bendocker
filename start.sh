#!/bin/bash

#define variables
POSTGRE_VER=10
JAVA_VER=8
CONTAINER_NAME=postgreben


# check OS

# check docker, if no exists  - install

# check status docker???

# build container postgreUbuntu, checks no necessary

docker build -t postgretit:$POSTGRE_VER --build-arg POSTGRE_VER=$POSTGRE_VER -f postgreUbuntuDocfile .


###add check
# run container

docker run postgretit:$POSTGRE_VER --restart=unless-stopped --name=$CONTAINER_NAME
