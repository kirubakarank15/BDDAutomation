package siteCoreTest.pageObject;

import java.util.HashMap;
import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;
import demo.utilities.TextFileWriter;

public class duckDuckGoSearchPage {
	
	@FindBy(id = "search_form_input_homepage")
	private WebElement searchTextBox;
	@FindBy(id = "search_button_homepage")
	private WebElement searchButton;
	

	
	
	/**
	 *KK
	 *06 Apr 2021
	 *void
	 *this method will search the given input in duckduck go site
	 */
	public void search(String TestData) throws CustomisedException {
		try {
			
			TestFunctionsFactory.webEditText(searchTextBox, TestData);
			TestFunctionsFactory.webClick(searchButton);
		 
		}
					catch (Exception e) {
			
			throw new CustomisedException("duckDuckGo SearchPage", e.getMessage());
		}
		


}
	
}