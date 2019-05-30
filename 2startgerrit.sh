#!/bin/bash
# app gerrit

#define variables
CONTAINER_NAME=bengerrit
CONTAINER_IMAGE=ben/gerritben
APP_VER=3.0.0
VOL1=ben_gerrit_git
VOL2=ben_gerrit_index
VOL3=ben_gerrit_cache
VOL4=ben_gerrit_etc
HOME_APP=/home/gerrit/gerrit

docker build -t $CONTAINER_IMAGE:$APP_VER --build-arg APP_VER=$APP_VER -f gerritCentosDocfile .

docker volume ls | grep -w $VOL1; [[ $? -ne 0 ]] &&  docker volume create $VOL1 && echo -e "\033[37;1;34m created volume $VOL1 \033[0m"
docker volume ls | grep -w $VOL2; [[ $? -ne 0 ]] &&  docker volume create $VOL2 && echo -e "\033[37;1;34m created volume $VOL2 \033[0m"
docker volume ls | grep -w $VOL3; [[ $? -ne 0 ]] &&  docker volume create $VOL3 && echo -e "\033[37;1;34m created volume $VOL3 \033[0m"
docker volume ls | grep -w $VOL4; [[ $? -ne 0 ]] &&  docker volume create $VOL4 && echo -e "\033[37;1;34m created volume $VOL4 \033[0m"
docker ps -a  | grep -w $CONTAINER_NAME &>/dev/null; [[ $? -eq 0 ]] && docker rm -f $CONTAINER_NAME
docker run  -d  --restart=always   -v $VOL1:$HOME_APP/git -v $VOL2:$HOME_APP/index -v $VOL3:$HOME_APP/cache -v $VOL4:$HOME_APP/etc \
             --network=gerrit-net --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$APP_VER
