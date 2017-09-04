package dsp.automation.utilities;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

public class DriverSupplier { 
	public  WebDriver driver;

	public WebDriver driverChrome() {

		System.setProperty("webdriver.chrome.driver",
				"Resources\\chromedriver.exe");
        //String userProfile= "C:\\Users\\krishk10.AP.000\\AppData\\Roaming\\Microsoft\\Internet Explorer\\UserData";
        ChromeOptions options = new ChromeOptions();
        //options.addArguments("user-data-dir="+userProfile);
        options.addArguments("--start-maximized"); 
        options.addArguments("--ignore-certificate-errors");
        options.addArguments("--disable-popup-blocking");
        options.addArguments("disable-infobars"); 
              options.setBinary("Resources\\chromedriver.exe");
        //options.addArguments("--incognito");
       // options.addArguments("--disable-extensions");
        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        capabilities.setCapability(ChromeOptions.CAPABILITY, options);
		driver = new ChromeDriver(capabilities);
		return driver;
 
	}


	public WebDriver driverIE() { 
	    String userProfile= "	C:\\Users\\krishk10.AP.000\\AppData\\Roaming\\Microsoft\\Internet Explorer\\UserData";
	
		DesiredCapabilities capabilities = DesiredCapabilities.internetExplorer();
		capabilities.setCapability(CapabilityType.BROWSER_NAME, "IE");
		capabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		System.setProperty("webdriver.ie.driver",
				"C:\\Users\\krishk10.AP.000\\Downloads\\Selenium Downloads\\IEDriverServer_x64_3.4.0\\IEDriverServer.exe");
		driver = new InternetExplorerDriver(capabilities);
		return driver;

	} 
	public WebDriver htmlUnit(){
		WebDriver driver=new HtmlUnitDriver();
		((HtmlUnitDriver) driver).setJavascriptEnabled(true);
		
		return driver;
		
	}



}
