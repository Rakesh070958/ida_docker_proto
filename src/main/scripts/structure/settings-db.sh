#!/bin/bash

echo ---------------- Database settings-------------
db_name="$landlord"_"$tenant"_"$environment"_"$database"
ro_db_name=RO_"$landlord"_"$tenant"_"$environment"_"$database"
ro_db_name_restricted=RO_"$landlord"_"$tenant"_"$environment"_"$database"_RESTRICTED
ro_db_server_object=RO_HADOOP_CREATE_FS_"$landlord"_"$tenant"_"$environment"_"$database"
ro_db_server_object_select=RO_HADOOP_FS_SEL_"$landlord"_"$tenant"_"$environment"_"$database"
ro_db_server_object_insert=RO_HADOOP_FS_INS_"$landlord"_"$tenant"_"$environment"_"$database"
user_db_name="$landlord"_"$tenant"_USR_"$environment"_"$database"
user_db_name_restricted="$landlord"_"$tenant"_USR_"$environment"_"$database"_RESTRICTED
profile_db=PR_"$landlord"_"$tenant"_"$environment"_"$database"
table_db_qg=trends_qg_"$landlord"_"$tenant"_"$environment"_"$database"
server_object_db=SO_"$landlord"_"$tenant"_"$environment"_"$database"
hive_database_qg=hive_db_"$landlord"_"$tenant"_"$environment"_"$database"
view_db_qg=view_qg_"$landlord"_"$tenant"_"$environment"_"$database"
view_db_qg_restricted=view_qg_"$landlord"_"$tenant"_"$environment"_"$database"_restricted
db_perm_space=$((($env_perm_space/$count_dbs)-1000000))

export db_name
export ro_db_name
export ro_db_name_restricted
export ro_db_server_object
export ro_db_server_object_select
export ro_db_server_object_insert
export user_db_name
export user_db_name_restricted
export profile_db
export server_object_db
export table_db_qg
export view_db_qg
export view_db_qg_restricted
export hive_database_qg
export db_perm_space

echo Database Name= $db_name
echo Role Database= $ro_db_name
echo Role Server Object=$ro_db_server_object
echo Role Select Server Object=$ro_db_server_object_select
echo Role Insert Server Object=$ro_db_server_object_insert
echo User Database= $user_db_name
echo Profile database= $profile_db
echo Server object Database= $server_object_db
echo Table QueryGrid Database=$table_db_qg
echo View QueryGrid=$view_db_qg
echo Hive Database QueryGrid=$hive_database_qg
echo Database Perm Space= $db_perm_space

