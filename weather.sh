#!/bin/bash

#Example weather condition

echo "Type in today's weather"
read weather | tr [:upper:] [:lower:]

# weather="sunny" # taking the value of weather

if  [ $weather=="sunny" ] 
then 
	echo "It's good to go to the beach"
else
	echo "It's not ideal to go to the beach"
fi
