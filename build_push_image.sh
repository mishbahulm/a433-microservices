#!/bin/sh

# build image
docker build -t item-app:v1 .

# list local images
docker images

# create new tag name for github packages
docker tag item-app:v1 ghcr.io/mishbahulm/item-app:v1

# login to github packages
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u mishbahulm --password-stdin 

# push image to github packages
docker push ghcr.io/mishbahulm/item-app:v1