#!/bin/bash

echo ---------------- Environment settings-------------
env_name=@settings.tenant.environment.env_name@
env_usr=@settings.tenant.environment.env_usr@
user_from_tenant=@settings.tenant.environment.user_from_tenant@
user_name=@settings.tenant.environment.user_name@
user_name_admin=@settings.tenant.environment.user_name_admin@
user_name_scientist=@settings.tenant.environment.user_name_scientist@
ro_name=@settings.tenant.environment.ro_name@
profile_env=@settings.tenant.environment.profile_env@
env_perm_space=@settings.tenant.environment.env_perm_space@

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

