/**
 * 
 */
package stepDefenition;

import java.io.IOException;
import java.util.Map;

import org.apache.poi.hssf.record.NameCommentRecord;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import dsp.automation.pom.MyWorklist;
import dsp.automation.pom.Subscriptions;
import dsp.automation.pom.SubscriptionsUpdated;
import dsp.automation.runners.TestRunnerUI;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.MenuBarNaviagtions;
import dsp.automation.utilities.TestFunctionsFactory;
import gherkin.ast.ScenarioOutline;
import gherkin.formatter.model.Examples;
import gherkin.formatter.model.ExamplesTableRow;

/**
 * @author Kirubakaran.K(Krishk10) DSP-ISSS Cucumber Automation
 * 
 */
public class SubscripitionsNew {
	CommonSteps relogin = new CommonSteps();
	SubscriptionsUpdated obj = PageFactory.initElements(TestFunctionsFactory.driver, SubscriptionsUpdated.class);

	@When("^verify the services drop down is displayed with applicable \"([^\"]*)\" values for the device type \"([^\"]*)\"$")
	public void verifyServices(String arg1, String arg2) {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		try {

			obj.servicesDrpDownSyncCheck(arg1);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("ServicesDropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("ServicesDropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@Then("^select the services as \"([^\"]*)\" from subscriptions page$")
	public void selectServices(String data) {
		// System.out.println("dATA"+data);
		try {
			if (CustomisedException.getFieldValue() != null) {
				if (CustomisedException.getFieldValue() != "NA") {
					CustomisedException.setFieldValue("NA");
					//relogin.login();
					CommonSteps com = new CommonSteps();
					com.menuBarNavigation("My worklist");

					MyWorklist worklist = PageFactory.initElements(TestFunctionsFactory.driver, MyWorklist.class);
					worklist.isPageDisplayed();
					worklist.searchAssetDetails("S/N", UI_Subscription.serialNumber);
					worklist.actions("submit");

				}
			}
			// System.out.println("dATA"+data);
			obj.enterSubscriptionValues("services", data);

		}

		catch (Exception e) {
			// System.out.println("in select on");
			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {

				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
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
				if (!customer.equals(null)) {
					obj.customerAndBaseSubscriptionDrpDownSyncCheck(customer);
				}
			}

			if (!dealer.equals("")) {
				if (!dealer.equals(null)) {
					System.out.println("PRINT" + dealer);
					obj.dealerDrpDownSyncCheck(dealer);
				}
			}
			if (!cat.equals("")) {
				if (!cat.equals(null)) {
					obj.catDrpDownSyncCheck(cat);
				}
			}

		} catch (Exception e) {
			if (CustomisedException.getErrorMessage() != null) {

				TestFunctionsFactory.takeSnapShot("Subscriptions DropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {	CustomisedException.setFieldValue("NAss");
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions DropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@Then("^select the subscriptions as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void selectSubscriptions(String customer, String dealer, String cat) throws Throwable {

		try {

			if (!customer.equals("")) {
				if (!customer.equals(null)) {
					obj.enterSubscriptionValues("customer", customer);
				}
			}
			if (!dealer.equals("")) {
				if (!dealer.equals(null)) {
					obj.enterSubscriptionValues("dealer", dealer);
				}
			}

			if (!cat.equals("")) {
				if (!cat.equals(null)) {
					obj.enterSubscriptionValues("cat", cat);
				}
			}

		}

		catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {

				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {

				// e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Subscriptions-Services DropDown");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
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
			System.out.println("in add on" + e.getMessage().toString());
			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Add-Onservices");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				// e.printStackTrace();
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				TestFunctionsFactory.takeSnapShot("Add-Onservices");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@And("^update the subscriptions for the Asset as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
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

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				// e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@And("^update the subscriptions for the Asset as \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\"$")
	@When("^Set Subscription details as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Subscription_details_as(String service, String customer, String AdditionalServices)
			throws Throwable {
		try {

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

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
	@And("^update the subscriptions for the Asset as \"([^\"]*)\",\"([^\"]*)\"$")
	@When("^Set Subscription details as \"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Subscription_details_as(String service, String customer) throws Throwable {
		try {
			if (!service.equals("")) {
				obj.enterSubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.enterSubscriptionValues("customer", customer);
			}

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
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
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String service,
			String customer, String AdditionalServices) throws Throwable {
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

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				// e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\" in My Worklist page$")
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String service,
			String customer) throws Throwable {
		try {
			if (!service.equals("")) {
				obj.verifySubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				// e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" for Product Link Web in My Worklist page$")
	public void verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String service,
			String customer, String dealer, String cat, String AdditionalServices) throws Throwable {
		try {
			if (!service.equals("")) {
				obj.verifySubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}
			if (!dealer.equals("")) {
				obj.verifySubscriptionValues("dealer", dealer);
			}
			if (!cat.equals("")) {
				obj.verifySubscriptionValues("cat", cat);
			}
			if (!AdditionalServices.equals("")) {
				obj.verifySubscriptionValues("AdditionalServices", AdditionalServices);
			}

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}
	}
	@Then("^Verify Subscription details are displayed with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" for Product Link Web in My Worklist page$")
	public void verify_Subscription_details_sproductLiknWeb_withOut_AddOn(String service,
			String customer, String dealer, String cat) throws Throwable {
		try {
			if (!service.equals("")) {
				obj.verifySubscriptionValues("services", service);
			}
			if (!customer.equals("")) {
				obj.verifySubscriptionValues("customer", customer);
			}
			if (!dealer.equals("")) {
				obj.verifySubscriptionValues("dealer", dealer);
			}
			if (!cat.equals("")) {
				obj.verifySubscriptionValues("cat", cat);
			}
			/*if (!AdditionalServices.equals("")) {
				obj.verifySubscriptionValues("AdditionalServices", AdditionalServices);
			}
*/
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Verifying Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Verifying Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	@When("^cancel subscription by selecting reason as \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void cancel_subscription_by_selecting(String service, String customer, String dealer, String cat,
			String reason) throws Throwable {

		try {
			if (!customer.equals("")) {
				if (!customer.equals(null)) {
					obj.enterSubscriptionValues("customer", customer);
				}
			}
			if (!dealer.equals("")) {
				if (!dealer.equals(null)) {
					obj.enterSubscriptionValues("dealer", dealer);
				}
			}

			if (!cat.equals("")) {
				if (!cat.equals(null)) {
					obj.enterSubscriptionValues("cat", cat);
				}
			}
			obj.selectCancelReason("cancelreason", reason);

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Cancelling Subscriptions");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Cancelling Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@When("^cancel subscription by selecting reason as \"([^\"]*)\",\"([^\"]*)\"$")
	public void cancel_Subscription_details_as(String customer, String reason) throws Throwable {
		try {

			if (!customer.equals("")) {
				obj.enterSubscriptionValues("customer", customer);
			}
			obj.selectCancelReason("cancelreason", reason);

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Setting Subscriptions");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@When("^select account name \"([^\"]*)\" from billing Pop Up$")
	public void selectBillingAccoutnName(String AccountName) throws Throwable {
		try {

			obj.selectBillingDetails("accountname",AccountName); 

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Billing Pop Up");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Billing Pop Up");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
	@When("^select account Contact \"([^\"]*)\" from billing Pop Up$")
	public void selectBillingAccoutnContact(String AccountContact) throws Throwable {
		try {

		obj.selectBillingDetails("accountcontact",AccountContact); 

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Billing Pop Up");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Billing Pop Up");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
	@When("^select account Number \"([^\"]*)\" from billing Pop Up$")
	public void selectBillingAccoutnNumber(String AccountNumber) throws Throwable {
		try {

			obj.selectBillingDetails("accountNumber",AccountNumber); 

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Billing Pop Up");
			//	TestFunctionsFactory.closeBrowser();
				// relogin.login();
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Billing Pop Up");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
}
