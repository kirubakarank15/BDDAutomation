/**
 * 
 */
package dsp.automation.pom;

import static org.testng.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(Krishk10) DSP-ISSS Cucumber Automation
 * 
 */
public class SubscriptionsUpdated {

	// @FindBy(xpath = "//div[contains(@title,'CAT - S/N')]")

	@FindBy(xpath = "//Select[contains(@ng-model,'selectedService')]")
	private WebElement lblSerialNumber;

	@FindBy(xpath = "//div//span[contains(text(),'/N')]//following-sibling::span")
	private WebElement lblEquipmentSerialNumber;

	@FindBy(xpath = "//button[contains(text(),'')]")
	private WebElement btnSaveSync;
	@FindBy(xpath = "//div[contains(@class,'services')]//span[contains(text(),'Services:')]//parent::div//select")

	private WebElement drpDwnServices;

	@FindBy(xpath = "//*[contains(@ng-model,'custSubs')]")
	private WebElement drpDwnCustomer;

	@FindBy(xpath = "//*[contains(text(),'Cat:')]//parent::div//select")
	private WebElement drpDwnCat;
	@FindBy(xpath = "//*[contains(text(),'Dealer:')]//parent::div//select")
	private WebElement drpDwnDealer;
	@FindBy(xpath = "//select[@ng-model='subs.custSubs.subscriptionLevel']")
	private WebElement drpDwnBaseSubscription;
	@FindBy(xpath = "//div[contains(text(),' Additional Services')]//parent::button")
	private WebElement drpAdditionalServices;
	@FindBy(xpath = "//span[contains(text(),'Back')]")
	private WebElement linkback;

	@FindBy(xpath = "//li//input[contains(@class,'ng-not-empty')]")
	private WebElement chkBoxSelectedAddServices;
	@FindBys(value = {
			@FindBy(xpath = "//div[contains(text(),' Additional Services')]//parent::button//following-sibling::ul//li") })
	private List<WebElement> chkBoxAdditonalServices;

	// CANCELLATION POP UP
	@FindBy(xpath = "	//div[contains(text(),'Cancellation Reason')]")
	private WebElement titleCancelPopUp;
	@FindBy(id = "cancelReasonDropdown")
	private WebElement drpDownCancelPopUp;
	@FindBy(xpath = "//button[contains(text(),'OK')]")
	private WebElement btnOK;
	@FindBy(xpath = "	//button[contains(text(),'Cancel')]")
	private WebElement btnCancelPopUp;
	// button[contains(text(),'OK')]//parent::div//preceding-sibling::div
	// SELECT CUSTOMER WARNING POP UP
	@FindBy(xpath = "//div[contains(text(),'Select Customer')]")
	private WebElement titleSelectCustErrPopUp;
	@FindBy(xpath = "//div[contains(@class,'customerConfigBody')]//div")
	private WebElement messageSelectCustErrPopUp;
	// UnsavedWarningPopUp
	@FindBy(xpath = "//button[contains(text(),'OK')]//parent::div//preceding-sibling::div")
	private WebElement messageUnsavedWarning;
	// Billling Pop Up
	@FindBy(xpath = "//option[contains(text(),'Select account description')]//parent::select")
	private WebElement drpDownAccountDesc;
	@FindBy(xpath = "//option[contains(text(),'Select account number')]//parent::select")
	private WebElement drpDownAccountNum;
	@FindBy(xpath = "//option[contains(text(),'Select account contact')]//parent::select")
	private WebElement drpDownAccountContact;
	@FindBy(xpath = "//input[@value='Confirm']")
	private WebElement btnConfirmBillingPopUp;
	@FindBy(xpath = "//input[@value='Cancel']")
	private WebElement btnCancelBillingPopUp;
	String fieldValue;
	private final static Logger LOGGER = Logger.getLogger(Subscriptions.class.getName());

