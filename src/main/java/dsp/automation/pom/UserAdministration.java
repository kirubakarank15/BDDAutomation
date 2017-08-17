package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class UserAdministration {
	@FindBy(id = "cwsIdInput")
	private WebElement textCWSId;
	String fieldValue;

	public Login isPageDisplayed() throws CustomisedException {

		fieldValue = "User Administration Page";
		try {
			TestFunctionsFactory.waitForPageLoaded(TestFunctionsFactory.driver);
			TestFunctionsFactory.webWait(60, textCWSId);

		} catch (Exception e) {   
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"UserAdministration page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

}
