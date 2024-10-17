#!/bin/bash

read -p "Enter the path of logfile :: " logfile

#function to Print Number of times ERROR

function count_and_print_erros {
        no_of_errors=$(cat $logfile | grep "ERROR" | awk '{print NR}' | wc | awk '{print $1}')
        echo "Total number of Errors :: $no_of_errors"
}

function search_keyword {
        read -p "Enter keyword you want to search for :: " keyword
        echo "$(cat $logfile | grep "$keyword")" 
}

if [[ -f $logfile ]]
then
        count_and_print_erros $logfile
        search_keyword $keyword
else
        echo "File does not exist "
fi
