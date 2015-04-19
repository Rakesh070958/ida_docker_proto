#!/bin/bash

#source ./settings.sh
source ./utilities.sh

### createHiveTables
### 	- create the platform table
function createHiveTables {
	for tenant in $TENANTS; do
        for env in $ENVS; do
			# determine the location of table
			IDA_METADATA_="${IDA_METADATA//<tenant>/${LANDLORD}_$tenant}"
			IDA_METADATA_="${IDA_METADATA_//<env>/$env}"
			
			TABLE_LOCATION="${IDA_METADATA_}/audit"	
			DATABASE_NAME="${LANDLORD}_${tenant}_${env}_d_mtd"
			TABLE_NAME="$DATABASE_NAME.audit"		# See Naming Conventions - 20150108.doc

			etl_usr="${LANDLORD}_${tenant}_etl_usr"	

			echo "Creating table $(COL "$TABLE_NAME" 36) ..."
			rm -rf /tmp/$etl_usr

			hadoop fs -mkdir /user/$etl_usr 2>&1 > /dev/null
			hadoop fs -chown $etl_usr:hdfs /user/$etl_usr 2>&1 > /dev/null

			su $etl_usr -c "hive -e \"
			CREATE DATABASE $DATABASE_NAME;
			CREATE EXTERNAL TABLE IF NOT EXISTS $TABLE_NAME (
				FILEPATH STRING,
				FILEEXTENSION STRING,
				TIMESTP TIMESTAMP,
				USERNAME STRING,
				OPERATION STRING,
				DIVISION STRING, DEVICEID STRING, DATATYPE STRING)
			ROW FORMAT DELIMITED
			FIELDS TERMINATED BY '\t'
			STORED AS TEXTFILE
			LOCATION '$TABLE_LOCATION';\""
		done
	done
}

			### deleteHiveTables
###		- remove platform tables
function deleteHiveTables {
	for tenant in $TENANTS; do
        	for env in $ENVS; do
			etl_usr="${LANDLORD}_${tenant}_etl_usr"
			rm -rf /tmp/$etl_usr 2>&1 > /dev/null
			su $etl_usr -c "hive -e \"DROP DATABASE ${LANDLORD}_${tenant}_${env}_d_mtd CASCADE;\""
		done
	done
}
