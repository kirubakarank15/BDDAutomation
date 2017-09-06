package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class AssetPopulation {
	@FindBy(id="searchInputCCat")
	private WebElement txtSrchInput; 
	String fieldValue;
	public Login isPageDisplayed() throws CustomisedException {
		
		fieldValue = "Asset Population Page";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, txtSrchInput);
		

		} catch (Exception e) { 
			if(!CustomisedException.getFieldValue().equals(null)){
			throw new CustomisedException("AssetPopulation page is facing problem with :"+CustomisedException.getFieldValue(), CustomisedException.getErrorMessage()); 
			}
			else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}
			
			}
		return null; 
	}

}
