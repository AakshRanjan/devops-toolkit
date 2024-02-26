#!/bin/bash

# Stop and remove all running containers
if [ "$(docker ps -q)" ]; then
    docker stop $(docker ps -q)
    docker rm -f $(docker ps -aq)
fi

# Remove all images
if [ "$(docker images -q)" ]; then
    docker rmi -f $(docker images -aq)
fi

# Remove all volumes
if [ "$(docker volume ls -q)" ]; then
    docker volume rm $(docker volume ls -q)
fi

# Remove all networks
if [ "$(docker network ls -q)" ]; then
    docker network rm $(docker network ls -q)
fi

# Remove all dangling images
if [ "$(docker images -q -f dangling=true)" ]; then
    docker image prune -f
fi

# Remove all dangling volumes
if [ "$(docker volume ls -q -f dangling=true)" ]; then
    docker volume prune -f
fi

# Remove all dangling networks
if [ "$(docker network ls -q -f dangling=true)" ]; then
    docker network prune -f
fi

# Remove all dangling containers
if [ "$(docker ps -aq -f status=exited)" ]; then
    docker system prune -f
fi