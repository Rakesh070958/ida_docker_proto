#!/bin/bash
###########################################################################################################
# Setup/Deployment entrypoint script
# This is just a shell script which will call groovy setupTeradata script which has more advanced logic
# Also make sense to invoke directly from here scripts if needed
#
# author: Dumitru Ciubenco
# created: 23.01.2015
###########################################################################################################

java -Dfile.encoding=UTF-8 -cp "../lib/*;../groovy" groovy.lang.GroovyShell setupTeradata.groovy testArgumentPassed

