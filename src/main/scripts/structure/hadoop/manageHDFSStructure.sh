#!/bin/bash

#source ./settings.sh
source ./hadoop/manageUsers.sh

# createHDFSStructure 
#	- creates the folders for the tenants
#	- creates the environemnt folders under each tenant
#	- creates the environment subfolders (operational data, metadata, ...)
#	- applies the security configuration
function createHDFSStructure {
	export LANDLORD="$(echo $LANDLORD | tr '[:upper:]' '[:lower:]')"
	export TENANTS="$(echo $TENANTS | tr '[:upper:]' '[:lower:]')"
	export ENVS="$(echo $ENVS | tr '[:upper:]' '[:lower:]')"

	showHDFSMessage

	# create tenant and env, create the datalake sub-folders 
	for tenant in $TENANTS; do
		# create the environments for each tenant
		for env in $ENVS; do
			# Replace <tenant> and <env> keywords with corresponding values
			DATALAKE_="${DATALAKE//<tenant>/${LANDLORD}_${tenant}}"
			DATALAKE_="${DATALAKE_//<env>/$env}"
			RAWSTORE_="${RAWSTORE//<tenant>/${LANDLORD}_${tenant}}"
			RAWSTORE_="${RAWSTORE_//<env>/$env}"
			OPDATA_="${OPDATA//<tenant>/${LANDLORD}_$tenant}"
			OPDATA_="${OPDATA_//<env>/$env}"
			OP_METADATA_="${OP_METADATA//<tenant>/${LANDLORD}_$tenant}"
			OP_METADATA_="${OP_METADATA_//<env>/$env}"
			IDA_METADATA_="${IDA_METADATA//<tenant>/${LANDLORD}_$tenant}"
			IDA_METADATA_="${IDA_METADATA_//<env>/$env}"
			DISCOVERY_STORE_="${DISCOVERY_STORE//<tenant>/${LANDLORD}_$tenant}"
			DISCOVERY_STORE_="${DISCOVERY_STORE_//<env>/$env}"

			echo -e "\nCreating structure for tenant [ $(COL $tenant 32) ] in environment [ $(COL $env 35) ]"

			echo "Creating datalake parent folder: $(COL $DATALAKE_ 97)"
			su hdfs -c "hadoop fs -mkdir -p $DATALAKE_"

			# create the RAWSTORE under each environment
			echo "Adding subfolder: $(COL $RAWSTORE_ 97)"
			su hdfs -c "hadoop fs -mkdir $RAWSTORE_"

			# under AGGSTORE, create only the deep-most folders with the -p switch
			# OPDATA, OP_METADATA, IDA_METADATA	

			echo "Adding subfolders: $(COL $OPDATA_ 97)"
			su hdfs -c "hadoop fs -mkdir -p $OPDATA_"
			echo "Adding subfolders: $(COL $OP_METADATA_ 97)"
			su hdfs -c "hadoop fs -mkdir -p $OP_METADATA_"
			echo "Adding subfolders: $(COL $IDA_METADATA_ 97)"
			su hdfs -c "hadoop fs -mkdir -p $IDA_METADATA_"

			echo "Creating discovery store folder: $(COL $DISCOVERY_STORE_ 97)"
			su hdfs -c "hadoop fs -mkdir $DISCOVERY_STORE_"

			echo -e "\nApplying security configuration ..."

			echo -e "\t- remove world access to hdfs://$DATALAKE_ROOT/"
			su hdfs -c "hadoop fs -chmod -R 750 hdfs://$DATALAKE_ROOT/"
			su hdfs -c "hadoop fs -setfacl -R -m default:other::--- hdfs://$DATALAKE_ROOT/"

			echo -e "\t- give tenant $tenant users read access to structure hdfs://$DATALAKE_ROOT/$LANDLORD/$tenant"
			for userName in $USERS; do
				user="${LANDLORD}_${tenant}_${userName}_usr"

				# First each IDA user must travers the base structure
				su hdfs -c "hadoop fs -setfacl -m user:$user:r-x hdfs://$DATALAKE_ROOT/"
				su hdfs -c "hadoop fs -setfacl -m user:$user:r-x hdfs://$DATALAKE_ROOT/$LANDLORD"

				if [ $userName == "etl" ]; then 
					# skip all users who will receive full access explicitly
					continue;
				fi

				# Then give Read access into each tenant's structure
				su hdfs -c "hadoop fs -setfacl -R -m user:$user:r-x hdfs://$DATALAKE_ROOT/$LANDLORD/${LANDLORD}_$tenant"
				# Then make sure all new folders / files will keep this access
				su hdfs -c "hadoop fs -setfacl -R -m default:user:$user:r-x hdfs://$DATALAKE_ROOT/$LANDLORD/${LANDLORD}_$tenant"
			done	

			user="${LANDLORD}_${tenant}_etl_usr"
			echo -e "\t- give user [ $(COL $user 32) ] full access unde hdfs://$DATALAKE_ROOT/$LANDLORD/${LANDLORD}_$tenant/" 
			# Then full access under the structure
			su hdfs -c "hadoop fs -setfacl -m user:$user:--x hdfs://$DATALAKE_ROOT/"
			su hdfs -c "hadoop fs -setfacl -m user:$user:rwx hdfs://$DATALAKE_ROOT/$LANDLORD"
			su hdfs -c "hadoop fs -setfacl -R -m user:$user:rwx hdfs://$DATALAKE_ROOT/$LANDLORD/${LANDLORD}_$tenant/"
			su hdfs -c "hadoop fs -setfacl -R -m default:user:$user:rwx hdfs://$DATALAKE_ROOT/$LANDLORD/${LANDLORD}_$tenant/"
		
			# question: which users should have full access to discovery store
			user="${LANDLORD}_${tenant}_data_scientist_usr"	
			echo -e "\t- give user [ $(COL $user  32) ] full acess to discovery store $DISCOVERY_STORE_" 
			su hdfs -c "hadoop fs -setfacl -R -m user:$user:rwx $DISCOVERY_STORE_"
			su hdfs -c "hadoop fs -setfacl -R -m default:user:$user:rwx $DISCOVERY_STORE_"
		
			user="${LANDLORD}_${tenant}_etl_usr"	
			echo -e "\t- give user [ $(COL $user  32) ] full acess to discovery store $DISCOVERY_STORE_" 
			su hdfs -c "hadoop fs -setfacl -R -m user:$user:rwx $DISCOVERY_STORE_"
			su hdfs -c "hadoop fs -setfacl -R -m default:user:$user:rwx $DISCOVERY_STORE_"
		done
	done

	echo -e "\nDone.\n"
}

function deleteHDFSStructure {
	su hdfs -c "hadoop fs -rm -R hdfs://$DATALAKE_ROOT/$LANDLORD"
}
