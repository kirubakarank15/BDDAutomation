package dsp.automation.utilities;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;

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
			webWaitPages(60,element);
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
				wait.until(ExpectedConditions.stalenessOf(
						TestFunctionsFactory.driver.findElement(By.xpath("//div[contains(@class,'loading')]"))));
				
			} 
			wait.until(ExpectedConditions.visibilityOf(element));
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());

			throw obj;
		}
	}

	public static void webWait(int waitTime, WebElement element) throws CustomisedException {
		try {

			Wait<WebDriver> wait = new FluentWait<WebDriver>(driver).withTimeout(waitTime, TimeUnit.SECONDS)
					.pollingEvery(5, TimeUnit.SECONDS).ignoring(NullPointerException.class);
              
			wait.until(ExpectedConditions.visibilityOf(element));
		} catch (Exception e) {
			e.printStackTrace();
			CustomisedException obj = new CustomisedException(element.toString(), e.getMessage().toString());

			throw obj;
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
		//objDriver.driver.manage().window().maximize();
		objDriver.driver.get(url);
		objDriver.driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);


	}

	public static void closeBrowser() {
		TestFunctionsFactory.driver.quit();

	}
}
