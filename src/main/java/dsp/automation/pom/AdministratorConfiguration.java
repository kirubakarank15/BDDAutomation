package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class AdministratorConfiguration {
	@FindBy(xpath = "//li//a[text()='User Notification']")
	private WebElement lblUserNotiifcation;
	String fieldValue;

	public Login isPageDisplayed() throws CustomisedException {

		fieldValue = "My Worklist Page";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, lblUserNotiifcation);


		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"AdministratorConfiguration facing problem with :" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

}
