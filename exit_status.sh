#!/bin/bash

read -p "Enter the directory you want to create :: " dir

mkdir -p $dir

if [[ $? -eq 0 ]]
then
        echo "Directory $dir Created" 
else
        echo "Directory $dir cannot be created"
fi
