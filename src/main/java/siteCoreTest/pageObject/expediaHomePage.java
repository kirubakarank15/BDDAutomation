package siteCoreTest.pageObject;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

public class expediaHomePage {
	
	@FindBy(xpath   = "//nav//div[contains(@class,'uitk-text')]")
	private WebElement regionSelectionLabel;
	@FindBy(xpath   = "//label[text()='Region']/following-sibling::select")
	private WebElement selectRegion;
	@FindBy(xpath   = "//label[text()='Language']/following-sibling::select")
	private WebElement selectLanguage;
	@FindBy(xpath   = "//label[text()='Currency']/following-sibling::select")
	private WebElement selectCurrency;
	@FindBy(xpath   = "//a/span[text()='Flights']")
	private WebElement menuFlights;
	@FindBy(xpath   = "//a/span[text()='Stays']")
	private WebElement menuStays;
	@FindBy(xpath   = "//button[text()='Save']")
	private WebElement btnSave;
	@FindBy(id   = "//button[@title='Close']")
	private WebElement closeIcon;
	
	/**
	 *KK
	 *06 Apr 2021
	 *void
	 *Will check the region from the input comes from the step definition, then this will modify the region/language if required 
	 */
	public void verifyAndSelectRegionAndLanguage(String region,String language) throws Exception {
		try {
			//
		
			TestFunctionsFactory.webClick(regionSelectionLabel);
		
			if(!TestFunctionsFactory.verifySelectedValue(selectRegion, region)) {
				
			TestFunctionsFactory.selectFromDropDown(selectRegion, region);
			TestFunctionsFactory.selectFromDropDown(selectLanguage, language);

			
			}
			
			TestFunctionsFactory.webClick(btnSave);
		} catch (Exception e) {
			
			throw new CustomisedException("duckDuckGo SearchPage", e.getMessage());
		}

	}
	

	
}
