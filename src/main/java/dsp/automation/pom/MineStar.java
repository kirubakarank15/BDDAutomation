package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class MineStar {
	@FindBy(xpath="//div//button[contains(text(),'Create New Site')]")
	private WebElement btnCreateNewSite; 
	String fieldValue;
	public Login isPageDisplayed() throws CustomisedException {
		
		fieldValue = "MineStar Page";
		try { 
			TestFunctionsFactory.waitForPageLoaded(TestFunctionsFactory.driver);
			TestFunctionsFactory.webWait(60, btnCreateNewSite);
			

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException("MineStar page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else { 
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}


}
