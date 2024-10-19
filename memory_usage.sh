#!/bin/bash

<< info
Script for checking status of RAM of the system
info

MEM_LMT=500

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')
FREE_MEM=$(free -mt | grep "Mem" | awk '{print $4}')

#echo "free memory : $FREE_MEM Mi"
#echo "free space  : $FREE_SPACE Mi"
# space = memory + Swap memory

MEM=$FREE_MEM

if [[ $MEM -lt MEM_LMT ]]
then
        echo "WARNING: RAM is running low : $MEM Mi"
else
        echo "RAM space is sufficient : $MEM Mi"
fi
