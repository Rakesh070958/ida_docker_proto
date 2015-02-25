#!/bin/bash

cd ../scripts/structure/
source ./settings.sh
source ./utilities.sh
source ./hadoop/manageUsers.sh
source ./hadoop/manageHDFSStructure.sh
source ./hadoop/applyCapacitySettings.sh
source ./hadoop/hiveSetup.sh

rm td.log

#echo "$(COL "Running UNINSTALL procedure --------------------------------------" 90)"
#deleteHiveTables
#deleteHDFSStructure
#echo "$(COL "Removing created USERS -------------------------------------------" 90)"
#deleteUsersAndGroups
if false; then
	echo "$(COL "------------------------------------------------------------------" 90)"
	echo "Using the configuration:"
	echo -e "\t- LANDLORD = $(COL "$LANDLORD" 36)"
	echo -e "\t- Tenants = $(COL "$TENANTS" 36)"
	echo -e "\t- Environments = $(COL "$ENVS" 36)"
	echo -e "\t- SysAdmin = $(COL "$LANDLORD_SUPERUSER" 36)"
	echo -e "\t- Users = $(COL "$USERS" 36)"
	echo -e "\t- Group = $(COL "$GROUP" 36)"
	echo "$(COL "Creating the USERS on the system ---------------------------------" 90)"
#	createUsersAndGroups
	echo "$(COL "Creating the HDFS Structure --------------------------------------" 90)"
#	createHDFSStructure
	echo "$(COL "Creating the Hive tables ------------------------------------------" 90)"
#	createHiveTables
	echo "$(COL "Applying Capacity Scheduler configuration--------------------------" 90)"
#	applyCapacitySchedulerConfiguration
fi

showStartTeradataMessage
source ./teradata/clean.sh
cleanTDStructures

source ./teradata/create-structure.sh
createTeradataStructure

