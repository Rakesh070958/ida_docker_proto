@echo off
rem #####################################################################################################
rem Setup/Deployment startup script, probably won't be needed windows version it is just for the demo
rem This is just a shell script which will call groovy setup script which has more advanced logic
rem
rem author: Dumitru Ciubenco
rem created: 23.01.2015
rem ######################################################################################################
java -Dfile.encoding=UTF-8 -cp "../lib/*;../groovy" groovy.lang.GroovyShell setupTeradata.groovy testArgumentPassed