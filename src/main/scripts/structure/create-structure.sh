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


for database in $databases; do
source ./settings-db.sh
sh ./create-db.bteq
sh ./create-db-roles.bteq
sh ./create-db-user.bteq
sh ./create-db-table.bteq

echo --------HIVE DATABASE--------
hive -f create-hive-database.hql -hiveconf hive_database=$hive_database_qg
sh ./create-server-object.bteq
sh ./validate-server-object.bteq
sh ./validate-querygrid.bteq

done

done

done

