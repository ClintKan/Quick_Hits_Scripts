# #!/bin/bash

# A Program that lists all process currently running
# And prompts a user to input the Process ID of the process they'd want to kill

handle_error() {
    local message="$1"
    echo "Error: ${message}"
    exit 1
}

echo "Welcome to the script showing running processes - prompting to kill a process"
echo " "

echo "Here is the list of running processes"
pgrep -l .
echo " "

echo "Which process in the list above would you want to kill? Enter process ID not name"
read usrproc_input

if ! pgrep $usrproc_input > /dev/null; then #|| handle_error "Error: No process with that PID found. Please try again." ]; then
    handle_error "No process with PID $usrproc_input found. Please try again."
fi

sudo pkill -e $usrproc_input || handle_error "No process with PID $usrproc_input found. Please try again."

