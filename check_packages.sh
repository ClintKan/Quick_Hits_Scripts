#!/bin/bash
#A script that checks if a process/package is installed, and if it is, then its version

echo "This is a script to check if packages below are installed..."
echo "....(systemd, htop, git, python3, curl, nmap, apt)"

pakg_list=("systemd" "htop" "git" "python3" "curl" "nmap" "apt")

for pakg in ${pakg_list[@]}; do
     if dpkg -l $pakg &> /dev/null; then #using &> /debv/null for "silent" mode
          #to extract the version of the package only - w/o the verbose
          pakg_vrsn=$(dpkg -l $pakg 2>/dev/null | awk 'NR==6 {print $3}')
          echo "'$pakg' is installed, version $pakg_vrsn"
     else
          echo "'$pakg' is not installed. Would you like to install it? (Yes/no)"
          read usr_inpt # this | tr [:upper:][:lower:] - can be added to this line
          #OR
          usr_inpt=${usr_inpt,,}

          if [ "$usr_inpt" == "yes" ]; then
               echo "Got it! Installing '$pakg'"
               sudo apt install $pakg -y
          elif [ "$usr_inpt" == "no" ]; then
               echo "Got it! Not installing '$pakg'"
          else
               echo "Wrong input - try again and enter either yes or no."
          fi
     fi

done

#IF FOR AN OPTIMAL PROCESS CHECKING - THEN BELOW IS IDEAL
# echo "Enter the process you want to check for"
# read usr_pcs

# psc_vrsn=$(dpkg -l $usr_pcs | awk 'NR==6 {print $3}')

# if dpkg -l $usr_pcs; then
#    echo "Process is installed; version $pcs_vrsn"
# else
#    echo "Process is not installed. Would you like to install it?(Yes/no)"
#    read usr_inpt

#    usr_inpt=${usr_inpt,,}
#    if [ $usr_inpt == "yes" ]; then
#         echo "Installing '$usr_pcs'now..." 
#         sudo apt install $usr_pcs -y
#         echo "Installation of '$usr_pcs' has been completed"
#    elif [ $usr_inpt == "no" ]; then
#         echo "Not installing '$usr_pcs'"
#    else
#         echo "Wrong input. Please type in yes or no" 
#    fi 
# fi
