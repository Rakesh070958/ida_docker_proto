#!/bin/bash

#######################
# teradata/create the structure #
#######################

source ./settings.sh
source ./utilities.sh

function createTeradataStructure {
	echo "$(COL "Teradata: --------------------------------------------------------" 32)"
	echo "$(COL "Teradata: --------------------------------------------------------" 32)"
	echo "$(COL "Teradata: Creating structure -------------------------------------" 32)"
	echo "$(COL "Landlord: $landlord" 34)"
	echo "$(COL "Tenants: $tenants" 34)"
	echo "$(COL "Environments: $environments" 34)"
	echo "$(COL "Databases: $databases" 34)"
	
	echo "$(COL "Teradata: Creating the landlord ----------------------------------" 32)"
	echo "$(COL "Landlord: $landlord" 34)"
	sh ./teradata/create-landlord.bteq >> td.log

	echo "$(COL "Teradata: Creating the tenants -----------------------------------" 32)"
	for tenant in $tenants; do
		echo "$(COL "Tenant: ${landlord}_${tenant}" 34)"
		source ./teradata/settings-tenant.sh >> td.log

		sh ./teradata/create-tenant.bteq >> td.log
		sh ./teradata/create-env-usr.bteq >> td.log
	
		for environment in $environments; do
			echo "$(COL "Environment: ${landlord}_${tenant}_${environment}" 34)"
			source ./teradata/settings-env.sh >> td.log

			sh ./teradata/create-env.bteq >> td.log
			sh ./teradata/create-env-roles.bteq >> td.log
			echo "$(COL "Teradata: Creating the databases ---------------------------------" 32)"
			for database in $databases; do
				echo "$(COL "Teradata: Creating the database ----------------------------------" 32)"
				echo "$(COL "Database: ${landlord}_${tenant}_${environment}_${database}" 34)"
				source ./teradata/settings-db.sh >> td.log

				sh ./teradata/create-db.bteq >> td.log
				sh ./teradata/create-db-roles.bteq >> td.log
				sh ./teradata/create-db-user.bteq >> td.log
				sh ./teradata/create-db-table.bteq >> td.log
			
				echo "$(COL "Teradata: Working with QueryGrid ---------------------------------" 32)"
				export tenant
				export environment
				sh ./teradata/create-server-object.bteq >> td.log
				sh ./teradata/validate-server-object.bteq >> td.log
				sh ./teradata/validate-querygrid.bteq >> td.log
			done
		done
	done
}
