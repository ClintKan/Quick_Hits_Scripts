#!/bin/bash

#A script that checks the permissions of a file

echo "What is the name of the file?"
read file_name

echo $(ls -al $file_name |  awk '{print $1}')

