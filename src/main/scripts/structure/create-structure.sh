#!/bin/bash

#######################
# create the structure #
#######################

echo ----------------- Create the landlord
sh ./create-landlord.bteq

echo ----------------- Create the tenants
for tenant in $tenants; do
source ./settings-tenant.sh
sh ./create-tenant.bteq
sh ./create-env-usr.bteq

for environment in $environments; do
source ./settings-env.sh
sh ./create-env.bteq
sh ./create-env-roles.bteq
sh ./create-env-user.bteq

echo ------------------- Create the tables
sh ./create-env-table.bteq

for database in $databases; do
source ./settings-db.sh
sh ./create-db.bteq
sh ./create-db-roles.bteq
sh ./create-db-table.bteq
done

done

done

