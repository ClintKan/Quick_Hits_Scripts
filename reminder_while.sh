#!/bin/bash

#This is a while-script to remind guys if it's time to leave the beach or stay

# If temperature is > 85F, "leave now". Otherwise, "I'm good, I am staying!"

echo "What is the temperature outside?"
read current_weather

while [ $current_weather -lt 85 ]
  do
    echo "I'm good, yo! It's just $current_weather. I'm staying."
    current_weather=$((current_weather + 2))
    sleep 2
    echo " "
  done
    echo "I'm leaving now"


