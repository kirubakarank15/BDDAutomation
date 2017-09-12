package dsp.automation.runners;

import org.junit.runner.RunWith;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;

import cucumber.api.CucumberOptions;
import cucumber.api.java.Before;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;
@RunWith(Cucumber.class)

@CucumberOptions( strict = false,format = { "pretty",
"json:target/cucumber.json" ,"html:target/site/cucumber-pretty"},features = "src\\test\\java\\dsp\\automation\\features",glue = "stepDefenition",tags ={"@Subscriptions"} ) 


public class TestRunner extends AbstractTestNGCucumberTests {
	 public static String RUNTIME_ENV=null; 


	@Parameters("Environment")
	@BeforeTest
		public void before(String environment) throws Exception{
		RUNTIME_ENV=environment;
		}
	@AfterTest 
	public void after() throws Exception{


		//TestFunctionsFactory.closeBrowser(); 

	} 
	
	

}  