#!/bin/bash

# saving submission fileSystem
usrHome=$(find . -name "submission_reminder_*" | awk -F"/" '{ print $2 }')

# Assignment Menu
echo -e """Assignments:
1) Shell Navigation
2) Git
3) Shell Basics
4) Shell Initialization
5) Shell Loops
6) Exit"""

# Prompting the user
read -p "Enter Assignment Number (1-5): " numChoice
case $numChoice in 
    1) ASSIGNMENT="Shell Navigation";;
    2) ASSIGNMENT="Git";;
    3) ASSIGNMENT="Shell Basics";;
    4) ASSIGNMENT="Shell Initialization";;
    5) ASSIGNMENT="Shell Loops";;
    6) exit 1;;
    *) echo "INVALID CHOICE"; exit 0;;
esac


sed -i "s|ASSIGNMENT=\".*\"|ASSIGNMENT=\"$ASSIGNMENT\"|" "$usrHome/config/config.env"

