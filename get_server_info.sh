#!/bin/bash

# This script displays system information - performance, cpu usage, etc., and logs this info to a log file every 5 mins
# for 30 mins

#SHELL=/bin/bash
#USER=vagrant

#d /vagrant
#echo "Check processes ${RANDOM}" >> monitoring.log
#ps -ef >> monitoring.log

#echo 'Done' >> monitoring.log

echo "Timestamp (Start): $(date)"
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'PRINT GENERAL SYSTEM INFORMATION'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo
uname -a
echo
echo '~~~~~~~~~~~~~~~~~~~~~~~'
echo 'RUNNING PROCESSES LIST'
echo '~~~~~~~~~~~~~~~~~~~~~~~'
echo
# View the last 50 running processes
echo "$(ps -ef | tail -n 50)"
echo
echo '~~~~~~~~~~~~~~~~~~~~`'
echo 'TCP NETWORK STATUS'
echo '~~~~~~~~~~~~~~~~~~~~'
