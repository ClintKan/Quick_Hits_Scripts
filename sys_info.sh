#!/bin/bash

#A script displaying the resources of the sytsem it's on

internal_ip=$(ifconfig | awk 'NR==2{print $2}')

public_ip=$(curl ifconfig.me)

terminal_me=$(whoami)

total_memory=$(free -m | awk 'NR==2{print $2}')

used_memory=$(free -m | awk 'NR==2{print $3}')

number_of_cpus=$(lscpu | awk 'NR==5{print $2}'

top5_processes=$(ps aux | awk '{print $4, $2, $11}' | head -n 6)

ping_time=$(ping -c 1 google.com | awk 'NR==2 {print $8}' | sed 's/time=//g')

packet_loss=$(ping -c 1 google.com | awk 'NR==5 {print $6" "$7" "$8}' | sed 's/,//g')

#Menu Display to user to select from
echo "Please select from the menu below what you'd like to know about your system's current state"
echo "1 - IP Addresses"
echo "2 - Current User - who currently ar in the terminal"
echo "3 - CPU Information"
echo "4 - Memory Information"
echo "5 - Top 5 Memory Processes"
echo "6 - Top 5 CPU Processes"
echo "7 - Network Connectivity"

read menu_input

if [ $menu_input =~ ^[0-6]$ ]; then
  echo "Below are the quick system details - you requested"
  echo ""

  if [ $menu_input -eq 1 ]; then
    echo "IP Addresses:" "Your internal IP is" $internal_ip", and your public IP is" $public_ip

  elif [ $menu_input -eq 2 ]; then
     echo "You are" $terminal_me 

  elif [ $menu_input -eq 3 ]; then
     echo "The system has" $number_of_cpus "CPU."

  elif [ $menu_input -eq 4 ]; then
    echo "There is" $(($total_memory - $used_memory)) "unused memory of total" $total_memory"."

  elif [ $menu_input -eq 5 ]; then
    echo "Below is a table showing the top Processes currently running..."
    ps aux --sort=-%mem | awk '{print $4, $2, $11}' | head -n 6

  elif [ $menu_input -eq 6 ]; then
    echo "Below is a table showing the top CPU currently running..."
    ps aux --sort=-%cpu | awk '{print $3, $2, $11}' | head -n 6

  elif [ $menu_input -eq 7 ]; then
    echo "Please input the website you would like to know the connection time for..."
    read website_input
    echo " "
    echo "It took $ping_time ms to connect to $website_input and there was $packet_loss data packet loss."

  elif [ $menu_input -eq 0 ]; then
    echo "Exiting now..."

else
  echo "You haven't selected a proper option"
  exit 1
fi

 
