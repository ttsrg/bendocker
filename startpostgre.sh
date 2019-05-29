#!/bin/bash

#define variables
POSTGRE_VER=10
JAVA_VER=8
CONTAINER_NAME=benpostgre
CONTAINER_IMAGE=ben/postgre

# check OS

# check docker, if no exists  - install

# check status docker???

# build container postgreUbuntu, checks no necessary
set +x
docker build -t $CONTAINER_IMAGE:$POSTGRE_VER --build-arg POSTGRE_VER=$POSTGRE_VER -f postgreUbuntuDocfile .

###add check
###volumes???
# run container
### ports?

#docker rm $CONTAINER_NAME 
#mkdir -p volumes/{gerrit, postgre}
#mkdir -p $(pwd)/volumes/postgre/{etc/,var\/log,var\/lib}
#mkdir -p  $(pwd)/var/lib/postgresql

### if net
docker network ls | grep gerrit-net ; [[ $? -ne 0 ]] &&  docker network create gerrit-net &&  echo -en "\033[37;3;42m docker network has created \033[0m"
docker volume ls | grep -w benpostgresql; [[ $? -ne 0 ]] &&  docker volume create benpostgresql && echo -en " created volume benpostgresql"
docker volume ls | grep -w benpostgreetc; [[ $? -ne 0 ]] &&  docker volume create benpostgreetc && echo -en " created volume benpostgreetc"
docker volume ls | grep -w benpostgrelog; [[ $? -ne 0 ]] &&  docker volume create benpostgrelog && echo -en " created volume benpostgrelog"
docker ps | grep -w $CONTAINER_NAME; [[ $? -ne 1 ]] && docker rm -f $CONTAINER_NAME
#docker run  -d --restart=always --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER 
#docker run  -d  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER 
docker run  -d  -v benpostgresql:/var/lib/postgresql -v benpostgreetc:/etc/postgresql -v benpostgrelog:/var/log/postgresql  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER

#docker run  -d -v $(pwd)/volumes/postgre/etc:/etc/postgresql -v $(pwd)/volumes/postgre/var/log:/var/log/postgresql -v $(pwd)/volumes/postgre/var/lib:/var/lib/postgresql  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER
