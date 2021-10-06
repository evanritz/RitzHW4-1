#!/bin/bash

# This Bash Script takes no arguments
# This Bash Script sets the CPU frequency of the BB to 600MHz
# Displays the CPU Information
# Creates and displays the variable location
# Displays the number of items (Folders and Files) in the working directory

# Written by Evan 

linebreak="<------------------->"
location="/home/debian"

function getCPUfreq()
{
	local cpufreq=$(sudo cpufreq-info -w)
	echo "$cpufreq"
}


if [ $# -gt 0 ]
then
	echo -e "No arguments are required to execute this script."
	echo -e "Exiting..."
	exit 1
elif [ $# -eq 0 ]
then
	user=$(whoami)
	echo -e "You will need sudo permissions to execute this scipt properly."
	echo -e "  Current User: $user"
	
	echo -e "  Current CPU frequency: $(getCPUfreq)"

	# Setting CPU frequency to 600MHz
	sudo cpufreq-set -f 600MHz

	echo -e "  Updated CPU frequency: $(getCPUfreq)\n"
	echo -e "$linebreak\n"

	# Display CPU Info
	sudo cpufreq-info -m
	
	echo -e "\n$linebreak\n"

	# Display location variable
	echo -e "Location: $location"

	# Display number of items in working directory
	items=$(ls $PWD | wc -l)
	echo -e "Items in $PWD: $items"
	
fi
