package dsp.automation.utilities;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.Wait;
import org.testng.Assert;

/**
 * @author Kirubakaran.K(Krishk10)
 *DSP-ISSS Cucumber Automation
 * 
 */
/**
 * @author Kirubakaran.K(Krishk10) DSP-ISSS Cucumber Automation
 * 
 */
public class TestFunctionsFactory {

	public static WebDriver driver;
	CustomisedException obj;

	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @param text
	 * 
	 * @throws CustomisedException
	 */
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

	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
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
	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
	public static void mouseHover(WebElement element) throws CustomisedException {
		try {
			Actions obj = new Actions(driver);
			obj.moveToElement(element).moveByOffset(element.getLocation().x, element.getLocation().y).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	// Mouse Hover and click
	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
	public static void mouseHoverAndClick(WebElement element) throws CustomisedException {
		try {
			Actions obj = new Actions(driver);
			System.out.println("Locating");

			obj.moveToElement(element).moveByOffset(element.getLocation().x, element.getLocation().y).click(element)
					.build().perform();
			System.out.println("Done");
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
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

	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @param option
	 * 
	 * @throws CustomisedException
	 */
	public static void selectFromDropDown(WebElement element, String option) throws CustomisedException {
		try {
			TestFunctionsFactory.waitForPageLoaded();
			Select selectObj = new Select(element);

			List<WebElement> optionsList = selectObj.getOptions();
			int i = 0;
			for (WebElement options : optionsList) {

				System.out.println("Options" + options.getText());
				if (options.getText().trim().replace(" ", "").equalsIgnoreCase(option.trim().replace(" ", ""))) {
					// webWait(10, options);
					selectObj.selectByIndex(i);
					// selectObj.selectByValue(options.getText());
					System.out.println("Option Clicked" + options.getText());
					break;
				}
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @param option
	 * 
	 * @throws CustomisedException
	 */
	public static void compareSelectedValue(WebElement element, String option) throws CustomisedException {
		try {
			TestFunctionsFactory.waitForPageLoaded();
			Select selectObj = new Select(element);
			Assert.assertEquals(selectObj.getFirstSelectedOption().getText().trim(), option.trim());

		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	/*
	 * krishk10
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
	public static void verifyElementdisplayed(WebElement element) throws CustomisedException {
		try {

			element.isDisplayed();

		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());
			throw obj;
		}

	}

	/*
	 * krishk10
	 * 
	 * @param waitTime
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
	public static void webWaitPages(int waitTime, WebElement element) throws CustomisedException {
		try {

			Wait<WebDriver> wait = new FluentWait<WebDriver>(driver).withTimeout(waitTime, TimeUnit.SECONDS)
					.pollingEvery(2, TimeUnit.SECONDS).ignoring(NullPointerException.class);

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

	/*
	 * krishk10
	 * 
	 * @param waitTime
	 * 
	 * @param element
	 * 
	 * @throws CustomisedException
	 */
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

	/*
	 * krishk10
	 * 
	 */
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
		Wait<WebDriver> wait = new FluentWait<WebDriver>(driver).withTimeout(10, TimeUnit.SECONDS)
				.pollingEvery(2, TimeUnit.SECONDS).ignoring(NullPointerException.class);
		try {
			wait.until(expectation);
			/*
			 * wait.until(ExpectedConditions.stalenessOf(
			 * TestFunctionsFactory.driver.findElement(By.xpath(
			 * "//div[contains(@class,'loading')]"))));
			 */
		} catch (Throwable error) {
			// logger.error("Timeout waiting for Page Load Request to
			// complete.");
		}

	}

	/*
	 * krishk10
	 * 
	 * @param browser
	 * 
	 * @param url
	 * 
	 * @throws Exception
	 */
	public static void launchUrl(String browser, String url) throws Exception {
		DriverSupplier objDriver = new DriverSupplier();

		switch (browser.toUpperCase()) {

		case "HEADLESS":
		case "HTMLUNIT":
			driver = objDriver.htmlUnit();
			break;
		case "CHROME":
			driver = objDriver.driverChrome();
			break;
		case "FIREFOX":
			driver = objDriver.driverFirfox();

			break;
		case "INTERNET EXPLORER":
		case "IE":
			System.out.println("ÏE Driver");
			driver = objDriver.driverIE();

			break;
		default:
			throw new CustomisedException(browser, "Given broswer name is not a valid one");
		}

		driver.manage().deleteAllCookies();
		objDriver.driver.manage().window().maximize();

		driver.get(url);
		objDriver.driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);

	}

	// Screenshot taking fucntion
	/*
	 * krishk10
	 * 
	 * @param pageName
	 */
	public static void takeSnapShot(String pageName) {
		try {
			Date dNow = new Date();
			SimpleDateFormat ft = new SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa");
			String timeStamp = ft.format(dNow).replaceAll(":", "_");

			String screenshotsDir = "test-output//ScreenShots//";

			String filename = pageName + "_" + timeStamp + ".png";
			Path screenshotPath = Paths.get(screenshotsDir, filename);
			// File SrcFile =
			// ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
			// FileUtils.copyFile(SrcFile, screenshotPath.toFile());

			// Convert web driver object to TakeScreenshot

			TakesScreenshot scrShot = ((TakesScreenshot) driver);

			// Call getScreenshotAs method to create image file

			File SrcFile = scrShot.getScreenshotAs(OutputType.FILE);

			// Copy file at destination

			FileUtils.copyFile(SrcFile, screenshotPath.toFile());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * to split test data
	 * 
	 */

	/*
	 * krishk10
	 * 
	 * @param data
	 * 
	 * @return
	 */
	public static LinkedHashMap<String, String> getTestData(String data) {
		LinkedHashMap<String, String> map = new LinkedHashMap<>();
		String[] values = data.split(",");

		for (String k : values) {

			String[] combo = k.split("=");
			if (combo.length != 1) {
				String key = combo[0];
				String Value = combo[1];
				map.put(key, Value);
			}
		}

		return map;
		// TODO Auto-generated method stub

	}

	/*
	 * krishk10
	 * 
	 */
	public static void closeBrowser() {
		TestFunctionsFactory.driver.quit();

	}
}
