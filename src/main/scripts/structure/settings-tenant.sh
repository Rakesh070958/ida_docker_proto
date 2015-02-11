#!/bin/bash

echo ------------SETTINGS TENANT------

export tenant
echo TENANT: $tenant
echo LANDLORD-TENANT: "$landlord"_"$tenant"

landlord_tenant="$landlord"_"$tenant"
export landlord_tenant
echo Landlord Tenant = $landlord_tenant

#echo --------PROFILES-----------
M0=M0
H0=H0
export M0
export H0
profile_tenant=@tenant.profile@
export profile_tenant
echo Profile Tenant = $profile_tenant

#echo -------ENVIRONMENTS-------------
env_usr=@environment.user@
export env_usr
echo Database USER = $env_usr

ro_tenant_admin=@tenant.role.admin@
export ro_tenant_admin
echo Role tenant Admin = $ro_tenant_admin

ro_tenant_select=@tenant.role.select@
export ro_tenant_select
echo Role tenant Select = $ro_tenant_select

user_name_admin=@environment.username.admin@
export user_name_admin
echo User Name Admin $user_name_admin

user_name_scientist=@environment.username.scientist@
export user_name_scientist
echo User Name Scientist $user_name_scientist

#echo -------PERM SPACE---------------
tenant_perm_space=@tenant.permsize.formula@
export tenant_perm_space
echo Tenant Permspace $tenant_perm_space
