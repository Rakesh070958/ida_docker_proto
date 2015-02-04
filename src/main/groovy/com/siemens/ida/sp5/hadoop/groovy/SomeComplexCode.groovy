package com.siemens.ida.sp5.hadoop.groovy

/**
 * Just a dummy class which demonstrates that it is also possible to put deployment logic also here 
 * and not only in the shell script, E.g: Create some SQL script and connect to a database and execute some SQL script
 *  
 * author: Dumitru Ciubenco 
 * created: 23.01.2015
 */
class SomeComplexCode {
    void execute() {
        println("Very complex code executed from gradle class, which can't be executed from simple script");
        println("This groovy class also can be parametrized by the build profile : @profile@");
    }
}
