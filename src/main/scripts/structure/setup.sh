#!/bin/bash

cd ../scripts/structure/

source ./settings.sh
export LANDLORD="$(echo $LANDLORD | tr '[:upper:]' '[:lower:]')"
export TENANTS="$(echo $TENANTS | tr '[:upper:]' '[:lower:]')"
export ENVS="$(echo $ENVS | tr '[:upper:]' '[:lower:]')"

source ./utilities.sh
source ./hadoop/manageUsers.sh
source ./hadoop/manageHDFSStructure.sh
source ./hadoop/applyCapacitySettings.sh
source ./hadoop/hiveSetup.sh

rm -f td.log

while true; do
	echo "Do you want to create the Hadoop structure now (yes/no) ?"
	read -r
	if [ "$REPLY" == "yes" ]; then
		echo "$(COL "Running UNINSTALL procedure --------------------------------------" 90)"
		deleteHiveTables
		deleteHDFSStructure
		echo "$(COL "Removing created USERS -------------------------------------------" 90)"
		deleteUsersAndGroups
		echo "$(COL "Removing existing Teradata structure -----------------------------" 90)"

		echo "$(COL "------------------------------------------------------------------" 90)"
		echo "Using the following configuration for Hadoop:"
		echo -e "\t- LANDLORD = $(COL "$LANDLORD" 36)"
		echo -e "\t- Tenants = $(COL "$TENANTS" 36)"
		echo -e "\t- Environments = $(COL "$ENVS" 36)"
		echo -e "\t- SysAdmin = $(COL "$LANDLORD_SUPERUSER" 36)"
		echo -e "\t- Users = $(COL "$USERS" 36)"
		echo -e "\t- Group = $(COL "$GROUP" 36)"

		echo "$(COL "Creating the USERS on the system ---------------------------------" 90)"
		createUsersAndGroups
		echo "$(COL "Creating the HDFS Structure --------------------------------------" 90)"
		createHDFSStructure
		echo "$(COL "Creating the Hive tables ------------------------------------------" 90)"
		createHiveTables
		echo "$(COL "Applying Capacity Scheduler configuration--------------------------" 90)"
		applyCapacitySchedulerConfiguration

		break
	elif [ "$REPLY" == "no" ]; then
		break
	fi
done


while true; do
	echo "Do you want to create the Teradata structure now (yes/no) ?"
	read -r
	if [ "$REPLY" == "yes" ]; then
		source ./teradata/clean.sh
		source ./teradata/create-structure.sh

		cleanTDStructures
		createTeradataStructure
	elif [ "$REPLY" == "no" ]; then
		break
	fi
done
