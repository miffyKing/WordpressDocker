#!/bin/bash

volume_path="/home/bcho/data"
if [ "$(uname)" == "Darwin" ]; then
    volume_path="/Users/bcho/goinfree/docker_study/inception2/data"
fi
wordpress_path="${volume_path}/wordpress"
mariadb_path="${volume_path}/mariadb"

conf="127.0.0.1 bcho.42.fr"
hosts_path="/etc/hosts"

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Remove directories
rm -rf "$wordpress_path" "$mariadb_path"

# Delete the specified line from hosts file
sed -i.bak "/${conf}/d" "$hosts_path" 2>/dev/null || \
sed -i "/${conf}/d" "$hosts_path"

# Print output message
echo -e "--------------------"
echo -e "${GREEN}@fclean done${NC}"
echo -e "--------------------"