#!/usr/bin/env bash
# PURPOUSE:
# Small script to know which OS we are in
# Linux-like, Mac-like, Windows-like or Cygwin-like
# 
# 'OSTYPE' in Bash 
# Automatically set to a string that describes 
# the operating system on which bash is executing. 
# The default is system-dependent.
# ------------------------------------------------------------------
# EhLui

gnu_linux_os='GNU-Linux'
mac_os='Mac-OS'
posix='Cygwin-POSIX'
windows='Windows'


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   echo $gnu_linux_os
elif [[ "$OSTYPE" == "darwin"* ]]; then
   echo $mac_os
elif [[ "$OSTYPE" == "cygwin" ]]; then
   echo $posix
elif [[ "$OSTYPE" == "msys" ]]; then
   echo $windows
fi