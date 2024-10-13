#!/bin/bash

<<description
            This Script takes backup of any destination path given in 1st argument at path given in 2nd argument
            example: ./backup_script.sh /home/ubuntu/scripts /home/ubuntu/backups
description

# Create filename using timestamp
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
backup_file=${timestamp}_backup.zip

#cd to destination directory
cd $2

#reduce size of backup
zip -r $backup_file $1

echo "Backup Complete"
