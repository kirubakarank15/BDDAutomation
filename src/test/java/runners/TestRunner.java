package runners;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.junit.runner.RunWith;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.AfterTest;

import com.cucumber.listener.ExtentCucumberFormatter;
import com.relevantcodes.extentreports.DisplayOrder;
import com.relevantcodes.extentreports.NetworkMode;

import cucumber.api.CucumberOptions;
import cucumber.api.Scenario;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.junit.Cucumber;
import io.cucumber.testng.AbstractTestNGCucumberTests;

@RunWith(Cucumber.class) 
@io.cucumber.junit.CucumberOptions
(features = "C:\\Users\\HP\\Downloads\\DemoAssignment\\DemoAssignment\\FeatureFiles",  plugin = { "pretty", "html:target/cucumber-reports" },
glue = "src\\test\\java\\stepDefenition", 
tags = "@Demo"  
)

public class TestRunner extends AbstractTestNGCucumberTests{

	public Scenario myScenario;

	
	public void before() throws Exception {
		Date dNow = new Date(); 
		SimpleDateFormat ft = new SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa");
		String timeStamp = ft.format(dNow).replaceAll(":", "_");

		DisplayOrder NEWEST_FIRST = null; 
		NetworkMode ONLINE = null;
		ExtentCucumberFormatter.initiateExtentCucumberFormatter(
				new File("TestReports\\PropertyFinderDemo" + timeStamp + ".html"), false, NEWEST_FIRST, ONLINE,
				new Locale("en-US"));
		ExtentCucumberFormatter.loadConfig(new File("Resources\\extents-config.xml"));
	}

	@AfterTest
	public void after() throws IOException {
		TestFunctionsFactory.driver.quit();
		Runtime.getRuntime().exec("taskkill /im chromedriver.exe /f");

	}

	public void embedScreenshot() {
		System.out.println("SS is entering");

		byte[] screenshot = ((TakesScreenshot) TestFunctionsFactory.driver).getScreenshotAs(OutputType.BYTES);
		myScenario.embed(screenshot, "image/png");
		/*
		 * if (myScenario.isFailed()) { try { System.out.println("SS TAKEN");
		 * byte[] screenshot1 = ((TakesScreenshot) TestFunctionsFactory.driver)
		 * .getScreenshotAs(OutputType.BYTES); scenario.embed(screenshot1,
		 * "image/png"); } catch (Exception e) { e.printStackTrace(); } }
		 */
	}

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