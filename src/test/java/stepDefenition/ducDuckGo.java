package stepDefenition;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import demo.utilities.CustomisedException;
import demo.utilities.FileHandling;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import siteCoreTest.pageObject.duckDuckGoSearchPage;
import siteCoreTest.pageObject.ResultsPage;

public class ducDuckGo {
	
	static String URL;
	
	
	@Given("^Launch duckDuckGo url$")
	public void launch_toolsQA_url() {
		try {
			TestFunctionsFactory.launchUrl(System.getProperty("browser"), System.getProperty("url"));
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
	
	@When("^search the country name as (.*)$")
	public void searchDetails(String data) {
		try {
			//TestFunctionsFactory.launchUrl(FileHandling.getProperty(System.getProperty("browserName")), FileHandling.getProperty(System.getProperty("browserName")+"_duckDuckGo"));
			duckDuckGoSearchPage obj = PageFactory.initElements(TestFunctionsFactory.driver, duckDuckGoSearchPage.class);
			obj.search(data);;
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
	
	@When("^verify the result page is displayed and the results are correctly displayed for (.*)$")
	public void resultsPageVerification(String data) {
		try {
			//TestFunctionsFactory.launchUrl(FileHandling.getProperty(System.getProperty("browserName")), FileHandling.getProperty(System.getProperty("browserName")+"_duckDuckGo"));
			ResultsPage obj = PageFactory.initElements(TestFunctionsFactory.driver, ResultsPage.class);
			obj.verifyResults(data);;
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

}
