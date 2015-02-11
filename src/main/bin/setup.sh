<<<<<<< HEAD
#!/bin/sh
###########################################################################################################
# Setup/Deployment startup script
# This is just a shell script which will call groovy setup script which has more advanced logic
#
# author: Dumitru Ciubenco
# created: 23.01.2015
###########################################################################################################

=======
#!/bin/sh
###########################################################################################################
# Setup/Deployment startup script
# This is just a shell script which will call groovy setup script which has more advanced logic
#
# author: Dumitru Ciubenco
# created: 23.01.2015
###########################################################################################################

>>>>>>> 42c0e72515adbfe448a3039d13da02f45e943f2a
java -Dfile.encoding=UTF-8 -cp "../lib/*;../groovy" groovy.lang.GroovyShell setup.groovy testArgumentPassed