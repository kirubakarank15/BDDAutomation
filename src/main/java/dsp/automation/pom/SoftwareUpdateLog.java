package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class SoftwareUpdateLog {
	@FindBy(xpath="//div[text()='Errors']")
	private WebElement lblErrors; 
	String fieldValue;
	public Login isPageDisplayed() throws CustomisedException {
		
		fieldValue = "Software Update Page";
		try {
			TestFunctionsFactory.webWait(60, lblErrors);

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException("MyWorklist page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else { 
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

}
