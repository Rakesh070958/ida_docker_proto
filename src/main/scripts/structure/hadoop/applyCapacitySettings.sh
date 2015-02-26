#!/bin/bash

#source ./settings.sh
source ./utilities.sh

## applyCapacitySchedulerConfiguration
## - based on the configuration, it suggests the configuration 
##	 changes to be applied through Ambari and to restart the corresponding node
##
function applyCapacitySchedulerConfiguration {
	# give a queue to each tenant:
	settings="yarn.scheduler.capacity.root.queues="
	for tenant in $TENANTS; do 
		settings="${settings}${LANDLORD}_$tenant,"
	done
	# remove last coma
	settings=${settings%?}
	# add new line
	settings="$settings\n"

	# get number of tenants
	nTenants=$(wc -w <<< "$TENANTS")
	# get the fair percentage for each tenant
	queueRatioPerTenant=$((100 / $nTenants))

	for tenant in $TENANTS; do 
		# assign overall tenant capacity (i.e. 25% for 4 tenants)
		queue="yarn.scheduler.capacity.root.${LANDLORD}_$tenant.capacity=$queueRatioPerTenant\n"
		# it cannot grow more than that
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.maximum-capacity=$queueRatioPerTenant\n"
		# create a new etl queue fir each tenant
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_etl.capacity=$MIN_ETL\n"
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_etl.maximum-capacity=$MAX_ETL\n"
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_etl.acl_submit_applications=${LANDLORD}_${tenant}_etl\n"
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_etl.acl_administer_queue=${LANDLORD}_${tenant}_etl\n"
		# cerate an alaytics queue for each tenant
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_analytics.capacity=$MIN_ANALYTICS\n"
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_analytics.maximum-capacity=$MAX_ANALYTICS\n"
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_analytics.acl_submit_applications=${LANDLORD}_${tenant}_analytics\n"
		queue="${queue}yarn.scheduler.capacity.root.${LANDLORD}_$tenant.${LANDLORD}_${tenant}_analytics.acl_administer_queue=${LANDLORD}_${tenant}_analytics\n"

		settings="${settings}$queue"
	done

	showCapacityMessage $settings
}
