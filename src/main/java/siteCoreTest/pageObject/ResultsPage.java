package siteCoreTest.pageObject;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

public class ResultsPage {

	@FindBy(xpath   = "//a//span[contains(text(),'DuckDuckGo')]")
	private WebElement headerLogo;
	@FindBy(xpath = "//div[contains(@class,'item-title')]/span")
	private WebElement titleInWikiContent;
	/*
	 * @FindBy(id = "ddgsi badge-link__close") private WebElement
	 * btnCloseExtentensionPopUp;
	 */
	

	/**
	 *KK
	 *06 Apr 2021
	 *void
	 *This method verifies the result page is displayed by checking duckduck logo and wiki content tile with the given country name
	 */
	public void verifyResults(String contentTileToveify) throws Exception {
		try {
			//TestFunctionsFactory.waitForPageLoaded();
	
			if (!TestFunctionsFactory.verifyElementdisplayed(headerLogo)) {
				if (!titleInWikiContent.getText().contains(contentTileToveify)) {
					throw new Exception("search results are not matching : expeted content title is " + contentTileToveify+ " \n Actual Title is  " + titleInWikiContent.getText());
				}
			} else {
				throw new Exception("search results are not matching : expeted content title is ");
			}

		} catch (Exception e) {
			
			throw new CustomisedException("duckDuckGo SearchPage", e.getMessage());
		}

	}

}
