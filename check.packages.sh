#!/bin/bash
#A script that checks if a process/package is installed, and if it is, then its version

echo "Enter the process you want to check for"
read usr_pcs

pcs_chkr=$(apt-cache policy $usr_pcs | wc -l)
psc_vrsn=$(apt-cache policy $usr_pcs | awk 'NR==5 {print $2}')

if [ $pcs_chkr -gt 4 ]; then
   echo "Process is installed; version $pcs_vrsn"
else
   echo "Process is not installed. Would you like to install it?(Yes/no)"
   read usr_inpt

   usr_inpt=${usr_inpt,,}
   if [ $usr_inpt == "yes" ]; then
        echo "Installing '$usr_pcs'now..." 
        sudo apt install $usr_pcs -y
        echo "Installation of '$usr_pcs' has been completed"
   elif [ $usr_inpt == "no" ]; then
        echo "Not installing '$usr_pcs'"
   else
        echo "Wrong input. Please type in yes or no" 
   fi 
fi 