/**
 * 
 */
package stepDefenition;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;


import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import toolsQA.pageObjectModel.menuNavigationToolsQA;

/**
 * @author Kirubakaran.K(kk) PropertyFinder-Demo Cucumber Automation
 * 
 */
public class CommonStepsToolsQA {
	@Given("^Launch toolsQA url \"([^\"]*)\"$")
	public void launch_toolsQA_url(String url) {
		try {
			TestFunctionsFactory.launchUrl("chrome", url);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@When("^Navigate to \"([^\"]*)\" in ToolsQA$")
	public void navigate_to_in_ToolsQA(String menu) throws Throwable {
		try {
        menuNavigationToolsQA obj=PageFactory.initElements(TestFunctionsFactory.driver, menuNavigationToolsQA.class);
        obj.menuNavigation(menu);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Navigationto" + menu);

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Navigationto" + menu);
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@When("^page \"([^\"]*)\" should be displayed in Tools$")
	public void isPageDisplayed(String pageName) throws Throwable {
		try {
			switch (pageName.replaceAll(" ", "").trim().toUpperCase()) {

			case "SELENIUMONLINETRAINING":
				toolsQA.pageObjectModel.SeleniumOnlineTraining obj = PageFactory.initElements(TestFunctionsFactory.driver,toolsQA.pageObjectModel.SeleniumOnlineTraining.class);
				obj.isPageDisplayed();
				break;
			case "CORPORATETRAININGS":
				toolsQA.pageObjectModel.CorportateTrainings obj1 = PageFactory.initElements(TestFunctionsFactory.driver,toolsQA.pageObjectModel.CorportateTrainings.class);
				obj1.isPageDisplayed();
				break;
			
			default:

				throw new CustomisedException(pageName, "is not a valid page in Applicaiton");

			}
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Navigationto" + pageName);

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Navigationto" + pageName);
				Assert.fail(e.getMessage().toString());
			}
		}
	}

}
