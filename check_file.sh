#!/bin/bash

read -p "enter the path to check if file exists or not :: " file_path

if [[ -f $file_path ]]; then
        echo "file :: $(basename $file_path) exists in path :: $(dirname $file_path | xargs realpath )"
else
        echo "file doesn't exists"
fi
