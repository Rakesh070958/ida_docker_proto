#!/bin/bash

db_name="$landlord"_"$tenant"_"$environment"_"$database"
ro_db_name=RO_"$landlord"_"$tenant"_"$environment"_"$database"
db_perm_space=$((($env_perm_space/$count_dbs)-1000000))

export db_name
export ro_db_name
export db_perm_space

echo Database Name= $db_name
echo Role Database= $ro_db_name
echo Database Perm Space= $db_perm_space

