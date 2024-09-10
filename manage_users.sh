# A script that searches the user's (usernames) directory for a specified username


echo " "
echo "Welcome to the script that searches for the username in a username.txt file."

echo " "
# copying the default list of usersnames to a temp file
cat /etc/passwd > usernames.txt #can be replaced with a variable input by a user

# entering the username to be searched for
echo "Enter the username of the user you'd like to search for.."
read usr_input

echo "Searching the usernames.txt...."

# a loop statement if username exists in list or not

# username search in list but with a condition of..usrname must be at the beginning of the line
if grep -q "^$usr_input" "./usernames.txt"; then #^  line 18 comment
    echo "User '$usr_input' exists."

# separation using cut, with : as the delimieter (-d), and -f6 being the 6th place delimited
    home_dir=$(grep "^$usr_input" "./usernames.txt" | cut -d: -f6)
    echo "Home directory is: $home_dir"

    bash_dir=$(grep "^${usr_input}" "./usernames.txt" | cut -d: -f7)
    echo "Bash directory is: $bash_dir"
else
    echo "User '$usr_input' doesn't exist."
fi
