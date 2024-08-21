#!/bin/bash

# A script finding helping monitor a dircetory if interested.
# It is to find the space it occupies and if it exceeds 100MB to notify the user.

#asking the user if they want to monitor a file/directory
echo "Would you want to monitor a file or a directory?"
read user_input

# if answer is yes,
usr_inpt=${user_input,,}
if [ "$usr_inpt" == "yes" ]; then
  echo "Please input the file or the absolute path of the directory"
  read filedir_input

    if [ -d "$filedir_input"  ]; then #checking if the file/directory exists
        filedir_size=$(du -h $filedir_input | tail -n 1 | tail -n 1 | awk '{print$1}') #extracting only the size of the file/directory from the output 
        if [ $filedir_size -gt 102400 ]; then #checking if the figure-size is greater than 100MB
          echo $filedir_input "exceeds 100MB"
        else
          echo $filedir_input "is below 100MB"
        fi
    else
        echo $filedir_input "doesn't exist"
    fi
# if answer is no then exit and end the program
  elif [ "$usr_inpt" == "no" ]; then
      echo "All good, no problem then. Have a lovely day."
  else # if answer is neither yes or no
    echo "Wrong input."
fi

