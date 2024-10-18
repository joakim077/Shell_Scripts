#!/bin/bash

# create a temp file
filename=$(mktemp)

trap "rm -r $filename" EXIT
echo "Content of tem file" > $filename
cat $filename

# error redirection
read -p "[ enter a command to be executed ] " cmd

$cmd 2> /home/ubuntu/log.txt

# custom erro message
if [[ ! $? -eq 0 ]] 
then 
        echo "command $cmd cannot be executed "
fi
# exit the script
exit 1
