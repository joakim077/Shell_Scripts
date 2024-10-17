#!/bin/bash

## script to check connectivity of an website

read -p "Enter the URL :: " url

ping -c 1 $url >/dev/null

if [[ $? -eq 0 ]];  then
        echo "Sucessfully connected to $url"
else

        echo "Unable to connect to $url"
fi
