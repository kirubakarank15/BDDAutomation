/**
 * 
 */
package stepDefenition;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import cucumber.api.PendingException;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import dsp.automation.pom.Subscriptions;
import dsp.automation.pom.SubscriptionsUpdated;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(Krishk10) DSP-ISSS Cucumber Automation
 * 
 */
public class SubscripitionsNew {

	@When("^verify the services drop down is displayed with applicable \"([^\"]*)\" values for the device type \"([^\"]*)\"$")
	public void verifyServices(String arg1, String arg2) {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		try {
			SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver,
					SubscriptionsUpdated.class);
			obj.servicesDrpDownSyncCheck(arg1);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
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

			SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver,
					SubscriptionsUpdated.class);
			obj.enterSubscriptionValues("services", data);

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
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
			SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver,
					SubscriptionsUpdated.class);
			if (customer != null) {
				obj.customerAndBaseSubscriptionDrpDownSyncCheck(customer);
			}

			if (dealer != null) {
				obj.dealerDrpDownSyncCheck(dealer);
			}
			if (cat != null) {
				obj.catDrpDownSyncCheck(cat);
			}

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
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

			SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver,
					SubscriptionsUpdated.class);
			if (customer != null) {
				obj.enterSubscriptionValues("customer", customer);
			}
			if (dealer != null) {
				obj.enterSubscriptionValues("dealer", dealer);
			}

			if (cat != null) {
				obj.enterSubscriptionValues("cat", cat);
			}

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
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
			SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver,
					SubscriptionsUpdated.class);
			obj.addOnValuesCheck(addOnServices);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
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
	public void set_Subscription_details_as(String arg1, String arg2, String arg3, String arg4, String arg5)
			throws Throwable {

		if (arg1 != null) {
			System.out.println(arg1);
		}
		if (arg2 != null) {
			System.out.println(arg2);
		}
		if (arg3 != null) {
			System.out.println(arg3);
		}
		if (arg4 != null) {
			System.out.println(arg4);
		}
		if (arg5 != null) {
			System.out.println(arg5);
		}

		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}

	@When("^submit subscription details$")
	public void submit_subscription_details() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}

	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" in My Worklist page$")
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String arg1, String arg2,
			String arg3, String arg4, String arg5, String arg6) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// System.out.println(arg1 + " " + arg2 + " " + arg3 + " " + arg4 + " "
		// + arg5 + " " + arg6);
		// throw new PendingException();
	}

	@When("^cancel subscription by selecting \"([^\"]*)\"$")
	public void cancel_subscription_by_selecting(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}

	@When("^select account name \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" from billing Pop Up$")
	public void select_account_name_from_billing_Pop_Up(String arg1, String arg2, String arg3) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// System.out.println(arg1 + " " + arg2 + " " + arg3);
		// throw new PendingException();
	}

}
