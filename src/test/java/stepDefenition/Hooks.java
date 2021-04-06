package stepDefenition;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.After;
import io.cucumber.java.AfterStep;
import io.cucumber.java.Scenario;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;

public class Hooks {
	
	@After
	public void closeBrowser(Scenario scenario) throws IOException {
	//	TestFunctionsFactory.driver.quit();
		//Runtime.getRuntime().exec("taskkill /im chromedriver.exe /f");
		

	}
 @AfterStep
 
 public void addScreenShot(Scenario scenario) throws IOException {
	 try {
	 System.out.println("Screen shot taken");
	 byte[] screenshot = ((TakesScreenshot) TestFunctionsFactory.driver).getScreenshotAs(OutputType.BYTES);
	 scenario.embed(screenshot, "image/png","");
 }catch(Exception e) {
	 
 }
	}
 public void reportConfiguration() {
	 try {
	 Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa");
		String timeStamp = ft.format(dNow).replaceAll(":", "_");

java.io.File outputDirect=new java.io.File("Reports/"+timeStamp);
List<String> jsonFiles=new ArrayList<String>();
jsonFiles.add("target/cucumber.json");
String projectName="MyProjects";

Configuration config=new Configuration(outputDirect, projectName);
ReportBuilder reportBuild=new ReportBuilder(jsonFiles, config);
Reportable result=reportBuild.generateReports();
	 }catch(Exception e) {
		 
	 }
}


	
}