#!/bin/bash

echo ---------------- General settings-------------
servername=SDL
superuser=Sysdba_PGD
superuser_password=PGD_tlu_123

export servername
export superuser
export superuser_password

echo ServerName = $servername
echo SuperUser = $superuser
echo SuperUser Password = $superuser_password


echo ---------------- HADOOP/HIVE settings-------------
hosttype=hadoop
hive_metastore_server=smp200-8
hive_metastore_port=9083
hive_port=10000
hive_username=hive
hive_dbname=default
hive_templeton_port=50111
hadoop_nameservices=SIEMENSCTHADOOP
hadoop_namenode1=hdp200-8:8020
hadoop_namenode2=hdp200-9:8020

export hosttype
export hive_metastore_server
export hive_metastore_port
export hive_port
export hive_username
export hive_dbname
export hive_templeton_port
export hadoop_nameservices
export hadoop_namenode1
export hadoop_namenode2

echo hosttype= $hosttype
echo hive_metastore_server=$hive_metastore_server
echo hive_metastore_port=$hive_metastore_port
echo hive_port=$hive_port
echo hive_username=$hive_username
echo hive_dbname=$hive_dbname
echo hive_templeton_port=$hive_templeton_port
echo hadoop_nameservices=$hadoop_nameservices
echo hadoop_namenode1=$hadoop_namenode1
echo hadoop_namenode2=$hadoop_namenode2


echo ----------ROLES-------------
ro_landlord_admin=RO_"$landlord"_ADMIN
export ro_landlord_admin
echo Role landlord Admin = $ro_landlord_admin

echo --------PROFILES-------
M0=M0
H0=H0
export M0
export H0
profile_landlord=PR_"$landlord"
export profile_landlord
echo Profile Tenant = $profile_landlord


count_tenants=0
for tenant in $tenants; do
count_tenants=$(($count_tenants+1))
done
export count_tenants

count_envs=0
for environment in $environments; do
count_envs=$(($count_envs+1))
done
export count_envs

count_dbs=0
for database in $databases; do
count_dbs=$(($count_dbs+1))
done
export count_dbs

