#!/bin/bash

# A script that counts the number of times a specified word appears in a txt file

echo "Welcome to this script that finds the number of time a word shows up in a text file"

echo "Enter the word you want find"
read word_find

echo "Enter the absolute path of to the file that has the word you want find"
read source_filepath

if [-f $source_filepath]; then
    #grep searches for the word in the path provided
    word_apps=$(grep -wo "$word_find" "$source_filepath" | wc -l | sed 's/ //g') 
    
    echo "The word $word_find shows up $word_apps times in the file $source_filepath."
else
    echo "The file $source_filepath doesn't exist."
