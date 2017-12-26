#!/bin/bash

if [ $# -ne 1 ]; then
   echo "Usage: $0 email@address.com"
   exit 1
fi   

read -s -p "Password: " password
echo
./setup.sh -i tvial/docker-mailserver:2.2 -c mail email add $1 $password
