#!/usr/bin/env bash
# PURPOUSE:
# Small script to get your current private IP
# in Linux
# OUTPUT:
# Generates a file: my_private_ip.txt
# COMMANDS:
# Mainly using -> ip addr show
# ------------------------------------------------------------------
# EhLui

get_private_ip(){
   file_name='my_private_ip.txt'
   cmd=`ip addr show | grep inet  | grep -i 'global dynamic'  | cut -c 10-23`
   echo $cmd > $file_name
   cat $file_name
}

get_private_ip