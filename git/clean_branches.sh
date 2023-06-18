#!/bin/bash
# Cleaning local branches except master/main
# Better to be set as alias  like "grb"

MAIN_BRANCH_NAME="main"

git branch | grep -v "${MAIN_BRANCH_NAME}" | xargs git branch -D
