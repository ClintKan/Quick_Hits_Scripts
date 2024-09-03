#!/bin/bash

# CRON JOB SCRIPT - SCHEDULING RUNNING OF A SCRIPT

#

echo -e "\n Checking and updating shell bin \n" # -e flag to idnetify that \n is not part of the printable text

sudo apt-get update && sudo apt-get upgrade -y # -y flag states that yes proceed.

echo -e "\n Completed at $(date) \n"
