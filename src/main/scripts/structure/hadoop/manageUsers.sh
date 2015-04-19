#!/bin/bash

#source ./settings.sh
source ./utilities.sh

### createSysAdmin - creates the IDA System Administrator account
### 	- the user will be added to groups: tenant grups, users, LINUX_GROUPS
### 	- no parameters
function createSysAdmin {
	sysadmin="${LANDLORD}_${LANDLORD_SUPERUSER}"
	tenant_groups=""
	for tenant in $TENANTS; do
		tenant_groups="$tenant_groups,${LANDLORD}_${tenant}_${GROUP}"
	done

	allgroups="$tenantGroupName,$LINUX_GROUPS"
	echo "Creating the $LANDLORD supper admin user [ $(COL "$sysadmin" 33) ] (groups: $allgroups)"
	useradd $sysadmin -g "users" -G "$allgroups" 
}

### createGroups - creates the configured sets of groups
### 	- no parameters
function createGroups {
	for tenant in $TENANTS; do
		tenantGroupName="${LANDLORD}_${tenant}_${GROUP}"
		echo "Creating the group [ $(COL $tenantGroupName 32) ] for tenant $(COL ${LANDLORD}_$tenant 97) ..."
		groupadd $tenantGroupName	
	done
}

### createUsers - creates the configured sets of users
### 	- no parameters
function createUsers {
	# First create the sytem administrator:
	createSysAdmin
	# The regular workflow users:
	for tenant in $TENANTS; do
		echo "Creating the users for tenant $(COL $tenant 97) ..."
		for userName in $USERS; do
			tenantGroupName="${LANDLORD}_${tenant}_${GROUP}"
			tenantUserName="${LANDLORD}_${tenant}_${userName}_usr"
				
			echo -e "\t- user $(COL $tenantUserName 32) (group $tenantGroupName) ..."
			useradd -g $tenantGroupName -G "$tenantGroupName,$LINUX_GROUPS" $tenantUserName
		done
	done
}

### createUsersAndGroups
### 	- no parameters
function createUsersAndGroups {
	createGroups
	createUsers
}

### deleteSysAdmin - remove the system admin user
function deleteSysAdmin {
	sysadmin="${LANDLORD}_${LANDLORD_SUPERUSER}"
	echo "Deleting the $LANDLORD supper admin user [ $(COL "$sysadmin" 33) ]"
	userdel -r -f $sysadmin
}

### deleteUsers - removes the users created by this script 
### 	- no parameters
function deleteUsers {
	# Delete the system administrator user
	deleteSysAdmin

	for tenant in $TENANTS; do
		echo "Deleting the users for tenant $(COL $tenant 97) ..."
		for userName in $USERS; do
			tenantGroupName="${LANDLORD}_${tenant}_${GROUP}"
			tenantUserName="${LANDLORD}_${tenant}_${userName}_usr"
			
			echo -e "\t- user $(COL $tenantUserName 32) (group $tenantGroupName) ..."
			userdel -r -f $tenantUserName
		done
	done
}

### deleteGroups - removes the groups created by this script 
### 	- no parameters
function deleteGroups {
	for tenant in $TENANTS; do
		echo "Deleting the groups for tenant $(COL $tenant 97) ..."
		tenantGroupName="${LANDLORD}_${tenant}_${GROUP}"
		echo -e "\t- group: $(COL $tenantGroupName 32)"
		groupdel $tenantGroupName	
	done
}

### createUsersAndGroups
### 	- no parameters
function deleteUsersAndGroups {
	echo "Deleting the configured set of users & groups ..."
	deleteUsers
	deleteGroups
	echo -e "Done."
}
