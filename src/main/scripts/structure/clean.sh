#!/bin/bash

#######################
# clean the structure #
#######################

echo ----------------- Clean the structure
for tenant in $tenants; do
source ./settings-tenant.sh

echo ----------------- Clean environments
for environment in $environments; do
source ./settings-env.sh

echo ----------------- Clean databases
for database in $databases; do
source ./settings-db.sh
sh ./clean-db.bteq
done

sh ./clean-env.bteq
done

echo ----------------- Clean the tenant
sh ./clean-tenant.bteq
done
echo ----------------- Clean the landloard
sh ./clean-landlord.bteq
