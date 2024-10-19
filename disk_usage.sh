#!/bin/bash

<< diskUsage
Monitor the disk usage and give report
diskUsage

USED_DISK_PERCENT=$(df -h | grep "/dev/vda1" |head -n1 | awk '{print $5}' | tr -d %)
FREE_DISK_SIZE=$(df -h | grep "/dev/vda1" |head -n1 | awk '{print $4}')
FREE_DISK_PERCENT=$((100-$USED_DISK_PERCENT))

#echo "$FREE_DISK_PERCENT"


if [[ $FREE_DISK_PERCENT -gt 90 ]]
then
        echo "Enough disk space   : $FREE_DISK_SIZE"
else
        echo -e "WARNING! disk space is running low \nRemaining Disk Size : $FREE_DISK_SIZE"
fi
