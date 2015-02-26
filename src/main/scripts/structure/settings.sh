# Name of the Siemens sector (one of: SP1, SP2, SP3, SP4, SP6)
LANDLORD="@setup.landlord@"
# List of business units within LANDLORD (must be two)
#TENANTS="ps_usr ps_gtop ps_sams ps_usi"
TENANTS="@setup.tenants@"
#TENANTS="ps_usr ps_gtop ps_sams"
# List of environments to set up 
# DEV TST PRD PRP (for PreProd) (PRD should be used only by itself)
ENVS="@setup.environments@" 

##############################################################################
### HDFS folder structure configuration
##############################################################################
# Creating the following structure
# /<tenant>/<env>/datalake/rawDataStore
# /<tenant>/<env>/aggregatedDataStore
# /<tenant>/<env>/aggregatedDataStore/opData
# /<tenant>/<env>/aggregatedDataStore/opMetadata
# /<tenant>/<env>/aggregatedDataStore/idaMetadata
#
# /<tenant>/<env>/discoveryStore
#
DATALAKE_ROOT="/ida_demo_struct"
DATALAKE="hdfs://$DATALAKE_ROOT/$(echo $LANDLORD | tr '[:upper:]' '[:lower:]')/<tenant>/<env>/datalake"
RAWSTORE="$DATALAKE/rawDataStore"
AGGSTORE="$DATALAKE/aggregatedDataStore"
###
# Within Aggregated Store:
OPDATA="$AGGSTORE/opData"
# Operational Metadata
# (holds informaion that originated from tenant like sensor id associations, 
# conversion function, etc)
OP_METADATA="$AGGSTORE/opMetadata"
# Name of the Platform Metadata 
# (holds information that is generated and used interanlly by the platform)
IDA_METADATA="$AGGSTORE/idaMetadata"
###
# Discovery store
DISCOVERY_STORE="hdfs://$DATALAKE_ROOT/$(echo $LANDLORD | tr '[:upper:]' '[:lower:]')/<tenant>/<env>/discoveryStore"
##############################################################################


##############################################################################
### User / Group definitions
##############################################################################
LANDLORD_SUPERUSER="sysadmin" # Need to know how to name it, parent group and special permissions
# Per tenant group & users naming conventions
# Each user will be created to belong to group GROUP and additionaly to LINUX_GROUPS
GROUP="ida"
USERS="etl datamodeler analytics data_scientist"
# Additional groups where the each user to belong to
# comma separated list (no space in between)
LINUX_GROUPS="users"

##############################################################################
### Capacity Queues Configuration
##############################################################################
MIN_ETL=20
MAX_ETL=40
MIN_ANALYTICS=40
MAX_ANALYTICS=100


##############################################################################
### Teradata settings
##############################################################################
databases="@setup.databases@"


landlord=$(echo $LANDLORD | tr '[:lower:]' '[:upper:]')
tenants="@setup.tenants@"
tenants=$(echo $tenants | tr '[:lower:]' '[:upper:]')
landlord_perm_space=@setup.landlord_perm_space@
environments=$(echo $ENVS | tr '[:lower:]' '[:upper:]')

servername=@settings.servername@
superuser=@settings.superuser@
superuser_password=@settings.superuser_password@
hosttype=@settings.hosttype@
hive_metastore_server=@settings.hive_metastore_server@
hive_metastore_port=@settings.hive_metastore_port@
hive_port=@settings.hive_port@
hive_username=@settings.hive_username@
hive_templeton_port=@settings.hive_templeton_port@
hadoop_nameservices=@settings.hadoop_nameservices@
hadoop_namenode1=@settings.hadoop_namenode1@
hadoop_namenode2=@settings.hadoop_namenode2@
ro_landlord_admin=@settings.ro_landlord_admin@
M0=@settings.M0.account.priority@
H0=@settings.H0.account.priority@
profile_landlord=@settings.profile_landlord@

count_tenants=$(echo $tenants | wc -w)
count_envs=$(echo $environments | wc -w)
count_dbs=$(echo $databases | wc -w)

# exporting variables for the bteq scripts:
export databases
export landlord
export tenants
export landlord_perm_space
export environments
export servername
export superuser
export superuser_password
export hosttype
export hive_metastore_server
export hive_metastore_port
export hive_port
export hive_username
export hive_templeton_port
export hadoop_nameservices
export hadoop_namenode1
export hadoop_namenode2
export ro_landlord_admin
export M0
export H0
export profile_landlord
export count_tenants
export count_envs
export count_dbs

