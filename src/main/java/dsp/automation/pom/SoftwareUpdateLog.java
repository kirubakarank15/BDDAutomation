package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class SoftwareUpdateLog {
	@FindBy(xpath="//div[contains(@class,'export')]")
	private WebElement lblExport; 
	String fieldValue;
	public Login isPageDisplayed() throws CustomisedException {
		
		fieldValue = "Software Update Page";
		try {
			TestFunctionsFactory.waitForPageLoaded(TestFunctionsFactory.driver);
			TestFunctionsFactory.webWait(60, lblExport);

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
