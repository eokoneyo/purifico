#!/usr/bin/env bash

# This script will stop and remove all docker containers that were started from the service image.
# It will clean up "exited" and "stopped" images as well.
# Finally, it will remove the images built from the Dockerfiles in this repo.
IMAGE_NAME="node_debug_center"

echo " ----- Stopping Docker Containers Started From Image -----"

docker ps | awk '{ print $1,$2 }' | grep ${IMAGE_NAME} | awk '{print $1 }' | xargs -I {} docker stop {}

echo " ----- Removing Docker Containers Started From Image -----"

docker ps -a | awk '{ print $1,$2 }' | grep ${IMAGE_NAME} | awk '{print $1 }' | xargs -I {} docker rm {}

echo " ----- Removing Docker Image -----"

docker rmi ${IMAGE_NAME}
