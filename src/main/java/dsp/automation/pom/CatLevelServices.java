package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class CatLevelServices {
	@FindBy(xpath="//div[text()='CAT LEVEL SERVICES']")
	private WebElement lblCatLevelServices; 
	String fieldValue;
	public Login isPageDisplayed() throws CustomisedException {
		
		fieldValue = "Cat Level Services Page";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, lblCatLevelServices); 

		} catch (Exception e) { 
			if(!CustomisedException.getFieldValue().equals(null)){
			throw new CustomisedException("CatLevelServices page is facing problem with :"+CustomisedException.getFieldValue(), CustomisedException.getErrorMessage()); 
			}
			else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}
			
			}
		return null;
	}


}
