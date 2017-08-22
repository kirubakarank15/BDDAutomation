package dsp.automation.runners;

import java.util.Properties;

import org.junit.runner.RunWith;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

import cucumber.api.CucumberOptions;
import cucumber.api.java.Before;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;
@RunWith(Cucumber.class)

@CucumberOptions( strict = false,format = { "pretty",
"json:target/cucumber.json" ,"html:target/site/cucumber-pretty"},features = "src\\test\\java\\dsp\\automation\\features\\feature",glue = "stepDefenition",tags ={"@API"} ) 


public class TestRunner extends AbstractTestNGCucumberTests {
	 public static Properties objProperty;
	@BeforeTest
		public void before() throws Exception{

 
		}
	@AfterTest 
	public void after() throws Exception{

		objProperty=null;
		//TestFunctionsFactory.closeBrowser();

	} 
	
	

}  