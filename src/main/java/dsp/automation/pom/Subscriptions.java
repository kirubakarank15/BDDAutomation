package dsp.automation.pom;

import static org.testng.Assert.assertEquals;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Logger;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(Krishk10)
 *DSP-ISSS Cucumber Automation
 * 
 */
public class Subscriptions {

	// @FindBy(xpath = "//div[contains(@title,'CAT - S/N')]")

	@FindBy(xpath = "//Select[contains(@ng-model,'selectedService')]")
	private WebElement lblSerialNumber;

	@FindBy(xpath = "//div//span[contains(text(),'/N')]//following-sibling::span")
	private WebElement lblEquipmentSerialNumber;

	@FindBy(xpath = "//button[contains(text(),'Save / Sync')]")
	private WebElement btnSaveSync;
	@FindBy(xpath = "//div[contains(@class,'services')]//span[contains(text(),'Services:')]//parent::div//select")

	private WebElement drpDwnServices;

	@FindBy(xpath = "//div//span[contains(text(),'Customer:')]//parent::div//select")
	private WebElement drpDwnCustomer;

	@FindBy(xpath = "//div//span[contains(text(),'Cat:')]//parent::div//select")
	private WebElement drpDwnCat;
	@FindBy(xpath = "//div//span[contains(text(),'Dealer:')]//parent::div//select")
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

	/*krishk10
	 * @param serialNo
	 * @return
	 * @throws CustomisedException
	 * @throws Exception
	 */
	public Subscriptions isSubscriptionRecordDisplayed(String serialNo) throws CustomisedException, Exception {

		fieldValue = "SerialNo labels";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, TestFunctionsFactory.driver
					.findElement(By.xpath("//div[contains(@title,'S/N " + serialNo + "')]")));

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Subscription page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

