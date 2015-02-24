#!/bin/bash

echo ---------------- Tenant settings-------------

landlord_tenant="$landlord"_"$tenant"

export tenant
export landlord_tenant

echo Tenant=$tenant
echo Landlord Tenant=$landlord_tenant

#echo --------PROFILES-----------
M0=M0
H0=H0
export M0
export H0
profile_tenant=PR_"$landlord"_"$tenant"
export profile_tenant
echo Profile Tenant = $profile_tenant

#echo --------ROLES-----------
ro_tenant_admin=RO_"$landlord"_"$tenant"_ADMIN
ro_tenant_select=RO_"$landlord"_"$tenant"_SELECT
user_name_admin="$landlord"_"$tenant"_USR_ADMIN
user_name_scientist="$landlord"_"$tenant"_USR_SCIENTIST

export ro_tenant_admin
export ro_tenant_select
export user_name_admin
export user_name_scientist

echo Role tenant Admin = $ro_tenant_admin
echo Role tenant Select = $ro_tenant_select
echo User Name Admin $user_name_admin
echo User Name Scientist $user_name_scientist

#echo -------ENVIRONMENTS-------------
env_usr="$landlord"_"$tenant"_USR
export env_usr
echo Database USER = $env_usr

#echo -------PERM SPACE---------------
tenant_perm_space=$((($landlord_perm_space/$count_tenants)-1000000))
export tenant_perm_space
echo Tenant Permspace $tenant_perm_space
