#!/bin/bash

# WARNING MESSAGE
# clear; read -p "Press enter to continue"
# Or these:

clear
echo "<Type warning message here>"; sleep 1; echo
read -p "Continue (y/N)? " -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo 'Proceeding in 1 seconds...' && sleep 1
else
        echo 'Exiting...'; exit
fi

printf "\n*** *** ***\nDANGEROUS COMMAND IS CURRENTLY RUNNING!\n*** *** ***\n\n"
