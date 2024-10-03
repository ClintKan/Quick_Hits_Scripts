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


# #!/bin/bash

# # A script that checks if a process is running.... &
# # ....prompting if it should be closed or not

# #assign a variable to the entry of the word as the script is being run
# usr_prcsname=$1

# prcs_count=$(pgrep -f $usr_prcsname | wc -l)
# prcs_rng=$(pgrep -f $usr_prcsname)
# #check the running of the process - and how many child-process exist
# #using an if else loop - and if exists, ask whetther to kill or keep open
# if [ $prcs_count -gt 0 ]; then
#     echo "The process $usr_prcsname is running..."
#     echo " "
#     echo "Would you want to end/kill the process?(Yes/no)"
#     read usr_input
#     usr_input=${usr_input,,}

#     if [ $usr_input == "yes" ] ; then
#         for pcs in $prcs_rng; do
#             pkill -9 $pcs
#         done
#         echo " "
#         echo "Process $usr_prcsname killed."
        
#     elif [ $usr_input == "no" ] ; then
#         echo "Gotcha. Process not terminated."
#     else
#         echo "Wrong input - try again, but entering yes or no."
#     fi
# else
#     echo "The process $usr_prcsname isn't running."
# fi