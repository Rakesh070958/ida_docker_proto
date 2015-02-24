#!/bin/bash

source ./utilities.sh
landlord=PS
tenants="USI GTOP"

#environments
echo -----the list of environments in which tables will be created
environments="DEV PRD"

echo -----the list of databases in which tables will be created
databases="PUB SEM"

landlord_perm_space=1000000000

export landlord
export tenants
export environments
export databases
export landlord_perm_space

echo LANDLORD = $landlord
echo TENANTS = $tenants
echo ENVIRONMENTS for Tables $environments
echo DATABASES for tables $databases
echo landlord perm space $landlord_perm_space

# set the database ip, superuser username and superuser password
source ./general-settings.sh


echo "$(COL "Running UNINSTALL procedure --------------------------------------" 90)"
sh ./clean.sh

sh ./create-structure.sh

