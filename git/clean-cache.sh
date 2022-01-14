#!/bin/bash

########################################
# Description:
# - Forcing to remove git cached from a .gitignore 
# (default in the same path as the script)
#
# Input Args
# - Accept 1 arg which will be the file 
# to read or the .gitignore path 
#
# Rules followed for reading files:
# - ISO/IEC 9899:2011  (file read must end with an empty file)
# + Remember adding a new line to you 
# file for avoid data loss while reading
########################################

#=============================
# ECHOES
LONGLINE="==============================================================="
# COLORS
NC="\e[0m"
RED="\e[31m"
# FILES
default=".gitignore"
FILE=$default
#=============================

# We check if a var is passed (custom path)
if ! [  -z "$1" ]
then
      FILE=$1
fi

echo "Filo to read: '$FILE'"

# We check if it exists (the file)
if ! test -f "$FILE"; then
    echo "'$FILE' does not exist... Exiting :("
    exit
fi

# We read each line ignoring comments
echo  "Removing git cache from our commit history..."
echo $LONGLINE
COUNTER=0
while IFS= read -r line; do
    if [[ "$line" != *"#"* ]]; then
        let COUNTER++
        echo  -e "[$COUNTER] Removing git cache from: '$RED$line$NC'"
        git rm --cache $line || echo -e " [ERROR] '$RED$line$NC' does not exists"
    fi
done < "$FILE"
echo $LONGLINE

# Cheking error for possibly not following ISO/IEC 9899:2011
# Bash needs that extra line, make it easy :)
if (( "$COUNTER" == "0" )) 
then
    echo "No files/dirs found."
    echo "Please check if the file ends with an empty line..."
fi
