#!/bin/bash

env_name=@environment.name@
env_usr=@environment.user@
user_from_tenant=@environment.user.from.tenant@
user_name=@environment.username@
user_name_admin=@environment.username.admin@
user_name_scientist=@environment.username.scientist@
ro_name=@environment.rolename@
profile_env=@environment.profile@
env_perm_space=@environment.permsize.formula@

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

