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
hive -S -f drop-hive-database.hql -hiveconf hive_table=$hive_database_qg.$table_db_qg -hiveconf hive_database=$hive_database_qg > out.log 
#>> out.log

#hive -e \"DROP TABLE $hive_database_qg.$table_db_qg;\"
#hive -e \"DROP DATABASE $hive_database_qg;\"


sh ./clean-db.bteq
done

sh ./clean-env.bteq
done

echo ----------------- Clean the tenant
sh ./clean-tenant.bteq
done
echo ----------------- Clean the landloard
sh ./clean-landlord.bteq
