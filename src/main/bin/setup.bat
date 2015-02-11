<<<<<<< HEAD
@echo off
rem #####################################################################################################
rem Setup/Deployment startup script, probably won't be needed windows version it is just for the demo
rem This is just a shell script which will call groovy setup script which has more advanced logic
rem
rem author: Dumitru Ciubenco
rem created: 23.01.2015
rem ######################################################################################################
=======
@echo off
rem #####################################################################################################
rem Setup/Deployment startup script, probably won't be needed windows version it is just for the demo
rem This is just a shell script which will call groovy setup script which has more advanced logic
rem
rem author: Dumitru Ciubenco
rem created: 23.01.2015
rem ######################################################################################################
>>>>>>> 42c0e72515adbfe448a3039d13da02f45e943f2a
java -Dfile.encoding=UTF-8 -cp "../lib/*;../groovy" groovy.lang.GroovyShell setup.groovy testArgumentPassed