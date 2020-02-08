package com.mycompany.mockup;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class DbConnectionTest extends TestCase {
	
	/**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public DbConnectionTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( DbConnectionTest.class );
    }

    /**
     * Rigourous Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }

}
