package stepDefenition;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import demo.utilities.CustomisedException;
import demo.utilities.FileHandling;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import siteCoreTest.pageObject.StaysPage;
import siteCoreTest.pageObject.expediaHomePage;

public class ExpediaSearch {
	public static StaysPage staysPageObject ;
	@Given("Launch expedia url")
	public void launch_expedia_url() {
		try {
			// TestFunctionsFactory.launchUrl(FileHandling.getProperty(System.getProperty("browserName")),
			// FileHandling.getProperty(System.getProperty("browserName")+"_duckDuckGo"));
		System.out.println("property"+System.getProperty("url"));
	TestFunctionsFactory.launchUrl(System.getProperty("browser"), System.getProperty("url"));
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage());
			}
		}
	}

	@When("^verify the region of the website (.*) and language (.*), modify accordingly if not$")
	public void verify_the_region_of_the_website_united_states_english_and_modify_accordingly_if_not(String region,
			String langauge) {
		try {
			expediaHomePage homePage = PageFactory.initElements(TestFunctionsFactory.driver, expediaHomePage.class);
			homePage.verifyAndSelectRegionAndLanguage(region, langauge);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage());
			}
		}
	}

	@When("^enter accomation and flight details as (.*)$")
	public void enter_accomation_and_flight_details_as(String testData) {
		try {
			staysPageObject = PageFactory.initElements(TestFunctionsFactory.driver, StaysPage.class);

			staysPageObject.Actions("Add Flight");
			staysPageObject.enterHotelAndFlightSearchDetais(testData);
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage());
			}
		}
	}

	@When("^sarch the flights and hotels$")
	public void sarch_the_flights_and_hotels() {
		// Write code here that turns the phrase above into concrete actions
		try {
			staysPageObject.Actions("Search");
		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage());
			}
		}
	}

	@When("^verify the result page is displayed with records$")
	public void verify_the_result_page_is_displayed_with_records() {
		try {
			staysPageObject.verifyTheResultpageIsDisplayed();

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage());
			}
		}
	}
}
