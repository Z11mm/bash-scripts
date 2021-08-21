#!/bin/bash

# Delete users with username beginning with 'user'

persons=$( getent passwd | grep ^user | cut -d: -f1 )

# Iterate through list of target users and delete each user

for person in $persons
do
    sudo userdel -f $person
done