	/*krishk10
	 * @param testData
	 * @throws CustomisedException
	 */
	public void enterSubscriptionValues(String testData) throws CustomisedException {

		fieldValue = "Subscriptions Page";
		try {
			boolean additionalServicesflag = false;
			String addServicesOption = "";
			LinkedHashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();

			for (String key : testDataKey) {
				fieldValue = key;
				LOGGER.info("Selecting the Value :" + key);
				switch (fieldValue.toLowerCase().trim().replaceAll(" ", "")) {

				case "services":
				case "services:":
					TestFunctionsFactory.selectFromDropDown(drpDwnServices, testDataMap.get(key));
					break;
				case "customer":
				case "customer:":
					TestFunctionsFactory.selectFromDropDown(drpDwnCustomer, testDataMap.get(key));

					break;
				case "cat":
				case "cat:":
					TestFunctionsFactory.selectFromDropDown(drpDwnCat, testDataMap.get(key));
					break;
				case "dealer:":
				case "dealer":
					TestFunctionsFactory.selectFromDropDown(drpDwnDealer, testDataMap.get(key));
					break;
				case "basesubscription :":
				case "basesubscription":
					TestFunctionsFactory.selectFromDropDown(drpDwnBaseSubscription, testDataMap.get(key));

					break;
				case "additionalservices":
				case "additionalservices:":

					addServicesOption = testDataMap.get(key);
					additionalServicesflag = true;
					break;


				// CANCEL REASON POP UP
				case "reason:":
				case "reason":
				case "cancellationreason":
				case "cancelreason":
					TestFunctionsFactory.selectFromDropDown(drpDownCancelPopUp, testDataMap.get(key));
					break;

				// Billing PopUP
				case "accountnameordescription:":
				case "accountnameordescription":
					TestFunctionsFactory.selectFromDropDown(drpDownAccountDesc, testDataMap.get(key));
					break;
				case "accountnumber:":
				case "accountnumber":
					TestFunctionsFactory.selectFromDropDown(drpDownAccountNum, testDataMap.get(key));
					break;
				case "accountcontact:":
				case "accountcontact":
					TestFunctionsFactory.selectFromDropDown(drpDownAccountContact, testDataMap.get(key));
					break;
				default:
					throw new CustomisedException(fieldValue,
							"The Given Field " + key + ": is not a valid field for the page, Please correct it");

				}

			}
			if (additionalServicesflag) {

				int i = 0;
				TestFunctionsFactory.webWait(10, drpAdditionalServices);
				TestFunctionsFactory.javaScriptClick(drpAdditionalServices);
				TestFunctionsFactory.webWait(10, drpAdditionalServices);
				List<WebElement> chkBoxOptions = chkBoxAdditonalServices;
				for (WebElement chkBox : chkBoxOptions) {
					i++;
					String[] trueOrFalse = addServicesOption.split("\\.");
					LOGGER.info("Selecting the Value :" + addServicesOption + " " + trueOrFalse);
					if (chkBox.getText().trim().equalsIgnoreCase(trueOrFalse[0])) {

						if (trueOrFalse[1].equalsIgnoreCase("TRUE")) {
							List<WebElement> element = TestFunctionsFactory.driver
									.findElements(By.xpath("//li[" + i + "]//input[contains(@class,'ng-not-empty')]"));
							if (element.size() == 0) {

								LOGGER.info("TRUE OR FALSE BLOCK1");

								TestFunctionsFactory.javaScriptClick(TestFunctionsFactory.driver.findElement(By
										.xpath("//div[contains(text(),' Additional Services')]//parent::button//parent::div//ul//li["
												+ i + "]//input")));

							}
						} else if (trueOrFalse[1].equalsIgnoreCase("FALSE")) {
							List<WebElement> elementFalse = TestFunctionsFactory.driver
									.findElements(By.xpath("//li[" + i + "]//input[contains(@class,'ng-empty')]"));
							if (elementFalse.size() == 0) {

								TestFunctionsFactory.javaScriptClick(TestFunctionsFactory.driver.findElement(By
										.xpath("//div[contains(text(),' Additional Services')]//parent::button//parent::div//ul//li["
												+ i + "]//input")));

								LOGGER.info("TRUE OR FALSE BLOCK2");
							}

						}

					} else if (chkBoxOptions.size() == i) {
						throw new CustomisedException(
								"Ädditional FieldServices drop down is not having the value :" + addServicesOption, "");
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

	/*krishk10
	 * @param testData
	 * @throws CustomisedException
	 */
	public void verifySubscriptionDetails(String testData) throws CustomisedException {

		fieldValue = "Subscriptions Verification";
		try {
			HashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();
			for (String key : testDataKey) {
				fieldValue = key;
				LOGGER.info("SN CHECK" + key.toLowerCase().trim().replaceAll(" ", ""));
				switch (key.toLowerCase().trim().replaceAll(" ", "")) {
				// SubscripitionScreens
				case "s/n":
				case "serialno:":
					LOGGER.info("Checking SerialNo:" + key);
					TestFunctionsFactory.webWait(30, TestFunctionsFactory.driver
							.findElement(By.xpath("//div[contains(@title,'S/N " + testDataMap.get(key).trim() + "')]")));
					break;
				case "services":
				case "services:":
					TestFunctionsFactory.compareSelectedValue(drpDwnServices, testDataMap.get(key));
					break;
				case "customer":
				case "customer:":
					TestFunctionsFactory.compareSelectedValue(drpDwnCustomer, testDataMap.get(key));
					break;
				case "cat":
				case "cat:":
					TestFunctionsFactory.compareSelectedValue(drpDwnCat, testDataMap.get(key));
					break;
				case "dealer:":
				case "dealer":
					TestFunctionsFactory.compareSelectedValue(drpDwnDealer, testDataMap.get(key));
					break;
				case "basesubscription :":
				case "basesubscription":
					TestFunctionsFactory.compareSelectedValue(drpDwnBaseSubscription, testDataMap.get(key));
					break;
				case "additionalservices":
				case "additionalservices:":

					List<WebElement> chkBoxOptions = chkBoxAdditonalServices;
					int i = 0;
					for (WebElement chkBox : chkBoxOptions) {
						i++;
						if (chkBox.getText().trim().equalsIgnoreCase(testDataMap.get(key).split("\\.")[0].trim())) {

							if (testDataMap.get(key).split("\\.")[1].equalsIgnoreCase("TRUE")) {

								TestFunctionsFactory.verifyElementdisplayed(TestFunctionsFactory.driver.findElement(
										By.xpath("//li[" + i + "]//input[contains(@class,'ng-not-empty')]")));

							} else {

								TestFunctionsFactory.verifyElementdisplayed(TestFunctionsFactory.driver
										.findElement(By.xpath("//li[" + i + "]//input[contains(@class,'ng-empty')]")));
							}
						}
					}

					break;
				default:
					throw new CustomisedException(fieldValue,
							"The Given Field " + key + ": is not a valid field for the page, Please correct it");

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

	/*krishk10
	 * @throws CustomisedException
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

	/*krishk10
	 * @throws CustomisedException
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

	/*krishk10
	 * @param action
	 * @throws CustomisedException
	 * @throws Exception
	 */
	public void actionsSubscripition(String action) throws CustomisedException, Exception {

		fieldValue = "My Worklist Page-Actions";
		try {

			switch (action.toUpperCase()) {
			case "SAVE":
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
						"Subscriptions page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

}
