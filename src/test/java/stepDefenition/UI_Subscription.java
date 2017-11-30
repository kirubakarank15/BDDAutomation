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

/**
 * @author Kirubakaran.K(Krishk10)
 *DSP-ISSS Cucumber Automation
 * 
 */
public class UI_Subscription {
	public static String serialNumber=null;
	@When("^search Asset details as \"([^\"]*)\" in My Worklist Page$")
	public void search_Asset_details_as_in_My_Worklist_Page(String data) {
		try {
			serialNumber=data;
			MyWorklist obj = PageFactory.initElements(TestFunctionsFactory.driver, MyWorklist.class);
			obj.searchAssetDetails("S/N",data);
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
	@When("^search Asset details as \"([^\"]*)\" with make code \"([^\"]*)\" in My Worklist Page$")
	public void search_Asset_details_as_in_My_Worklist_PageWith_makecode(String serialNo,String makeCode) {
		try {
			serialNumber=serialNo;
			MyWorklist obj = PageFactory.initElements(TestFunctionsFactory.driver, MyWorklist.class);
			obj.searchAssetDetails("S/N",serialNo);
			obj.actions("Submit");
			obj.searchAssetDetails("makeCode",makeCode);
			
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
	public void asset_details_should_be_displayed_as_in_My_Worklist_page(String testData) throws Throwable {

		try {

			Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
			obj.verifySubscriptionDetails(testData);

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
			System.out.println(data);
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
		try {
			Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
			obj.actionsSubscripition(arg1);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Subscriptions_Page");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions_Page");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@Then("^verify the message \"([^\"]*)\" is displayed$")
	public void verify_the_message_is_displayed(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}

	@When("^select Account details as \"([^\"]*)\" in billing Pop Up and \"([^\"]*)\" it$")
	public void selctAccountDetails(String data, String action) throws Throwable {
		try {
			Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
			obj.enterSubscriptionValues(data);
			obj.actionsSubscripition(action);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Billing PopUp");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Billing PopUpe");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@Then("^verify and accept the select customer warning Pop Up$")
	public void verifyAndAcceptSelectCustomerWarning() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
		obj.VerifySelectCustomerWarningPopUp();
		obj.actionsSubscripition("OK");

	}

	@Then("^verify the subscription unsaved warning message and click \"([^\"]*)\"$")
	public void verifyUnsavedWarning(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
		obj.VerifyUnSavedSubscriptionWarningPopUp();
		obj.actionsSubscripition(arg1);

	}

	@Then("^select reason as \"([^\"]*)\" and click \"([^\"]*)\" in Cancel Reason Pop Up$")
	public void canceLReason(String arg1, String arg2) throws Throwable {
		try {
			Subscriptions obj = PageFactory.initElements(TestFunctionsFactory.driver, Subscriptions.class);
			obj.enterSubscriptionValues(arg1);
			obj.actionsSubscripition(arg2);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Subscriptions_Page");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions_Page");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

}
