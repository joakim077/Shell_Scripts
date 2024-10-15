#!/bin/bash

# This is comment used to provide information to user and is not part of script
<< comment1
this is multiline comment
You can use any word instead of commnet in first line
provided that you use the same word to close this multiline commnet
comment1

#echo: echo is used to print in terminal

echo "Hello from shell Scripting"

# variables: variables are used to store data or values that can be reused throughout the script.
# syntax: variable_name=value

role=devops
cloud=aws

# using varible in script: use $ sign before variable name

echo "role  :: $role"
echo "cloud :: $cloud"

<< comment2
script for taking two varibles and print their sum
read is used to take input from
for adding two numbers:
Arithmetic Expansion :: $((num1+num2))
Using let            :: let sum=num1+num2
comment2


read -p "enter the number 1 :: " num1
read -p "enter the number 2 :: " num2
sum=$((num1 + num2))
echo "sum of $num1 and $num2 is: $sum"

# there are many built-in variables in OS, environment varibles which declared and assingned values, we can use them directly
# list all the varibles using printenv command
# printenv

# using built-in variables

echo "users shell is :: $SHELL"

echo "users home dir :: $HOME"

echo "list of all paths where shell looks for executables :: $PATH "

#Wild Cards
<< comment3
* matches any number of character
? mataches only one character
^arg matches any line starting with "arg"
$arg matches any line ending with "arg"
comment3

# list all the files with particular extension: eg. .txt
read -p "enter in which path you want to list all the .txt files :: " path_name
cd $path_name
ls *.txt

