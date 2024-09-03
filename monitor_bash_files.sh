#!/bin/bash

#Introduction
echo "Welcome to this script that finds non-executable bash files..."
echo "...and makes them executable."

#Requesting user to input the path where the search is to be done
echo "Enter the absolute path of the folder you would want the script to sweep through."
read path_input
gn_list=$(find $path_input -type f -name "*.sh") #finding all .sh files and storing them

echo "Here is the state of the files before making them executable;"

ls -al $path_input

rm -f file_list.txt #deleting this temp file incase it exists => flag -f for silence

#an 'if' statement
#if the list is empty, all files are executable
if [ $(find $path_input -type f -name "*.sh" | wc -l) == 0 ]; then
    echo "There are no bash files in the provided path."
else #if the list isn't empty, there are inexecutable files
    for file_item in $gn_list; do
        if [ ! -x $file_item ]; then
            echo "$file_item" >> file_list.txt
        fi
    done

    if [ ! -e "file_list.txt" ]; then #if the file doesn't exists, i.e. wasn't created
        echo "These are the no new inexecutable files."

    else #if the file exists, i.e. was created
        echo "These are the non-executable files..."
        cat file_list.txt

        echo " "

        echo "Do you want to make them executable? (Yes/No)"
        read qn_resp

        qn_resp=${qn_resp,,}

        echo " "

        tempfile_list=$(cat file_list.txt)
        if [ $qn_resp == "yes" ]; then
            for tempfile in $tempfile_list; do
            chmod +x $tempfile
            echo "$tempfile is now executable."
            done

        elif [ $qn_resp == "no" ]; then
            echo "All files have been kept inexecutable."
        else
            echo "Wrong input - please type in 'yes' or 'no'"
        fi

    fi
fi
