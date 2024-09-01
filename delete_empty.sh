#!/bin/bash

echo "Welcome to this script that deletes empty files and directories."
echo "Enter the absolute path of the folder you would want the script to sweep through."
read path_input

# finding the empty files using the "find" command
empty_files=$(find $path_input -type f -empty) # storing the list

# listing out the empty files using the for loop
echo "These are the empty files found within the directory path you provided..."
i=1
for item in $empty_files; do
    echo "$i. $item"
    ((i++))
done

# question for the user to delete the files
echo "Do you want to proceed with deleting these $(find $path_input -type f -empty | wc -l) files?"
echo "Type in; 'yes' or 'no'"
read user_response

user_response=${user_response,,} # turning the input into lowercase

# deleting the files or not depending on the response
if [ $user_response == "yes" ]; then
    for item in $empty_files; do
       rm $item
       ((i++))
    done
elif  [ $user_response == "no" ]; then
    echo "Got it. Keeping files."
else
    echo "Wrong input - please type in 'yes' or 'no'"
fi


# finding the empty directories using the "find" command
empty_dir=$(find $path_input -type d -empty)

# finding the empty directories using the "find" command and listing them out
echo "These are the empty files found in within the directory path you provided.."
i=1
for item in $empty_dir; do
    echo "$i. $item"
    ((i++))
done


# question fo the user to delete the files
echo "Do you want to proceed with deleting these $(find $path_input -type d -empty | wc -l) directories?"
echo "Type in; 'yes' or 'no'"
read user_response

user_response=${user_response,,} # turning the input into lowercase

# deleting the files or not depending on the response
if [ $user_response == "yes" ]; then
    for item in $empty_dir; do
       rm -r $item
       ((i++))
    done
elif  [ $user_response == "no" ]; then
    echo "Got it. Keeping files."
else
    echo "Wrong input - please type in 'yes' or 'no'"
fi
