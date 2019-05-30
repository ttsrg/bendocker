#!/bin/bash

#define variables
POSTGRE_VER=10
JAVA_VER=8
CONTAINER_NAME=benpostgre
CONTAINER_IMAGE=ben/postgre

#set +x
docker build -t $CONTAINER_IMAGE:$POSTGRE_VER --build-arg POSTGRE_VER=$POSTGRE_VER -f postgreUbuntuDocfile .

docker network ls | grep gerrit-net ; [[ $? -ne 0 ]] &&  docker network create gerrit-net &&  echo -e "\033[37;1;44m  docker network has created \033[0m"
docker volume ls | grep -w ben_postgre_sql; [[ $? -ne 0 ]] &&  docker volume create ben_postgre_sql && echo -e "\033[37;1;34m created volume ben_postgre_sql \033[0m"
docker volume ls | grep -w ben_postgre_etc; [[ $? -ne 0 ]] &&  docker volume create ben_postgre_etc && echo -e "\033[37;1;34m created volume ben_postgre_etc \033[0m"
docker volume ls | grep -w ben_postgre_log; [[ $? -ne 0 ]] &&  docker volume create ben_postgre_log && echo -e "\033[37;1;34m created volume ben_postgre_log \033[0m"
docker ps -a  | grep -w $CONTAINER_NAME &>/dev/null; [[ $? -eq 0 ]] && docker rm -f $CONTAINER_NAME

docker run  -d --restart=always  -v benpostgresql:/var/lib/postgresql -v benpostgreetc:/etc/postgresql -v benpostgrelog:/var/log/postgresql  --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER

