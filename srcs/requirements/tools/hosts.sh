#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
RESET='\033[0m'

conf="127.0.0.1 bcho.42.fr"
hosts_path="/etc/hosts"

if [ ! -e "${hosts_path}" ]; then
    touch "${hosts_path}"
fi

LINE=$(grep -cx "${conf}" "${hosts_path}")

if [ ${LINE} -eq 0 ]; then
    echo -e "${RED}--------------------
Error: Failed to add ${conf} to ${hosts_path}.
--------------------${RESET}" >&2
else
    echo -e "${GREEN}--------------------
Success: ${conf} added to ${hosts_path}.
--------------------${RESET}"
fi