#!/bin/bash

#This is a script meant to find a directory on the current folder and return the path.

echo "Enter the folder you're looking for"
read name_find

finder_que=$(ls -al | grep "$name_find")

if [ "$finder_que" ]
  then
    echo "Exists in this directory."
  else
    echo "It doesn't exist in this directory"
fi
