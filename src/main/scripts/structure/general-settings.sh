#!/bin/bash

servername=@settings.servername@
export servername
echo ServerName = $servername

superuser=@settings.superuser@
export superuser
echo SuperUser = $superuser

superuser_password=@settings.superuser_password@
export superuser_password
echo SuperUser Password = $superuser_password

echo ----------ROLES-------------
ro_landlord_admin=@roles.landlord_admin@
export ro_landlord_admin
echo Role landlord Admin = $ro_landlord_admin

echo --------PROFILES-------
M0=M0
H0=H0
export M0
export H0
profile_landlord=@profile.landlord@
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

