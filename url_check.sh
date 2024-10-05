#!/bin/bash

#A script that checks on the status of the site

echo "This script tells if the status of the site.."
echo " "

echo "Please enter the url below..."
read usr_url
echo " "

url_statuscode=$(curl --head --silent $usr_url | awk 'NR==1 {print $2}')

if [ $url_statuscode -eq 200 ]; then
    echo "The URL '$usr_url' is reachable"
    echo "HTTP Status Code: $url_statuscode"
elif [[ $url_statuscode -eq 301 || $url_statuscode -eq 302 || $url_statuscode -eq 304 ]]; then
    echo "The URL '$usr_url' has moved - it's being redirected"
    echo "HTTP Status Code: $url_statuscode"
elif [[ $url_statuscode -eq 400 || $url_statuscode -eq 401 || $url_statuscode -eq 403 || $url_statuscode -eq 404 || $url_statuscode -eq 408 ]]; then
    echo "The URL '$usr_url' is unreachable and it is on the customer's side"
    echo "HTTP Status Code: $url_statuscode"
elif [[ $url_statuscode -eq 500 || $url_statuscode -eq 502 || $url_statuscode -eq 503 || $url_statuscode -eq 504 ]]; then
    echo "The URL '$usr_url' is unreachable and it is on the devleoper's side"
    echo "HTTP Status Code: $url_statuscode"
elif [ $url_statuscode -eq 000 ]; then
    echo "The URL '$usr_url' doesn't exist."
    echo "HTTP Status Code: $url_statuscode"
else
    echo "Unable to retrieve the status code."
    echo "HTTP Status Code: $url_statuscode"
fi




# #Intro
# echo "Welcome to this script that returns the status code of any website"


# while true; do #a loop to keep asking user if they want to check
#     echo "Proceed with checking a website? Yes or No"
#     read qn_response
#     qn_response=${qn_response,,} #converting the input into lowercase
#     if [ $qn_response == "yes" ]; then #if input is yes
#         echo "Please paste the url of the website"
#         read url_input
#         url_response=$(curl -o /dev/null -s -w "%{http_code}\n" $url_input)
#         if [ $url_response == 200 ]; then #if 200 - the site is ok
#             echo "The URL $url_input is reachable."
#             echo "HTTP Status Code: 200"
#         elif [ $url_response == 404 ]; then #if 404 - the site isn't reachable
#             echo "The URL $url_input is not reachable."
#             echo "HTTP Status Code: 404"
#         elif [ $url_response == 301 ]; then #if 301 - the site is being redirected
#             echo "The URL $url_input moved or is being redirected to another url."
#             echo "HTTP Status Code: 301"
#         elif [ $url_response == 401 ]; then #if 401 - the site is reachable but requires authentication
#             echo "The URL $url_input is reachable but authentication is needed to access it."
#             echo "HTTP Status Code: 401"
#         elif [ $url_response == 503 ]; then #if 503 - the site is under maintenance
#             echo "The URL $url_input exists but might be under maintenance."
#             echo "HTTP Status Code: 503"
#         elif [ $url_response == 000 ]; then #if 000 - the site doesn't exist
#             echo "The URL $url_input doesn't exist."
#         else #if none of the above error code - inconclusive, could be due to internet blockages
#             echo "Unable to recieve a response from the site's servers."
#             echo "Please double check to make sure this site does indeed exist"
#         fi
#     elif [ $qn_response == "no" ]; then #if input is no
#         echo "Gotcha. Exiting now..."
#             break
#     else
#         echo "Wrong response. Please input yes or no"
#     fi

# done
