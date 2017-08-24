package dsp.automation.utilities;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;
import org.testng.annotations.Parameters;

public class TestFunctionsFactory {

	public static WebDriver driver;
	CustomisedException obj;

	public static void webEditText(WebElement element, String text) throws CustomisedException {
		try {
			element.clear();
			element.sendKeys(text);
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	public static void webClick(WebElement element) throws CustomisedException {
		try {
			element.click();
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	// Mouse Hover
	public static void mouseHover(WebElement element) throws CustomisedException {
		try {
			Actions obj = new Actions(driver);
			obj.moveToElement(element).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	// Mouse Hover and click
	public static void mouseHoverAndClick(WebElement element) throws CustomisedException {
		try {
			Actions obj = new Actions(driver);
			System.out.println("Locating");
			obj.moveToElement(element).click().build().perform();
			System.out.println("Done");
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	public static void javaScriptClick(WebElement element) throws CustomisedException {
		try {

			JavascriptExecutor executor = (JavascriptExecutor) driver;
			executor.executeScript("arguments[0].click();", element);
		} catch (Exception e) {
			e.printStackTrace();

			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	public static void doubleClick(WebElement element) throws CustomisedException {
		try {
			Actions obj = new Actions(driver);
			obj.doubleClick(element).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	public static void verifyElementdisplayed(WebElement element) throws CustomisedException {
		try {

			element.isDisplayed();
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	public static void webWaitPages(int waitTime, WebElement element) throws CustomisedException {
		try {

			Wait<WebDriver> wait = new FluentWait<WebDriver>(driver).withTimeout(waitTime, TimeUnit.SECONDS)
					.pollingEvery(5, TimeUnit.SECONDS).ignoring(NullPointerException.class);
			if (TestFunctionsFactory.driver.findElement(By.xpath("//div[contains(@class,'loading')]")).isDisplayed()) {
				if (!wait.until(ExpectedConditions.stalenessOf(
						TestFunctionsFactory.driver.findElement(By.xpath("//div[contains(@class,'loading')]")))))
					;

			}
			if (wait.until(ExpectedConditions.visibilityOf(element)) == null) {

			}
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());

			throw obj;
		}
	}

	public static void webWait(int waitTime, WebElement element) throws CustomisedException {
		try {

			Wait<WebDriver> wait = new FluentWait<WebDriver>(driver).withTimeout(waitTime, TimeUnit.SECONDS)
					.pollingEvery(2, TimeUnit.SECONDS).ignoring(NullPointerException.class);

			wait.until(ExpectedConditions.visibilityOf(element));
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());

			throw obj;
		}
	}

	public static void waitForPageLoaded() {
		ExpectedCondition expectation = new ExpectedCondition() {
			public Boolean apply(WebDriver driver) {
				return ((JavascriptExecutor) driver).executeScript("return document.readyState").equals("complete");
			}

			@Override
			public Object apply(Object arg0) {
				// TODO Auto-generated method stub 
				return null;
			}
		};
		Wait<WebDriver> wait = new FluentWait<WebDriver>(driver).withTimeout(80,TimeUnit.SECONDS)
				.pollingEvery(2, TimeUnit.SECONDS).ignoring(NullPointerException.class);
		try {
			wait.until(expectation);
/*			wait.until(ExpectedConditions.stalenessOf(
					TestFunctionsFactory.driver.findElement(By.xpath("//div[contains(@class,'loading')]"))));*/
		} catch (Throwable error) {
			// logger.error("Timeout waiting for Page Load Request to
			// complete.");
		}

	}

	public static void launchUrl(String browser, String url) throws Exception {
		DriverSupplier objDriver = new DriverSupplier();

		switch (browser.toUpperCase()) {

		case "CHROME":
			driver = objDriver.driverChrome();
			break;
		case "INTERNET EXPLORER":
		case "IE":
			System.out.println("ÏE Driver");
			driver = objDriver.driverIE();

			break;
		default:
			throw new CustomisedException(browser, "Given broswer name is not a valid one");
		}

		objDriver.driver.manage().deleteAllCookies();
		// objDriver.driver.manage().window().maximize();
		objDriver.driver.get(url);
		objDriver.driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);

	}

	// Screenshot taking fucntion
	public static void takeSnapShot( String pageName)  {
		try{
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa");
		String timeStamp = ft.format(dNow).replaceAll(":", "_");
		
		
		String screenshotsDir ="C://Users//krishk10.AP.000//Documents//DSP-Automation//test-output//Screenshots//";

		String filename = pageName+"_"+ timeStamp + ".png";
		Path screenshotPath = Paths.get(screenshotsDir, filename);
		//File SrcFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		//FileUtils.copyFile(SrcFile, screenshotPath.toFile());
		
		// Convert web driver object to TakeScreenshot

		TakesScreenshot scrShot = ((TakesScreenshot) driver);

		// Call getScreenshotAs method to create image file

		File SrcFile = scrShot.getScreenshotAs(OutputType.FILE);

		// Copy file at destination

		FileUtils.copyFile(SrcFile, screenshotPath.toFile());}
		catch(Exception e ){
			e.printStackTrace();
		}

	}

	public static void closeBrowser() {
		//TestFunctionsFactory.driver.quit();

	}
	
	//Test Data Splitter
	
	public static HashMap<String, String> getTestData(String data) {
		 
		String[] beforeFieldSplit=data.split(",");
		java.util.HashMap<String, String> map=new java.util.HashMap<>();
		String[] fieldSplit;
		for (String keyValue:beforeFieldSplit){
			if(keyValue.contains("=")){
			fieldSplit=keyValue.split("=");
	
			if(fieldSplit.length!=1){
			map.put(fieldSplit[0], fieldSplit[1]);}
}
		}
	    // Write code here that turns the phrase above into concrete actions
	    //throw new PendingException(); 
		return map;
	
		
	}
	  @Parameters("environment")
	public static String getParameter(){
		
		
		return null;
		
	}
}
