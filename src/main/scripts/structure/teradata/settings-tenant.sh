#!/bin/bash

source ./settings.sh

echo ---------------- Tenant settings-------------

landlord_tenant=@settings.tenant.landlord_tenant@

echo Tenant=$tenant
echo Landlord Tenant=$landlord_tenant

#echo --------PROFILES-----------
profile_tenant=@settings.tenant.profile_tenant@
echo Profile Tenant = $profile_tenant

#echo --------ROLES-----------
ro_tenant_admin=@settings.tenant.ro_tenant_admin@
ro_tenant_select=@settings.tenant.ro_tenant_select@
#echo --------USERS-----------
user_name_admin=@settings.tenant.user_name_admin@
user_name_scientist=@settings.tenant.user_name_scientist@

echo Role tenant Admin = $ro_tenant_admin
echo Role tenant Select = $ro_tenant_select
echo User Name Admin $user_name_admin
echo User Name Scientist $user_name_scientist

#echo -------ENVIRONMENTS-------------
env_usr=@settings.tenant.env_usr@
echo Database USER = $env_usr

#echo -------PERM SPACE---------------
tenant_perm_space=@settings.tenant.tenant_perm_space@
echo Tenant Permspace $tenant_perm_space

export landlord_tenant
export profile_tenant
export env_usr
export tenant_perm_space
export ro_tenant_admin
export ro_tenant_select
export user_name_admin
export user_name_scientist
