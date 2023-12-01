#!/bin/sh

# build image
docker build -t ghcr.io/mishbahulm/order-service:latest .

# login to github packages
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u mishbahulm --password-stdin

# push image to github packages
docker push ghcr.io/mishbahulm/order-service:latest