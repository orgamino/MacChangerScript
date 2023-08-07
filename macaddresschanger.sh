#!/bin/bash

#This script uses macchanger to run
#If you encounter an error, install macchanger using the command line
#To do this on Ubuntu-based distros: sudo apt-get install macchanger

if [[ $(id -u) != 0 ]]; then
	echo "You need to be root to run this script!"
else
	old_mac_address=$(ifconfig | grep ether | awk '{print $2}')
	ifconfig wlo1 down
	macchanger -r wlo1
	ifconfig wlo1 up
	clear
	new_mac_address=$(ifconfig | grep ether | awk '{print $2}')
	echo "Old MAC: $old_mac_address"
	echo "New MAC: $new_mac_address"
fi