package dsp.automation.pom;

import java.util.HashMap;
import java.util.Set;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class MyWorklist {

	// Search Section Elements
	@FindBy(xpath = "	")
	private WebElement lblUCID;
	@FindBy(xpath = "//div[contains(text(),'S/N (Minimum three')]//following-sibling::input")
	private WebElement txtSerialNumber;
	@FindBy(xpath = "//div[text()='UCID Number']//following-sibling::input")
	private WebElement txtucIdNumber;
	@FindBy(xpath = "//div[text()='DCN Number']//following-sibling::input")
	private WebElement txtDCNnumber;
	@FindBy(className = "srchButtonPane")
	private WebElement btnSearch;

	// Search Result Section Elements
	@FindBy(xpath = "//div[contains(text(),'Search Results for:')]")

	private WebElement lblSearchResults;
	String fieldValue;

	public MyWorklist isPageDisplayed() throws CustomisedException, Exception {

		fieldValue = "My Worklist Page";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(60, txtucIdNumber);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"MyWorklist page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

	public MyWorklist searchAssetDetails(String testData) throws CustomisedException, Exception {

		fieldValue = "My Worklist-Search Asset Details";
		try {
			HashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();
			for (String key : testDataKey) {
				switch (key.toUpperCase().trim().replaceAll(" ", "")) {

				case "S/N":
				case "SERIALNUMBER":
				case "SERIALNO":
				case "S/N(MINIMUMTHREECHARACTERS)":
					TestFunctionsFactory.webEditText(txtSerialNumber, testDataMap.get(key));
					break;
				case "UCIDNUMBER":
					TestFunctionsFactory.webEditText(txtucIdNumber, testDataMap.get(key));
					break;
				case "DCNNUMBER":
					TestFunctionsFactory.webEditText(txtDCNnumber, testDataMap.get(key));
					break;
				default:
					throw new CustomisedException(fieldValue,
							"The Given Field " + key + ": is not a valid field for the page, Please correct it");

				}
			}

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"MyWorklist page is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

	public MyWorklist actions(String action) throws CustomisedException, Exception {

		fieldValue = "My Worklist Page-Actions";
		try {

			switch (action.toUpperCase()) {
			case "SUBMIT":
				TestFunctionsFactory.webClick(btnSearch);
				TestFunctionsFactory.waitForPageLoaded();
				TestFunctionsFactory.webWait(60, lblSearchResults);

			default:
				throw new CustomisedException(fieldValue,
						"The Given Action is not a valid one for this page, please correct it");

			}

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"MyWorklist page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
	}

}
