#!/bin/bash

#=======================================================+
# Purpose: Deploy a docker-compose using .env configs   |
# Requirements: To have docker installed                |
# Globals:                                              |
#   - ENV_FILE_PATH : Path for our .env file            |
#----------------   ---------------   ----------------  |
#...EhLui...                                            |
#=======================================================+
ENV_FILE_PATH=.env


removeContainer(){
    echo -n "Enter container's name to delete: "
    #0. Ask for containers name
    read first_name
    # 1. Removing all containers from the appTask related
    docker rm -f $(docker ps -aq -f name=$first_name)
}

compose(){
if [ -f "$ENV_FILE_PATH" ]; then
    echo "$ENV_FILE_PATH exists."
    # 2. Variables defined in `.env` will be exported
    # into this script's environment:
    set -a
    source .env
    # 3. Let's populate the variables in our compose-file template
    # (reading the .env exported through docker-compose) then deploy it!
    < docker-compose.yml envsubst | docker-compose -f - -p todoapp up -d
else 
    echo "$ENV_FILE_PATH does not exist."
fi
}


# 1. Check whether we need to remove the container
while true; do
    read -p "Do you want to remove a container? (y/n):  " yn
    case $yn in
        [Yy]* ) removeContainer; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n.";;
    esac
done

# 2. Perform the docker-compose with the ENV_FILE_PATH if it exists
compose()

# --------------------------------------------------------------------------------
# Docker compose docs:
#  - Use a -f with - (dash) as the filename to read the configuration from stdin.