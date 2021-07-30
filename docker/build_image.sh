#!/bin/bash
# PURPOUSE:
# Build a docker image from custom settings
# Only need to be changed some variables content:
# - image_name 
# - dockerfile_path (if you really need it)
# -----eHLui-----

CYAN='\033[0;36m'
NO_COLOR='\033[0m'
command_log_sym="$CYAN[COMMAND]$NO_COLOR ->"
info_log_sym="$CYAN[INFO]$NO_COLOR ->"
no_images_deleted="No images were created"

image_name="YOUR_IMAGE_NAME"
dockerfile_path="."

building_img_cmd="docker image build $dockerfile_path -t $image_name"

build_image(){
  while true; do
      read -p  "Do you need to build the image? [y/n]: " opt
      case $opt in
          [Yy]* ) 
                echo -e $command_log_sym $building_img_cmd
                $building_img_cmd
                break
                ;;
          [Nn]* )
                echo -e $info_log_sym $no_images_deleted
                break
                ;;
          * ) echo "Please answer yes or no. [y/n]";;
      esac
  done
}

build_image
