<<<<<<< HEAD
/*
 * description: Setup/deploy script
 * author: Dumitru Ciubenco
 * created: 23.01.2015
 */
import com.siemens.ida.sp5.hadoop.groovy.SomeComplexCode

def sout = new StringBuffer()
def serr = new StringBuffer()

//Create structure
def p1 = "../scripts/setup_structure.bat".execute()
p1.consumeProcessOutput(sout, serr)
println sout
println serr

//configure the security
def p2 = "../scripts/setup_structure.bat".execute()
p2.consumeProcessOutput(sout, serr)
println sout
println serr

def someComplexCode = new SomeComplexCode();
=======
/*
 * description: Setup/deploy script
 * author: Dumitru Ciubenco
 * created: 23.01.2015
 */
import com.siemens.ida.sp5.hadoop.groovy.SomeComplexCode

def sout = new StringBuffer()
def serr = new StringBuffer()

//Create structure
def p1 = "../scripts/setup_structure.bat".execute()
p1.consumeProcessOutput(sout, serr)
println sout
println serr

//configure the security
def p2 = "../scripts/setup_structure.bat".execute()
p2.consumeProcessOutput(sout, serr)
println sout
println serr

def someComplexCode = new SomeComplexCode();
>>>>>>> 42c0e72515adbfe448a3039d13da02f45e943f2a
someComplexCode.execute();