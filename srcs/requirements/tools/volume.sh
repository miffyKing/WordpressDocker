#!/bin/bash

volume_path="/home/bcho/data"

#if [ "$(uname)" == "Darwin" ]; then
#    volume_path="/Users/bcho/goinfree/docker_study/inception2/data"
#fi

wordpress_path="${volume_path}/wordpress"
mariadb_path="${volume_path}/mariadb"

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ ! -d "${wordpress_path}" ]; then
    mkdir -p "${wordpress_path}"
fi
if [ ! -d "${mariadb_path}" ]; then
    mkdir -p "${mariadb_path}"
fi

if [ -d "${wordpress_path}" ] && [ -d "${mariadb_path}" ]; then
    echo -e "${GREEN}Volume directories created successfully:${NC}"
    echo -e "${GREEN}- ${wordpress_path}${NC}"
    echo -e "${GREEN}- ${mariadb_path}${NC}"
else
    echo -e "${RED}Volume directory creation failed.${NC}" 1>&2
fi
