/*
 * description: Setup/deploy script
 * author: Dumitru Ciubenco
 * created: 23.01.2015
 */
import com.siemens.ida.sp5.teradata.groovy.SomeComplexCode

def sout = new StringBuffer()
def serr = new StringBuffer()

//Create structure
def p1 = "../scripts/structure/setup.sh".execute()
p1.consumeProcessOutput(sout, serr)
println sout
println serr



def someComplexCode = new SomeComplexCode();
someComplexCode.execute();