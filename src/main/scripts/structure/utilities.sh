#!/bin/bash

###
# Utility functions commonly used by scripts
##

# COL - colorizes the first textual argument with the color code
# arguments:
#	- $1 - text
#	- $2 - color code [30 - 100] 
# Usage: echo "Hello in $(COL "color" 33) !"
function COL {
	text=$1
	color=$2

	echo -en "\e[0;${color}m${text}\e[0;37m\e[0m"
}

# showMessage: Informs user when action is needed and waits 
# for the action to be performed by user.
# arguments:
#	- $1 - text
function showMessage {
	text=$1
	echo -e "\e[0;33m"
	echo -e $text
	echo -e "\e[0;37m"
	while true; do
		read -p "Please answer with \"yes\" when you are ready to continue. Ready ? " -n 3 -r
		echo 
		if [ "$REPLY" == "yes" ]; then
			break
		fi
	done
}

function showHDFSMessage {
	msg="A pre-requisite for applying security is to enable the ACLs in HDFS.\n"\
"Please enable the following property through Ambari:\n"\
"(add new property in \"Custom hdfs-site.xml\" section)\n"\
"\t\tdfs.namenode.acls.enabled=true\n"\
"And restart HDFS service.Proceed once the service is running back again."
	showMessage "$msg"
}

function showCapacityMessage {
	settings="$1"
	msg="The YARN Capacity Scheduler requires modification in order to create & assign queues.\n"\
"Please paste the following into the Ambari interface, YARN configuration, Scheduler section, Capacity Scheduler field:\n"\
"\n${settings}\n\n"\
"After applying the configuration, please restart YARN service.\n"\
"Proceed once the service is running back again."
	showMessage "$msg"
}

