package stepDefenition;

import org.testng.Assert;

import deliverectPageObject.menuPageNavigation;
import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.Given;

public class deliverectMenuSmokeTesting {
	
	static String URL;
	
	
	@Given("^Launch Deliverect URL (.*) in (.*) browser$")
	public void launchBrowser(String language,String browser) {
		try {
			if(TestFunctionsFactory.driver!=null&&TestFunctionsFactory.driver.getCurrentUrl().contains("/"+language)) {
				
			}
			else {
				if(TestFunctionsFactory.driver==null) {
				TestFunctionsFactory.launchUrl(browser, "https://www.deliverect.com/"+language+"-be");}else {
					TestFunctionsFactory.driver.navigate().to("https://www.deliverect.com/"+language+"-be");
					TestFunctionsFactory.waitForPageLoaded();
				}

			}
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Home Page");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Home Page");
				Assert.fail(e.getMessage().toString());
			}
		}
	}
	@Given("^Hover or click the menu (.*) and select the menu item (.*) if present$")
	public void clickItem(String parentMenu,String menuItem) {
		try {
				new menuPageNavigation().menuBarHoverOrClick(parentMenu, menuItem);;
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Home Page");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Home Page");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

}
