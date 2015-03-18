#!/bin/bash

echo ---------------- Database settings-------------
db_name=@settings.tenant.environment.database.db_name@
ro_db_name=@settings.tenant.environment.database.ro_db_name@
ro_db_name_restricted=@settings.tenant.environment.database.ro_db_name_restricted@
ro_db_server_object=@settings.tenant.environment.database.ro_db_server_object@
ro_db_server_object_select=@settings.tenant.environment.database.ro_db_server_object_select@
ro_db_server_object_insert=@settings.tenant.environment.database.ro_db_server_object_insert@
user_db_name=@settings.tenant.environment.database.user_db_name@
user_db_name_restricted=@settings.tenant.environment.database.user_db_name_restricted@
profile_db=@settings.tenant.environment.database.profile_db@
table_db_qg=@settings.tenant.environment.database.table_db_qg@
server_object_db=@settings.tenant.environment.database.server_object_db@
hive_database_qg=@settings.tenant.environment.database.hive_database_qg@
view_db_qg=@settings.tenant.environment.database.view_db_qg@
view_db_qg_restricted=@settings.tenant.environment.database.view_db_qg_restricted@
db_perm_space=@settings.tenant.environment.database.db_perm_space@
hive_username=@settings.tenant.environment.database.hive_username@

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
export db_perm_space
export hive_username

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
echo Database Perm Space= $db_perm_space
echo Hive user name=$hive_username
