#!/bin/bash

#Script that combs through a log file foir 404 errors - finding the number of times an IP and its corresponding 404 error shows up

echo "Enter the file - with it's entire path i.e. /home/ubuntu/myfile.log"

read source_file
#my_file exists here=> "/home/ubuntu/Monitoring_C5/web-server-access-logs.log"


# cat web-server-access-logs.log | grep ' 404 ' >> log_review.txt

cat $source_file | grep ' 404 ' > log_review.txt

cat log_review.txt | awk -F '"' '{print $2}' > log_review2.txt

cat log_review2.txt | awk '{print $1}' > log_review3.txt

tr -s ' ' '\n' < log_review3.txt | sort | uniq -c  > temp_logcomber.txt

sort -nr temp_logcomber.txt > log_comber.txt

rm log_review.txt && rm log_review2.txt && rm log_review3.txt & rm temp_logcomber.txt

echo "The sorted file named log_comber.txt has been created in the same directory you ran this script. You may open it now."
