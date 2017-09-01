package dsp.automation.pom;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

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
	@FindBy(xpath = "//div[contains(text(),' Additional Services')]	")
	private WebElement drpAdditionalServices;
	@FindBys(@FindBy(xpath = "//div[contains(text(),' Additional Services')]//parent::button//following-sibling::ul//li"))
	private List<WebElement> chkBoxAdditonalServices;

	String fieldValue;

	public MyWorklist isSubscriptionRecordDisplayed(String serialNo) throws CustomisedException, Exception {

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
			HashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();
			for (String key : testDataKey) {
				fieldValue = key;
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
				case "basesubscription ":
					TestFunctionsFactory.selectFromDropDown(drpDwnBaseSubscription, testDataMap.get(key));
					break;
				case "additionalservices":
				case "additionalservices:":

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
			case "Save":
			case "Save/Sync":
				TestFunctionsFactory.webClick(btnSaveSync);
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
