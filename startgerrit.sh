#!/bin/bash

#define variables
#JAVA_VER=8
CONTAINER_NAME=gerrit
CONTAINER_IMAGE=gerritben

# check OS

# check docker, if no exists  - install

# check status docker???

# build container postgreUbuntu, checks no necessary
set +x
docker build -t $CONTAINER_IMAGE  -f gerritCentosDocfile .

###add check
###volumes???
# run container
### ports?

#docker rm $CONTAINER_NAME 
docker rm -f $CONTAINER_NAME
#docker run  -d --restart=unless-stopped --name=$CONTAINER_NAME  $CONTAINER_IMAGE
docker run  -d -p 8080:8080  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE
