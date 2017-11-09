	
package dsp.automation.runners;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.junit.runner.RunWith;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;

import com.cucumber.listener.ExtentCucumberFormatter;
import com.relevantcodes.extentreports.DisplayOrder;
import com.relevantcodes.extentreports.NetworkMode;

import cucumber.api.CucumberOptions;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import dsp.automation.utilities.TestFunctionsFactory;
@RunWith(Cucumber.class)
@CucumberOptions(features = "src\\test\\java/dsp\\automation\\features\\MADA", glue = "stepDefenition", tags = {
"@catlogin" }, plugin = { "com.cucumber.listener.ExtentCucumberFormatter:" })

public class  TestRunner extends AbstractTestNGCucumberTests {
	public static String RUNTIME_ENV;
	public Scenario myScenario;

	@Parameters("Environment")
	@BeforeTest
	public void before(String environment) throws Exception {
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa");
		String timeStamp = ft.format(dNow).replaceAll(":", "_");

		RUNTIME_ENV = environment;

		DisplayOrder NEWEST_FIRST = null;
		NetworkMode ONLINE = null;
		ExtentCucumberFormatter.initiateExtentCucumberFormatter
		(new File("target\\site\\cucumber-pretty\\DSP_Automation_API"+timeStamp+".html"),
		false, NEWEST_FIRST, ONLINE, new Locale("en-US"));
		ExtentCucumberFormatter.loadConfig(new File("Resources\\extents-config.xml"));
	}
 
	@Before
	public void before(Scenario s) {
		myScenario = s;
System.out.println(s.getName());

	}


	 public  void embedScreenshot() {
		System.out.println("SS is entering");
		
          byte[] screenshot =((TakesScreenshot) TestFunctionsFactory.driver)
        			 .getScreenshotAs(OutputType.BYTES);
          myScenario.embed(screenshot, "image/png");
	 /*if (myScenario.isFailed()) {
	 try {
		System.out.println("SS TAKEN");
	 byte[] screenshot1 = ((TakesScreenshot) TestFunctionsFactory.driver)
	 .getScreenshotAs(OutputType.BYTES);
	 scenario.embed(screenshot1, "image/png");
	 } catch (Exception e) {
	 e.printStackTrace();
	 }
	 }*/
	 }
	

}
