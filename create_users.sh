#!/bin/bash

# Create users from text file

users=$( cat users.txt )

# Iterate through list of users and create user accounts
for user in $users
do
    sudo useradd -m $user
done