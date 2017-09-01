package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class TroubleShootLog {
	@FindBy(xpath = "//div[contains(text(),'S/N (Minimum three')]//following-sibling::input")
	private WebElement txtSerialNumber;
	String fieldValue;
	public Login isPageDisplayed() throws CustomisedException {
		
		fieldValue = "Trouble ShootPage";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, txtSerialNumber);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException("TroubleShootLog page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else { 
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

}
