#!/bin/bash

echo ---------------- Environment settings-------------
env_name="$landlord"_"$tenant"_"$environment"
env_usr="$landlord"_"$tenant"_USR
user_from_tenant="$landlord"_"$tenant"_USR_"$environment"
user_name="$landlord"_"$tenant"_USR_"$environment"
user_name_admin="$landlord"_"$tenant"_USR_ADMIN
user_name_scientist="$landlord"_"$tenant"_USR_SCIENTIST
ro_name=RO_"$landlord"_"$tenant"_"$environment"
profile_env=PR_"$landlord"_"$tenant"_"$environment"
env_perm_space=$((($tenant_perm_space/$count_envs)-1000000))

export env_name
export env_usr
export user_from_tenant
export user_name
export user_name_admin
export user_name_scientist
export ro_name
export profile_env
export env_perm_space

echo Environment Name= $env_name
echo Environment User=  $env_usr
echo User From Tenant= $user_from_tenant
echo User Admin= $user_name_admin
echo User Scientist= $user_name_scientist
echo Profile Environment= $profile_env
echo Environment Perm Space= $env_perm_space

