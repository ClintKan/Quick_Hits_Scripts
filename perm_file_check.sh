#!/bin/bash

#A script that checks the permissions of a file

echo "What is the name of the file?"
read file_name

echo $(ls -al $file_name | awk '{print $1}')

if [ -r $file_name ]
 then
   echo "The file" $file_name "is readable".
 else
   echo "The file" $file_name "is not readable"
fi

if [ -w $file_name ]
 then
   echo "The file" $file_name "is readable/editable".
 else
   echo "The file" $file_name "is not writable/editable"
fi

if [ -x $file_name ]
 then
   echo "The file" $file_name "is executable".
 else
   echo "The file" $file_name "is not executable"
fi
