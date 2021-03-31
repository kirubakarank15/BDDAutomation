
package toolsQA.pageObjectModel;

import java.util.LinkedHashMap;
import java.util.Set;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(kk) PropertyFinder-Demo Cucumber Automation
 * 
 */
public class SeleniumOnlineTraining {

	@FindBy(xpath = "//div//h1[contains(text(),'Selenium Training')]")
	private WebElement pageHeader;
	@FindBy(name = "your-name")
	private WebElement txtName;
	@FindBy(name = "your-email")
	private WebElement txtEmail;
	@FindBy(name = "your-mobile")
	private WebElement txtMobileNo;
	@FindBy(name = "your-country")
	private WebElement txtCountryName;
	@FindBy(name = "your-message")
	private WebElement msgBox;
	@FindBy(xpath = "//input[@value='Send']")
	private WebElement btnSubmit;

	String fieldValue;

	public void isPageDisplayed() throws CustomisedException {

		fieldValue = "CorportateTrainings";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, pageHeader);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"CorportateTrainings page is facing problem with :" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

	/*
	 * kk
	 * 
	 * @param testData
	 * 
	 * @throws CustomisedException
	 */
	public void enterDetails(String testData) throws CustomisedException {

		fieldValue = "Enrolling form";
		try {
			LinkedHashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			Set<String> testDataKey = testDataMap.keySet();

			for (String key : testDataKey) {
				fieldValue = key;

				switch (fieldValue.toLowerCase().trim().replaceAll(" ", "")) {

				case "name":

					TestFunctionsFactory.webEditText(txtName, testDataMap.get(key));
					break;
				case "email":
					TestFunctionsFactory.webEditText(txtEmail, testDataMap.get(key));
					break;
				case "mobile":

					TestFunctionsFactory.webEditText(txtMobileNo, testDataMap.get(key));

					break;
				case "country":

					TestFunctionsFactory.webEditText(txtCountryName, testDataMap.get(key));
					break;
				case "yourmessage":

					TestFunctionsFactory.webEditText(txtName, testDataMap.get(key));
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
						"Enrolling form is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {

				throw new CustomisedException(fieldValue, e.getMessage().toString());

			}

		}

	}

	/*
	 * kk
	 * 
	 * @param action
	 * 
	 * @throws CustomisedException
	 * 
	 * @throws Exception
	 */
	public void actions(String action) throws CustomisedException, Exception {

		fieldValue = "My Worklist Page-Actions";
		try {

			switch (action.toUpperCase()) {
			case "SEND":

				TestFunctionsFactory.javaScriptClick(btnSubmit);
				TestFunctionsFactory.waitForPageLoaded();
				break;

			default:
				throw new CustomisedException(fieldValue,
						"The Given Action is not a valid one for this page, please correct it");

			}

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"Enrolling form is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}

	}

}
