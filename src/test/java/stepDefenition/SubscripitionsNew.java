/**
 * 
 */
package stepDefenition;

import java.io.IOException;
import java.util.Map;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;


import cucumber.api.PendingException;
import cucumber.api.Scenario;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import dsp.automation.pom.Subscriptions;
import dsp.automation.pom.SubscriptionsUpdated;
import dsp.automation.runners.TestRunnerUI;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(Krishk10) DSP-ISSS Cucumber Automation
 * 
 */
public class SubscripitionsNew {
	SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver, SubscriptionsUpdated.class);

	@When("^verify the services drop down is displayed with applicable \"([^\"]*)\" values for the device type \"([^\"]*)\"$")
	public void verifyServices(String arg1, String arg2) {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		try {

			obj.servicesDrpDownSyncCheck(arg1);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("ServicesDropDown");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("ServicesDropDown");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@Then("^select the services as \"([^\"]*)\" from subscriptions page$")
	public void selectServices(String data) throws Throwable {

		try {

			obj.enterSubscriptionValues("services", data);

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {

				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@When("^verify whether the subscription dropdown values \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"  are populated according to the selected service$")
	public void verifySubscriptionDrpDwn(String customer, String dealer, String cat) {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		try {

			if (!customer.equals("")) {
				obj.customerAndBaseSubscriptionDrpDownSyncCheck(customer);
			}

			if (!dealer.equals("")) {
				obj.dealerDrpDownSyncCheck(dealer);
			}
			if (!cat.equals("")) {
				obj.catDrpDownSyncCheck(cat);
			}

		} catch (Exception e) {
			if (CustomisedException.getErrorMessage() != "") {
		new TestRunnerUI().embedScreenshot();
				TestFunctionsFactory.takeSnapShot("Subscriptions DropDown");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions DropDown");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@Then("^select the subscriptions as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void selectSubscriptions(String customer, String dealer, String cat) throws Throwable {

		try {

			if (!customer.equals("")) {
				obj.enterSubscriptionValues("customer", customer);
			}
			if (!dealer.equals("")) {
				obj.enterSubscriptionValues("dealer", dealer);
			}

			if (!cat.equals("")) {
				obj.enterSubscriptionValues("cat", cat);
			}

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {

				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {

				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@When("^verify whether the Add-On services are displayed as \"([^\"]*)\"$")
	public void verifyAddOnServices(String addOnServices) {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		try {

			obj.addOnValuesCheck(addOnServices);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Add-Onservices");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Add-Onservices");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@When("^Set Subscription details as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Subscription_details_as(String service, String customer, String dealer, String cat)
			throws Throwable {
		try {
			if (!service.equals("")) {
				obj.enterSubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.enterSubscriptionValues("customer", customer);
			}
			if (!dealer.equals("")) {
				obj.enterSubscriptionValues("dealer", dealer);
			}

			if (!cat.equals("")) {
				obj.enterSubscriptionValues("cat", cat);
			}
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
	@When("^Set Subscription details as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Subscription_details_as(String service, String customer,String AdditionalServices,Map<String, String> tableData)
			throws Throwable {
		try {
			System.out.println(tableData);
			if (!service.equals("")) {
				obj.enterSubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.enterSubscriptionValues("customer", customer);
			}
			if (!AdditionalServices.equals("")) {
				obj.enterSubscriptionValues("AdditionalServices", AdditionalServices);
			}
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
	
	@When("^Set Subscription details as \"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Subscription_details_as(String service, String customer)
			throws Throwable {
		try {
			if (!service.equals("")) {
				obj.enterSubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.enterSubscriptionValues("customer", customer);
			}
		
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@When("^submit subscription details$")
	public void submit_subscription_details() throws Throwable {
		obj.actionsSubscripition("submit");
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}

	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" in My Worklist page$")
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String service, String customer,String AdditionalServices)
			throws Throwable {
		try {
			if (!service.equals("")) {
				obj.verifySubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}
			if (!AdditionalServices.equals("")) {
				obj.verifySubscriptionValues("AdditionalServices", AdditionalServices);
			}
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}}
	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\" in My Worklist page$")
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String service, String customer)
			throws Throwable {
		try {
			if (!service.equals("")) {
				obj.verifySubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}

			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}}

	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" in My Worklist page$")
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String service, String customer,String dealer,String cat,String AdditionalServices)
			throws Throwable {
		try {
			if (!service.equals("")) {
				obj.verifySubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}
			if (!dealer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}
			if (!cat.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}
			if (!AdditionalServices.equals("")) {
				obj.verifySubscriptionValues("AdditionalServices", AdditionalServices);
			}
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != "") {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}}
	@When("^cancel subscription by selecting reason as \"([^\"]*)\"$")
	public void cancel_subscription_by_selecting(String reason) throws Throwable {
	obj.selectCancelReason("cancelreason", reason);
	}

	@When("^select account name \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" from billing Pop Up$")
	public void select_account_name_from_billing_Pop_Up(String arg1, String arg2, String arg3) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// System.out.println(arg1 + " " + arg2 + " " + arg3);
		// throw new PendingException();
	}

}
