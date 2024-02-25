#!/bin/bash

# Source from the .env file
source .env

# Run the docker clean_up.sh script
. ${repository_path}/jenkins/scripts/docker/clean_up.sh

# Create a directory to mount 
mkdir -p ${jenkins_data_path}
mkdir -p ${jenkins_certs_path}

# Run the docker-compose up command, to bring up the Jenkins Server.
docker-compose up --build -d