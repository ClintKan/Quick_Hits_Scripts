#!/bin/bash

#This is a script to remind guys to bring beach-stuff.

# Remind  Parker, Kent, Stark, Wayne
# What each should bring; Umbrella, Chair, Towel, Cooler with drinks


#for friend_name in {"Parker","Kent","Stark","Wayne"}

friend_group=("Parker" "Kent" "Stark" "Wayne")

for friend_name in  "${friend_group[@]}"
  do
	echo $friend_name "don't forget to bring; Umbrella, Chair, Towel, Cooler with drinks!"
	sleep 1 # this is for dramatic effect when printing
  done

