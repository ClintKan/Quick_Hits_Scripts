#!/bin/bash

#This script is intended to copy all files in ~/quick_scripts
#Files to be copied should be regular text files
#Will need to declare what and where I want to back it up to
#Pre-req - the backup dir exists
#When copying regular files, show it's copying. If not, skip.


source_folder="/home/ubuntu/quick_scripts" #the folder from which we are copying from.
destination="/home/ubuntu/backup" #the folder to which the folders are going to be copied into - prior to backing up.

mkdir -p "$destination" #the creation of the destination folder.

for files in "$source_folder"/*
do
	if [ -f "$files" ] #-f the flag -f checks if the files are regular files
	then
	    cp "$files" "$destination" # copying regular files to the destination
	    echo ""$files" has been copied."
	else
	    echo "File "$files" skipped - not regular."
	fi
done

