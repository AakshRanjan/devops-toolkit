#!/bin/bash

# Run the docker clean_up.sh script
repository_path=$(git rev-parse --show-toplevel)
. ${repository_path}/jenkins/scripts/docker/clean_up.sh

# Create a directory to mount 
mkdir -p ${HOME}/workspace/jenkins-data
mkdir -p ${HOME}/workspace/jenkins-certs

# Run the docker-compose up command, to bring up the Jenkins Server.
export repository_path
docker-compose up --build -d
