#!/bin/bash

#A script displaying the resources of the sytsem it's on!

Menu () {
    #Menu Display to user to select from
    echo "Please select from the menu below what you'd like to know about your system's current state"
    echo "1 - IP Addresses"
    echo "2 - Current User - who currently is in the terminal"
    echo "3 - CPU Information"
    echo "4 - Memory Information"
    echo "5 - Top 5 Memory Processes"
    echo "6 - Top 5 CPU Processes"
    echo "7 - Network Connectivity"
}


Logic () {
    read menu_input #input by user as per menu

    if [[ $menu_input =~ ^[1-7]$ ]]; then #input checker to - must be between numbers between 0 through 7
        echo "Below are the quick system details - you requested"
        echo " "

        if [ $menu_input -eq 1 ]; then
            internal_ip=$(ifconfig | awk 'NR==2{print $2}') #internal ip address
            public_ip=$(curl ifconfig.me) #public address
            echo "IP Addresses:" "Your internal IP is" $internal_ip", and your public IP is" $public_ip

            elif [ $menu_input -eq 2 ]; then
                terminal_me=$(whoami)
                echo "You are" $terminal_me #user in the terminal

            elif [ $menu_input -eq 3 ]; then
                number_of_cpus=$(lscpu | awk 'NR==5{print $2}') #number of CPUs
                echo "The system has" $number_of_cpus "CPU."

            elif [ $menu_input -eq 4 ]; then
                total_memory=$(free -m | awk 'NR==2{print $2}') #total memory
                used_memory=$(free -m | awk 'NR==2{print $3}') #used memory
                echo "There is" $(($total_memory - $used_memory)) "unused memory of total" $total_memory"."

            elif [ $menu_input -eq 5 ]; then
                echo "Below is a table showing the top Processes currently running..."
                ps aux | awk 'NR==1{print $4, $2, $11}' #printing the headers/heading of the table
                ps aux | awk '{print $4, $2, $11}' | sort -nr | head -n 5 #top 5 processes sorted by memory

            elif [ $menu_input -eq 6 ]; then
                echo "Below is a table showing the top CPU currently running..."
                ps aux --sort=-%cpu | awk '{print $3, $2, $11}' | head -n 6 #top 5 processes sorted by cpu

            elif [ $menu_input -eq 7 ]; then
                echo "Please input the website you would like to know the connection time for..."
                read website_input
                ping_time=$(ping -c 1 $website_input | awk 'NR==2 {print $7}' | sed 's/time=//g')           #top 5 processes sorted by cpu
                packet_loss=$(ping -c 1 $website_input | awk 'NR==5 {print $6" "$7" "$8}' | sed 's/,//g')   #packet loss
                echo " "
                echo "It took $ping_time ms to connect to $website_input and there was $packet_loss data packet loss."

            else
                echo "You haven't selected a proper option"
                exit 1
        fi   
    fi
}

Call () {

  while true; do
    echo "Listing the system's info as per user's request/input"
    echo "Do you want to continue? (Yes/No)"
    read user_reply
    user_reply=${user_reply,,}  # convert input to lowercase
    if [ "$user_reply" == "Yes" ]; then
        Menu
        Logic
    elif [ "$user_reply" == "No" ]; then
        echo "Exiting...."
        exit 1
    else
        echo "Invalid input. Please enter 'Yes' or 'No'."
    fi
  done

}

Call