	/*
	 * krishk10 method to check services drop down values are in sync with
	 * applicable applications
	 * 
	 * @param data
	 * 
	 * @throws CustomisedException
	 */
	public void servicesDrpDownSyncCheck(String data) throws CustomisedException {

		fieldValue = "Application Services DropDown";
		List<String> defaultValues = new ArrayList<>(
				Arrays.asList("ASSET ADVISOR", "PRODUCTIVITY SERVICES", "REMOTE TROUBLE SHOOTING", "SOFTWARE UPDATE"));
		try {
			String[] inputData = data.split(",");
			List<String> expectedOptionList = new ArrayList(Arrays.asList(inputData));
			expectedOptionList.addAll(defaultValues);
			TestFunctionsFactory.verifyDropDown(drpDwnServices, expectedOptionList);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Services DropDown is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10 method to check customer drop down values are in sync with
	 * applicable applications
	 * 
	 * @param data
	 * 
	 * @throws CustomisedException
	 */
	public void customerAndBaseSubscriptionDrpDownSyncCheck(String data) throws CustomisedException {

		fieldValue = "Customer Subscription DropDown";
		try {
			String[] inputData = data.split(",");
			List<String> expectedOptionList = new ArrayList(Arrays.asList(inputData));

			TestFunctionsFactory.verifyDropDown(drpDwnServices, expectedOptionList);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Customer Subscription DropDown is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10 method to check dealer drop down values are in sync with
	 * applicable applications
	 * 
	 * @param data
	 * 
	 * @throws CustomisedException
	 */
	public void dealerDrpDownSyncCheck(String data) throws CustomisedException {

		fieldValue = "Customer Subscription DropDown";
		try {
			String[] inputData = data.split(",");
			List<String> expectedOptionList = new ArrayList(Arrays.asList(inputData));

			TestFunctionsFactory.verifyDropDown(drpDwnDealer, expectedOptionList);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Dealer Subscription DropDown is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10 method to check cat drop down values are in sync with applicable
	 * applications
	 * 
	 * @param data
	 * 
	 * @throws CustomisedException
	 */
	public void catDrpDownSyncCheck(String data) throws CustomisedException {

		fieldValue = "Customer Subscription DropDown";
		try {
			String[] inputData = data.split(",");
			List<String> expectedOptionList = new ArrayList(Arrays.asList(inputData));

			TestFunctionsFactory.verifyDropDown(drpDwnCat, expectedOptionList);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"cat Subscription DropDown is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10 
	 * Method to check the applicale add-Ons are displayed or not
	 * @param data
	 * 
	 * @throws CustomisedException
	 */

	public void addOnValuesCheck(String data) throws CustomisedException {

		fieldValue = "Customer Subscription DropDown";
		try {
			String[] inputData = data.split(",");
			List<WebElement> chkBoxOptions = chkBoxAdditonalServices;
			int i = 0;
			for (WebElement chkBox : chkBoxOptions) {
				i++;

				LOGGER.info("checking the AddOn Value :" + inputData);
				for (String inputAddOn : inputData) {
					if (chkBox.getText().trim().equalsIgnoreCase(inputAddOn.trim())) {

					} else if (chkBoxOptions.size() == i) {
						throw new CustomisedException("The following add-On is not available for this Serial No :",
								inputAddOn);
					}

					break;
				}
			}

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"cat Subscription DropDown is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10 This method is for setting subscriptions
	 * 
	 * @param testData
	 * 
	 * @throws CustomisedException
	 */
	public void enterSubscriptionValues(String drpDwnName, String testData) throws CustomisedException {

		fieldValue = drpDwnName;
		try {

			switch (drpDwnName.toLowerCase().trim().replaceAll(" ", "")) {

			case "services":
			case "services:":
				TestFunctionsFactory.selectFromDropDown(drpDwnServices, testData);
				break;
			case "customer":
			case "customer:":
				TestFunctionsFactory.selectFromDropDown(drpDwnCustomer, testData);

				break;
			case "cat":
			case "cat:":
				TestFunctionsFactory.selectFromDropDown(drpDwnCat, testData);
				break;
			case "dealer:":
			case "dealer":
				TestFunctionsFactory.selectFromDropDown(drpDwnDealer, testData);
				break;

			case "additionalservices":
			case "additionalservices:":
				int i = 0;
				TestFunctionsFactory.webWait(10, drpAdditionalServices);
				TestFunctionsFactory.javaScriptClick(drpAdditionalServices);
				TestFunctionsFactory.webWait(10, drpAdditionalServices);
				List<WebElement> chkBoxOptions = chkBoxAdditonalServices;
				for (WebElement chkBox : chkBoxOptions) {
					i++;
					String[] addOnServices = testData.split(",");
					LOGGER.info("Selecting the Value :" + addOnServices);
					for (String inputAddOn : addOnServices) {
						if (chkBox.getText().trim().equalsIgnoreCase(inputAddOn)) {

							TestFunctionsFactory.javaScriptClick(TestFunctionsFactory.driver.findElement(By
									.xpath("//div[contains(text(),' Additional Services')]//parent::button//parent::div//ul//li["
											+ i + "]//input")));

						} else if (chkBoxOptions.size() == i) {
							throw new CustomisedException(drpDwnName, "Additional Services dropdown is not displayed");
						}
					}
				}
				break;

			}

		} catch (Exception e) {
			CustomisedException.setErrorMessage(e.getMessage().toString());
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Subscription page is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {

				throw new CustomisedException(fieldValue, e.getMessage().toString());

			}

		}

	}

	/*
	 * krishk10 This method is for verifying the already set subscriptions
	 * 
	 * @param testData
	 * 
	 * @throws CustomisedException
	 */
	public void verifySubscriptionValues(String drpDwnName, String testData) throws CustomisedException {

		fieldValue = drpDwnName;
		try {

			switch (drpDwnName.toLowerCase().trim().replaceAll(" ", "")) {
			// SubscripitionScreens
			case "s/n":
			case "serialno:":

				TestFunctionsFactory.webWait(30, TestFunctionsFactory.driver
						.findElement(By.xpath("//div[contains(@title,'S/N " + testData + "')]")));
				break;
			case "services":
			case "services:":
				TestFunctionsFactory.compareSelectedValue(drpDwnServices, testData);
				break;
			case "customer":
			case "customer:":
				TestFunctionsFactory.compareSelectedValue(drpDwnCustomer, testData);
				break;
			case "cat":
			case "cat:":
				TestFunctionsFactory.compareSelectedValue(drpDwnCat, testData);
				break;
			case "dealer:":
			case "dealer":
				TestFunctionsFactory.compareSelectedValue(drpDwnDealer, testData);
				break;
			case "additionalservices":
			case "additionalservices:":

				List<WebElement> chkBoxOptions = chkBoxAdditonalServices;
				int i = 0;
				for (WebElement chkBox : chkBoxOptions) {
					i++;
					String[] addOnServices = testData.split(",");
					LOGGER.info("checking the AddOn Value :" + addOnServices);
					for (String inputAddOn : addOnServices) {
						if (chkBox.getText().trim().equalsIgnoreCase(inputAddOn.trim())) {

							TestFunctionsFactory.verifyElementdisplayed(TestFunctionsFactory.driver
									.findElement(By.xpath("//li[" + i + "]//input[contains(@class,'ng-not-empty')]")));

						}

						break;
					}
				}
			}
		} catch (Exception e) {
			CustomisedException.setErrorMessage(e.getMessage().toString());
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Subscription page is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {

				throw new CustomisedException(fieldValue, e.getMessage().toString());

			}

		}

	}

	/*
	 * krishk10 This method is for handling billing pop up
	 * 
	 * @param testData
	 * 
	 * @throws CustomisedException
	 */
	public void selectBillingDetails(String drpDwnName, String testData) throws CustomisedException {

		fieldValue = drpDwnName;
		try {

			switch (drpDwnName.toLowerCase().trim().replaceAll(" ", "")) {
			case "accountnameordescription:":
			case "accountnameordescription":
				TestFunctionsFactory.selectFromDropDown(drpDownAccountDesc, testData);
				break;
			case "accountnumber:":
			case "accountnumber":
				TestFunctionsFactory.selectFromDropDown(drpDownAccountNum, testData);
				break;
			case "accountcontact:":
			case "accountcontact":
				TestFunctionsFactory.selectFromDropDown(drpDownAccountContact, testData);
				break;
			}

		} catch (Exception e) {
			CustomisedException.setErrorMessage(e.getMessage().toString());
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Billing Pop Up is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {

				throw new CustomisedException(fieldValue, e.getMessage().toString());

			}

		}

	}

	/*
	 * krishk10 This method is for handling cancel Reason pop up
	 * 
	 * @param testData
	 * 
	 * @throws CustomisedException
	 */
	public void selectCancelReason(String drpDwnName, String testData) throws CustomisedException {

		fieldValue = drpDwnName;
		try {

			switch (drpDwnName.toLowerCase().trim().replaceAll(" ", "")) {
			case "reason:":
			case "reason":
			case "cancellationreason":
			case "cancelreason":
				TestFunctionsFactory.selectFromDropDown(drpDownCancelPopUp, testData);
				break;
			}

		} catch (Exception e) {
			CustomisedException.setErrorMessage(e.getMessage().toString());
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Cancel Reason Pop Up is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {

				throw new CustomisedException(fieldValue, e.getMessage().toString());

			}

		}

	}

	/*
	 * krishk10 This methods helps for doing different button clicks in
	 * subscriptions page.
	 * 
	 * @param action
	 * 
	 * @throws CustomisedException
	 * 
	 * @throws Exception
	 */
	public void actionsSubscripition(String action) throws CustomisedException, Exception {

		fieldValue = action;
		try {

			switch (action.toUpperCase()) {
			case "SUBMIT":
			case "REVIEW":
			case "SAVE/SYNC":
				TestFunctionsFactory.javaScriptClick(btnSaveSync);
				TestFunctionsFactory.waitForPageLoaded();
				break;
			case "<<Back":
			case "BACK":
				TestFunctionsFactory.javaScriptClick(linkback);
				TestFunctionsFactory.waitForPageLoaded();
				break;
			case "OK":
				TestFunctionsFactory.webWait(10, btnOK);
				TestFunctionsFactory.javaScriptClick(btnOK);
				TestFunctionsFactory.waitForPageLoaded();
				break;

			case "CANCEL":
				TestFunctionsFactory.javaScriptClick(btnCancelPopUp);
				TestFunctionsFactory.waitForPageLoaded();
				break;
			case "CONFIRM":
				TestFunctionsFactory.javaScriptClick(btnConfirmBillingPopUp);
				TestFunctionsFactory.waitForPageLoaded();
				break;
			default:
				throw new CustomisedException(fieldValue,
						"The Given Action is not a valid one for this page, please correct it");

			}

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Clciking on " + action + " button is facing problem :" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10
	 * 
	 * @throws CustomisedException
	 * 
	 * @throws Exception
	 */
	public void VerifySelectCustomerWarningPopUp() throws CustomisedException, Exception {

		fieldValue = "Select Customer Error PopUp";
		try {
			TestFunctionsFactory.verifyElementdisplayed(titleSelectCustErrPopUp);
			assertEquals(messageSelectCustErrPopUp.getText().trim().toLowerCase(),
					(FileHandling.getProperty("SUBSCRIPTION_NO_CUSTOMER_WARN")).trim().toLowerCase());

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Subscriptions page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * krishk10
	 * 
	 * @throws CustomisedException
	 * 
	 * @throws Exception
	 */
	public void VerifyUnSavedSubscriptionWarningPopUp() throws CustomisedException, Exception {

		fieldValue = "Unsaved Subscription warning PopUp";
		try {
			System.out.println(messageUnsavedWarning.getText());

			/*
			 * assertEquals(messageSelectCustErrPopUp.getText().trim().
			 * toLowerCase(),
			 * (FileHandling.getProperty("SUBSCRIPTION_NO_CUSTOMER_WARN")).trim(
			 * ).toLowerCase());
			 */
		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Subscriptions page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

}
