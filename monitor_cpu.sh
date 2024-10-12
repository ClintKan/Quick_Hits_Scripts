#!/bin/bash
#A script that checks if the CPU usage is above 75%

echo "Monitoring CPU usage..."

#setting the threshold at 75%
threshold=75

#using top terminal command + -b, -n 1 to run it once
#summing up all categories that would indicate CPU usage
#us=user time, sy=system time, ni= nice time, wa=i/o wait time
#hi=hardware interrupts, st=steak time
usage=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2 + $3 + $4 + $6 + $7 + $8 + $9}')

if [ $usage > $threshoold ]; then
    echo "CPU usage: 75% (Threshold exceeded)"
    echo "Logging event to 'cpu_usage_log.txt'........"

    echo "[$(date "+%Y-%m-%d %H:%M:%S")] CPU usage exceeded threshold: 75%" > ./cpu_usage_log.txt
else
    echo "CPU usage: below 75% (Threshold not exceeded)"
fi

echo "Check completed. To check again, you'll need to run this script again"

