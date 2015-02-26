#!/bin/bash

#######################
# clean the structure #
#######################

source ./settings.sh
source ./utilities.sh

function cleanTDStructures {
	echo "$(COL "Teradata: Cleaning structure -------------------------------------" 32)"
	echo "$(COL "Landlord: $landlord" 34)"
	echo "$(COL "Tenants: $tenants" 34)"
	echo "$(COL "Environments: $environments" 34)"
	echo "$(COL "Databases: $databases" 34)"
	
	for tenant in $tenants; do
               	source ./teradata/settings-tenant.sh >> td.log

		for environment in $environments; do
			source ./teradata/settings-env.sh >> td.log

			for database in $databases; do
				db=$landlord_$tenant_$environment_$database
				export db
                echo "$(COL "Teradata: Cleaning the database ----------------------------------" 32)"
				source ./teradata/settings-db.sh >> td.log
				echo "$(COL "Teradata: Cleaning the hive table and hive database ---------------" 32)"
				echo "$(COL "Hive table: $hive_database_qg.$table_db_qg" 34)"
				echo "$(COL "Hive table: $hive_database_qg.trends" 34)"
				echo "$(COL "Hive database: $hive_database_qg" 34)"
				hive -S -e "\"DROP TABLE $hive_database_qg.$table_db_qg;\"" >> td.log
				hive -S -e "\"DROP TABLE $hive_database_qg.trends;\"" >> td.log
				hive -S -e "\"DROP DATABASE IF EXISTS $hive_database_qg CASCADE;\"" >> td.log
				echo "$(COL "Database: ${landlord}_${tenant}_${environment}_${database}" 34)"
				sh ./teradata/clean-db.bteq >> td.log
			done
			echo "$(COL "Teradata: Cleaning the environment -------------------------------" 32)"
			echo "$(COL "Environment: ${landlord}_${tenant}_${environment}" 34)"
			sh ./teradata/clean-env.bteq >> td.log
		done

		echo "$(COL "Teradata: Cleaning the tenant ------------------------------------" 32)"
		echo "$(COL "Tenant: ${landlord}_${tenant}" 34)"
		sh ./teradata/clean-tenant.bteq >> td.log
	done
	echo "$(COL "Teradata: Cleaning the landlord ----------------------------------" 32)"
	echo "$(COL "Landlord: $landlord" 34)"
	sh ./teradata/clean-landlord.bteq >> td.log
}
