#!/bin/bash

# This script displays the IP address of failed login attempts and the location of the IP address.
# You need to pass in a log/data file as argument to this script.
# If any IP address count is over the LIMIT value of failures, the result is stored in a csv file with a header for Count, IP, Location

# Declare variables for the no of failures limit and the logfile argument
LIMIT='10'
LOG_FILE="$1"

# Check that the argument was supplied
if [[ ! -e "${LOG_FILE}" ]]
then
  echo "Please specify a log/data file as an argument to the script"
  exit 1
fi

# Loop through the list of counts of failed attempts and corresponding IP
# Add header to result list and place result in csv file
grep 'Disconnected from' gitlab_auth.log | cut -d':' -f 4 | awk '{print $(NF - 3)}' | sort -n | uniq -c | sort -r | while read COUNT IP
do
  # If the no of failed attempts is greater than the limit, display count, IP and location
  if [[ "${COUNT}" -gt "${LIMIT}" ]]
  then
    LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}' )
    echo "${COUNT},${IP},${LOCATION}"
  fi
done | sed '1i\Count,IP,Location' > failed_logins.csv

# Display result
cat failed_logins.csv

exit 0
