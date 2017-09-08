package stepDefenition;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import COM.objectspace.jgl.HashMap;
import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.Before;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import dsp.automation.pom.MyWorklist;
import dsp.automation.pom.Subscriptions;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class UI_Subscription {
	@When("^search Asset details as \"([^\"]*)\" in My Worklist Page$")
	public void search_Asset_details_as_in_My_Worklist_Page(String data) {
		try {

			MyWorklist obj = PageFactory.initElements(TestFunctionsFactory.driver, MyWorklist.class);
			obj.searchAssetDetails(data);
			obj.actions("Submit");
		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Search_Asset_Details_Page");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Search_Asset_Details_Page");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@Then("^Verify Subscription details should be displayed with \"([^\"]*)\" in My Worklist page$")
	public void asset_details_should_be_displayed_as_in_My_Worklist_page(String data) throws Throwable {


		try {

			Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
			obj.isSubscriptionRecordDisplayed(data.split("=")[1]);

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Search_Asset_Details_Page");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Search_Asset_Details_Page");
				Assert.fail(e.getMessage().toString());
			}
		}

	
	
	}

	@When("^enter or modify Subscription details as \"([^\"]*)\"$")
	public void enter_Subscription_details_as(String data) throws Throwable {
	
		try {

			Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
			obj.enterSubscriptionValues(data);

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Search_Asset_Details_Page");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Search_Asset_Details_Page");
				Assert.fail(e.getMessage().toString());
			}
		}

	
	}

	@When("^click \"([^\"]*)\" button or link$")
	public void click_button_or_link(String arg1) throws Throwable {
		Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
		obj.actions(arg1);
	}

	@Then("^verify the message \"([^\"]*)\" is displayed$")
	public void verify_the_message_is_displayed(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}


	
	
	@Then("^select reason as \"([^\"]*)\" and click \"([^\"]*)\" in Cancel Reason Pop Up$")
	public void canceLReason(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}
	
}
