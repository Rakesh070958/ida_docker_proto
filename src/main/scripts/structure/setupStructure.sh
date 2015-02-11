#!/bin/bash
landlord=@setup.landlord@
tenants="@setup.tenants@"

#environments
echo -----the list of environments in which tables will be created
environments="@setup.environments@"

echo -----the list of databases in which tables will be created
databases="@setup.databases@"

landlord_perm_space=@setup.landlord_perm_space@

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

sh ./clean.sh

sh ./create-structure.sh

