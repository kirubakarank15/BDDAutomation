package dsp.automation.pom;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

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

	String fieldValue;
	private final static Logger LOGGER = Logger.getLogger(Subscriptions.class.getName());

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

	public void enterSubscriptionValues(String testData) throws CustomisedException {

		fieldValue = "Subscriptions Page";
		try {
			boolean additionalServicesflag = false;
			String addServicesOption = "";
			HashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();
			for (String key : testDataKey) {
				fieldValue = key;
				LOGGER.info("Selecting the Value :" + key);
				switch (key.toLowerCase().trim().replaceAll(" ", "")) {

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
								 
								  TestFunctionsFactory.javaScriptClick(
								 TestFunctionsFactory.driver.findElement(By
								.xpath("//div[contains(text(),' Additional Services')]//parent::button//parent::div//ul//li["
								  + i + "]//input")));
								 
							}  
							}
						else if (trueOrFalse[1].equalsIgnoreCase("FALSE")) {
							List<WebElement> elementFalse = TestFunctionsFactory.driver
									.findElements(By.xpath("//li[" + i + "]//input[contains(@class,'ng-empty')]"));
							if (elementFalse.size() == 0) {
								 
								  TestFunctionsFactory.javaScriptClick(
								 TestFunctionsFactory.driver.findElement(By
								.xpath("//div[contains(text(),' Additional Services')]//parent::button//parent::div//ul//li["
								  + i + "]//input")));
								 
								LOGGER.info("TRUE OR FALSE BLOCK2");
							}

						} 

				}
					else if (chkBoxOptions.size() == i) {
						throw new CustomisedException(
								"Ädditional FieldServices drop down is not having the value :" + addServicesOption,
								"");
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

	public void verifySubscriptionDetails(String testData) throws CustomisedException {

		fieldValue = "Subscriptions Verification";
		try {
			HashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();
			for (String key : testDataKey) {
				fieldValue = key;
				switch (key.toLowerCase().trim().replaceAll(" ", "")) {

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

	public void actions(String action) throws CustomisedException, Exception {

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
