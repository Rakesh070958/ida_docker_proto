#!/bin/sh
###########################################################################################################
# Setup/Deployment startup script
# This is just a shell script which will call groovy setup script which has more advanced logic
#
# author: Dumitru Ciubenco
# created: 23.01.2015
###########################################################################################################

java -Dfile.encoding=UTF-8 -cp "../lib/*;../groovy" groovy.lang.GroovyShell setup.groovy testArgumentPassed