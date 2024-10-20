#!/bin/bash

<< Info
Script for user management:
1. Script should be executed with root previledge else exit
2. Exit the script in user already exist
3. First argument will be username and rest as Comment
4. Password should be auto-generated
5. at the end Print info: Username & Password
Info

USER=$(whoami)

## Chek if User is executing script as root usr, if not exit the script

if [[ ! $USER == "root" ]]
then
        echo "Error! You need root privilege"
        exit 1
fi



## Check if user has passed userName or not, if not exit the script with message

if [[ $# -lt 1 ]]
then
    echo "pass username as CLI argument"I
    exit 1
fi



## Check if already that username exist, if so exit with message

existing_user="$(cat /etc/passwd | grep $1 | awk -F : '{print $1}')"
if [[ $existing_user == $1 ]]
then
      echo "User $1 already exist"
      exit 1
fi



## Create User 

USER_NAME=$1
shift
COMMENT="$@"

# Create a temporary password and password need to be changed on first login of User
PASSWD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 12)

useradd -m $USER_NAME -c "$COMMENT" 2>/dev/null

if [[ ! $? -eq 0 ]]
then
        echo "User Creation failed"
        exit 1
else
    echo "$USER_NAME:$PASSWD" | chpasswd 
    passwd -e $USER_NAME
fi

echo "User name :: $USER_NAME"
echo "Password  :: $PASSWD"
