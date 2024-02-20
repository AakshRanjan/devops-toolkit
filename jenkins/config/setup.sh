#!/bin/bash

# Run the docker clean_up.sh script
repository_path=$(git rev-parse --show-toplevel)
. repository_path/jenkins/scripts/docker/clean_up.sh

docker-compose up -d