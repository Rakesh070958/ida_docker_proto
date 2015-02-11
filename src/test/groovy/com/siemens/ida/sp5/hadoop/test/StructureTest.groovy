package com.siemens.ida.sp5.hadoop.test

import org.junit.After
import org.junit.Before
import org.junit.Test

/**
 * Demo test class
 *
 * author: Dumitru Ciubenco 
 * created: 23.01.2015
 */
class StructureTest {
    private final String SCRIPT_PATH = new File("build/output/scripts").absolutePath + File.separator;
    def sout = new StringBuffer()
    def serr = new StringBuffer()

    @Test(expected = ArithmeticException)
    void justDummyTest() {
        assert 1 == 1
        assert 2 + 2 == 4: "We're in trouble"
        println 1 / 0
    }

    @Before
    void setupStructure() {
        def p1 = (SCRIPT_PATH + "setup_structure.bat").execute()
        p1.consumeProcessOutput(sout, serr)
        println sout
        if (serr.length() > 0) {
            throw RuntimeException(serr);

        }
    }

    @After
    void dropStructure() {
        def p1 = (SCRIPT_PATH + "cleanup_structure.bat").execute()
        p1.consumeProcessOutput(sout, serr)
        println sout
        if (serr.length() > 0) {
            throw RuntimeException(serr);

        }
    }

}