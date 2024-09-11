#!/bin/bash

#Script that combs through a log file for 404 errors - finding the number of times an IP and its corresponding 404 error shows up

echo "Enter the file - with it's entire path i.e. /home/ubuntu/myfile.log"

read source_file
#my_file exists here=> "/home/ubuntu/Monitoring_C5/web-server-access-logs.log"
# cat web-server-access-logs.log | grep ' 404 ' >> log_review.txt

cat $source_file | grep ' 404 ' > log_review.txt #print the contents of the file but with a focus on 404 into another file log_review.txt

cat log_review.txt | awk -F '"' '{print $2}' > log_review2.txt #print the 2nd entry-string of each line after the " contents of the file log_review.txt into log_review2.txt

cat log_review2.txt | awk '{print $1}' > log_review3.txt  #print the 1st entry-string of each line of the file log_review2.txt into log_review3.txt

cat log_review3.txt |sort -nr | uniq -c | sort -nr > log_comber.txt #temp_logcomber.txt

#tr -s ' ' '\n' < log_review3.txt | sort | uniq -c  > temp_logcomber.txt #organize the strings in the files for sorting and then counting uniqueness 
#sort -nr temp_logcomber.txt > log_comber.txt #sort the contents in the temp_logcomber.txt with the one with the highest count on top

rm log_review.txt && rm log_review2.txt && rm log_review3.txt # #rm temp_logcomber.txt to clear out the temp files
echo "The sorted file named log_comber.txt has been created in the same directory you currently in. You may open it now."
