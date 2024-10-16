#!/bin/bash

<< comment
This is script for backup with 7 days rotation
example: bash backup.sh <source_path> <backup_folder_path>
comment

if [[ $# -lt 2 ]];then
        echo "format: bash backup.sh <source_path> <backup_folder_path>"
fi

###### Create backup

source_path=$1
dest_path=$2
backup_timestamp=$(date '+%Y-%m-%d_%H_%M_%S')

tar -cvf "${dest_path}/backup_${backup_timestamp}.tar.gz" $source_path > /dev/null

if [[ $? -eq 0 ]]; then
        echo "Backup taken sucessfully, time :: ${backup_timestamp}"
fi

##### Perform Rotation
# get all backups in an array

backups=($(ls -t "${dest_path}/backup_"*.tar.gz ))

# echo "${backups[*]}"


# if length of array is -gt 7 then slice the array from 7th index and collect them and delete

if [[ "${#backups[*]}" -gt 7 ]]; then
       
         # echo "perform backup rotation for 7 days"
        
         remove_backup=("${backups[*]:7}")

        # echo "${remove[*]}"

        for backup in "${remove_backup[*]}";
        do
                rm -f $backup
        done

        echo "Rotation done"
fi
