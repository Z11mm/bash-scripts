#!/bin/bash

# This script displays system information - performance, cpu usage, etc., and logs this info to a log file every 5 mins
# for 30 mins

#d /vagrant
#echo "Check processes ${RANDOM}" >> monitoring.log
#ps -ef >> monitoring.log

#echo 'Done' >> monitoring.log

echo "Timestamp (Start): $(date)" >> system_stats.log
echo >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' >> system_stats.log
echo 'PRINT GENERAL SYSTEM INFORMATION' >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' >> system_stats.log
echo >> system_stats.log
# Operating system
uname -o >> system_stats.log
# Kernel name
uname -s >> system_stats.log
# Kernel version
uname -v >> system_stats.log
# Kernel release
uname -r >> system_stats.log
# Network node hostname
uname -n >> system_stats.log
# Machine name
# uname -m >> system_stats.log
# Processor type
uname -p >> system_stats.log
echo >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~~~~~' >> system_stats.log
echo 'RUNNING PROCESSES LIST' >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~~~~~' >> system_stats.log
echo >> system_stats.log
# View the 50 most recent running processes
echo "$(ps -ef | tail -n 50)" >> system_stats.log
echo >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~~`' >> system_stats.log
echo 'TCP NETWORK STATUS' >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~~' >> system_stats.log
netstat -nvr >> system_stats.log
echo >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~' >> system_stats.log
echo 'SYSTEM PERFORMANCE' >> system_stats.log
echo '~~~~~~~~~~~~~~~~~~~' >> system_stats.log
echo >> system_stats.log
iostat >> system_stats.log
echo
echo "Timestamp (End): $(date)" >> system_stats.log