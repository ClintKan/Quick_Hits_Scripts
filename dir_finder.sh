#!/bin/bash

#This is a script meant to find a directory on the current folder and return the path.

echo "Enter the file/folder name you're looking for" #Prompt to input the name of the file/folder to be looked for
read name_find #Input of the name

finder_que=$(ls -al | grep "$name_find") #Listing the contents and then grep-ing the name of the file only and filing them

#Using an if statement to check if the file somehting exists
if [ "$finder_que" ]
  then
    echo "Exists in this directory."
  else
    echo "It doesn't exist in this directory"
fi
