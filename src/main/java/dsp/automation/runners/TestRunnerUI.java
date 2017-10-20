/*package dsp.automation.runners;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.junit.After;
import org.junit.runner.RunWith;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;

import com.cucumber.*;
import com.cucumber.listener.ExtentCucumberFormatter;
import com.relevantcodes.extentreports.DisplayOrder;
import com.relevantcodes.extentreports.NetworkMode;
import com.relevantcodes.extentreports.DisplayOrder;
import com.relevantcodes.extentreports.NetworkMode;

import cucumber.api.CucumberOptions;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;

import dsp.automation.utilities.TestFunctionsFactory;

@RunWith(Cucumber.class)

@CucumberOptions(features = "src\\test\\java\\dsp\\automation\\features", glue = "stepDefenition", tags = {
		"@Navigation_Login,@dd" }, plugin = { "com.cucumber.listener.ExtentCucumberFormatter:" })

public class TestRunnerUI extends AbstractTestNGCucumberTests {
	public static String RUNTIME_ENV;
	public static Scenario scenario;

	@Parameters("Environment")
	@BeforeTest
	public void before(String environment) throws Exception {

		RUNTIME_ENV = environment;
		TestRunner.RUNTIME_ENV = RUNTIME_ENV;
		CustomExtentReport.before();

	}
 
	@Before
	public void before(Scenario scenario) {
		this.scenario = scenario;

	}

	@After
	public static void embedScreenshot() {
		if (scenario.isFailed()) {
			try {
				byte[] screenshot = ((TakesScreenshot) TestFunctionsFactory.driver).getScreenshotAs(OutputType.BYTES);
				scenario.embed(screenshot, "image/png");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}*/