#!/bin/bash

# Remove all running containers
docker rm -f $(docker ps -aq)

# Remove all images
docker rmi -f $(docker images -aq)

# Remove all volumes
docker volume rm $(docker volume ls -q)

# Remove all networks
docker network rm $(docker network ls -q)

# Remove all dangling images
docker image prune -f

# Remove all dangling volumes
docker volume prune -f

# Remove all dangling networks
docker network prune -f

# Remove all dangling containers
docker system prune -f