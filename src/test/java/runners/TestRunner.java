package runners;

import java.io.IOException;

import org.junit.AfterClass;
import org.junit.runner.RunWith;

import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.BeforeStep;
import io.cucumber.java.Scenario;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import stepDefenition.Hooks;


@RunWith(Cucumber.class)
@CucumberOptions(features = "C:\\Users\\HP\\Downloads\\DemoAssignment\\DemoAssignment\\FeatureFiles", plugin = {
		"pretty","json:target/cucumber.json","junit:target/cucumber-reports/cucumber.xml"  }, glue = "stepDefenition", tags = "@ExpecdiaSearch")

public class TestRunner {


@AfterClass
public static void postTest() throws IOException {
	Hooks obj=new Hooks();
	obj.reportConfiguration();
	
	TestFunctionsFactory.closeBrowser();
	Runtime.getRuntime().exec("taskkill /im chromedriver.exe /f"); 
}
/*
 * @BeforeStep public void addScreenShot(Scenario scenario) throws IOException {
 * 
 * System.out.println("Entered"); }
 */
}
/*
 * @CucumberOptions( strict = false,format = { "pretty",
 * "json:target/cucumber.json" ,"html:target/site/cucumber-pretty"}, plugin =
 * {"com.cucumber.listener.ExtentCucumberFormatter:output/report.html"},features
 * = "src\\test\\java\\dsp\\automation\\features",glue = "stepDefenition",tags
 * ={"@API"} )
 * 
 * 
 * public class TestRunner extends AbstractTestNGCucumberTests { public static
 * String RUNTIME_ENV=null;
 * 
 * public static Scenario scenario;
 * 
 * 
 * @Parameters("Environment")
 * 
 * @BeforeClass
 * 
 * public void before(String environment) throws Exception{
 * 
 * RUNTIME_ENV=environment;
 * 
 * }
 * 
 * @AfterClass
 * 
 * public static void setup() { Reporter.loadXMLConfig(new
 * File("Resources/extents-config.xml")); Reporter.setSystemInfo("user",
 * System.getProperty("user.name")); Reporter.setSystemInfo("os", "Mac OSX");
 * Reporter.setTestRunnerOutput("Sample test runner output message");
 * 
 * }
 * 
 * }
 */