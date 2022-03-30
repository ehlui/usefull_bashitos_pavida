#!/usr/bin/env bash
# PURPOUSE:
# Small script to check the 
# restart policy of the docker containers
# COMMANDS:
# list_containers  -> "docker ps -a"
# filter_by_names  -> "awk '{print $NF}'"
# remove_first_row -> "tail -n +2" # or just filter from the 2nd row
# ------------------------------------------------------------------
# EhLui

create_array() {
     # use nameref for indirection
    local -n containers_names=$1
    containers_names=($(docker ps -a | awk '{print $NF}' | tail -n +2))
}
list_containers_restart_policy() {
    local container_list_of_names
    # func_with_array  variable_to_populate
    create_array container_list_of_names       # call function to populate the array

    for item in "${container_list_of_names[@]}"; do
       data=$(docker inspect -f "{{ .HostConfig.RestartPolicy.Name }}" "${item}")
       echo "Container: ${item} / RestartPolicy: ${data}"
    done
}
 
list_containers_restart_policy