#!/bin/bash
#remove all docker containers for APP
#define variables
NETWORK=gerrit-net
IMAGE_PART=ben/
VOL_PART=ben_

#set -x
echo -e "\033[37;1;33m remove containers in network $NETWORK \033[0m"
docker kill $(docker ps -qf network=$NETWORK) &&

echo -e "\033[37;1;33m remove images \033[0m"
docker images | grep $IMAGE_PART | awk '{print $3}'| xargs docker rmi -f &&

echo -e "\033[37;1;33m CLEAN - docker system prune/rm containers \033[0m"
docker system prune -f &&

echo -e "\033[37;1;33m remove volume  \033[0m"
docker volume rm -f $(docker volume ls | grep $VOL_PART| awk '{print $2}') 


