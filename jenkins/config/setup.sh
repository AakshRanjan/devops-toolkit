#!/bin/bash

# Run the docker clean_up.sh script
repository_path=$(git rev-parse --show-toplevel)
. ${repository_path}/jenkins/scripts/docker/clean_up.sh

# Run the docker-compose up command, to bring up the Jenkins Server.
docker-compose up --build -d