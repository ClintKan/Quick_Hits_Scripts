#!/bin/bash

# A script that checks the existence of a file, then prints its size if exists

echo "This scripts checks for the existence of a file and then returns its size if it exists"
echo " "

echo "Input the path of, and to, the file to be checked"
echo "Something like; /absolute/path/to/folder/name-of-the-file.extension"
read usr_input
echo " "

echo "Checking if file exists..."
echo " "
file_size=$(du -h $usr_input | awk '{print $1}')

if [[ -e $usr_input ]]; then
    echo "Size of $usr_input: $file_size"
else
    echo "File '$usr_input' doesn't exist."
fi
