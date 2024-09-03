#!/bin/bash

echo "Welcome to the script that helps check if a process is running"

while true; do #loop to keep asking user
    echo "Do you want to proceed with checking? Yes or No"
    read qn_check
    qn_check=${qn_check,,} #conversion of input above into lowercase

    if [ $qn_check == "yes" ]; then
      echo "What process do you want to check?"
      echo "Enter the process name - paying attention to Case Sensitivity"
      read user_input
      process_outcome=$(pgrep $user_input | wc -l) #checking if process is running
        if [ $process_outcome -gt 0 ]; then  #if running it returns the process ID to the screen
            echo "The process" $user_input "is active/running"
            echo "It is process number $(pgrep $user_input)"
        else # if no, it isn't running
            echo "The process" $user_input "isn't active/running"
        fi
    elif [ $qn_check == "no" ]; then
      echo "Gotcha. Exiting now..."
         break
    else
      echo "Wrong input $qn_check. Please input Yes or No."

    fi

done
