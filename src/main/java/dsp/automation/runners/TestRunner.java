package dsp.automation.runners;

import java.io.File;

import org.junit.After;
import org.junit.runner.RunWith;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;

import com.cucumber.listener.Reporter;

import cucumber.api.CucumberOptions;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;
@RunWith(Cucumber.class)

@CucumberOptions( strict = false,format = { "pretty",
"json:target/cucumber.json" ,"html:target/site/cucumber-pretty"},  plugin = {"com.cucumber.listener.ExtentCucumberFormatter:output/report.html"},features = "src\\test\\java\\dsp\\automation\\features",glue = "stepDefenition",tags ={"@Services"} ) 


public class TestRunner extends AbstractTestNGCucumberTests {
	 public static String RUNTIME_ENV=null; 

	 public static Scenario scenario;
	

	@Parameters("Environment")
	 @BeforeClass
	 
		public void before(String environment) throws Exception{

		RUNTIME_ENV=environment;

		}
	 @AfterClass
	 
	    public static void setup() {
	        Reporter.loadXMLConfig(new File("Resources/extents-config.xml"));
	        Reporter.setSystemInfo("user", System.getProperty("user.name"));
	        Reporter.setSystemInfo("os", "Mac OSX");
	        Reporter.setTestRunnerOutput("Sample test runner output message");
	    }
	
}  