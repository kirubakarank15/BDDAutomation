package demo.utilities;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.ie.InternetExplorerOptions;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

/**
 * @author Kirubakaran.K(kk)
 *PropertyFinder-Demo Cucumber Automation
 * 
 */
public class DriverSupplier {  
	public  RemoteWebDriver driver;
 
	/*kk 
	 * @return
	 */
	public WebDriver driverChrome() {

		System.setProperty("webdriver.chrome.driver",
				"Resources\\chromedriver.exe");
        //String userProfile= "C:\\Users\\kk.AP.000\\AppData\\Roaming\\Microsoft\\Internet Explorer\\UserData";
        ChromeOptions options = new ChromeOptions();

        //options.addArguments("user-data-dir="+userProfile);
        options.addArguments("--start-maximized"); 
        options.addArguments("--ignore-certificate-errors");
        options.addArguments("--disable-popup-blocking");
//options.addArguments("--headless");
        options.addArguments("disable-infobars"); 
        //options.setBinary("Resources\\Drivers\\chromedriver.exe");
        //options.addArguments("--incognito");
     options.addArguments("--disable-extensions");
//        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
//        capabilities.setCapability("chrome.binary", "");
//        capabilities.setCapability(ChromeOptions.CAPABILITY, options);
		//return driver;
	/*	DesiredCapabilities capabilities1 = DesiredCapabilities.internetExplorer();
			capabilities1.setCapability(CapabilityType.BROWSER_NAME, "IE");
		capabilities1.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		RemoteWebDriver driver = new RemoteWebDriver(capabilities1);*/
		
		driver = new ChromeDriver(options);
		return driver;
 
	}


	/*kk
	 * @return
	 */
	public WebDriver driverIE() { 
	   // String userProfile= "	C:\\Users\\kk.AP.000\\AppData\\Roaming\\Microsoft\\Internet Explorer\\UserData";
	
		DesiredCapabilities capabilities = DesiredCapabilities.internetExplorer();

		capabilities.setCapability(CapabilityType.BROWSER_NAME, "IE");
		capabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		System.setProperty("webdriver.ie.driver",
				"Resources//IEDriverServer.exe");
		driver = new InternetExplorerDriver(capabilities);
		return driver;

	} 
	public WebDriver driverFirfox() { 
		System.setProperty("webdriver.gecko.driver",
				"Resources//geckodriver.exe");
		DesiredCapabilities firefoxCapabilities = DesiredCapabilities.firefox();
		firefoxCapabilities.setCapability("marionette", true);
	   driver=new FirefoxDriver(); 
	   
		return driver;

	} 
	/*kk
	 * @return
	 */
	public WebDriver remotedriver(){
		DesiredCapabilities capabilities = DesiredCapabilities.internetExplorer();
			capabilities.setCapability(CapabilityType.BROWSER_NAME, "IE");
		capabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		RemoteWebDriver driver = new RemoteWebDriver(capabilities);
		
		return driver;
		
	}

	/*kk
	 * @return
	 */
	public WebDriver htmlUnit(){
		
		  WebDriver driver = new HtmlUnitDriver();
		((HtmlUnitDriver) driver).setJavascriptEnabled(true);
		
		return driver;
		
	}



}
