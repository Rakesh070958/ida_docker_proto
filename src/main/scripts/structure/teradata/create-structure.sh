#!/bin/bash

#######################
# teradata/create the structure #
#######################

source ./settings.sh
source ./utilities.sh

function createTeradataStructure {
	showCreateTeradataStructureMessage
	echo "$(COL "Teradata: Cleaning structure -------------------------------------" 32)"
	echo "$(COL "Landlord: $landlord" 90)"
	echo "$(COL "Tenants: $tenants" 90)"
	echo "$(COL "Environments: $environments" 90)"
	echo "$(COL "Databases: $databases" 90)"
	
	echo "$(COL "Teradata: Creating the landlord ----------------------------------" 32)"
	echo "$(COL "Landlord: $landlord" 90)"
	sh ./teradata/create-landlord.bteq >> td.log

	echo "$(COL "Teradata: Creating the tenants -----------------------------------" 32)"
	for tenant in $tenants; do
		echo "$(COL "Tenant: $landlord_$tenant" 90)"
		source ./teradata/settings-tenant.sh >> td.log

		sh ./teradata/create-tenant.bteq >> td.log
		sh ./teradata/create-env-usr.bteq >> td.log
	
		for environment in $environments; do
			echo "$(COL "Environment: $landlord_$tenant_$environment" 90)"
			source ./teradata/settings-env.sh >> td.log

			sh ./teradata/create-env.bteq >> td.log
			sh ./teradata/create-env-roles.bteq >> td.log
			#sh ./teradata/create-env-user.bteq >> td.log
			echo "$(COL "Teradata: Creating the databases ---------------------------------" 90)"
			for database in $databases; do
				echo "$(COL "Database: $landlord_$tenant_$environment_$database" 90)"
				source ./teradata/settings-db.sh >> td.log

				sh ./teradata/create-db.bteq >> td.log
				sh ./teradata/create-db-roles.bteq >> td.log
				sh ./teradata/create-db-user.bteq >> td.log
				sh ./teradata/create-db-table.bteq >> td.log
				
			    echo "$(COL "Teradata: Creating the hive databases ----------------------------" 90)"
				echo "$(COL "Hive database: $hive_database_qg" 90)"
				hive -e "\"CREATE DATABASE IF NOT EXISTS $hive_database_qg;\"" >> td.log
			
				echo "$(COL "Teradata: Working with QueryGrid ---------------------------------" 32)"
				sh ./teradata/create-server-object.bteq >> td.log
				sh ./teradata/validate-server-object.bteq >> td.log
				sh ./teradata/validate-querygrid.bteq >> td.log
			done
		done
	done
}
