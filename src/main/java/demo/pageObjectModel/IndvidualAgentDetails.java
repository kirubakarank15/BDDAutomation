package demo.pageObjectModel;

import java.util.HashMap;
import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;
import demo.utilities.TextFileWriter;

public class IndvidualAgentDetails {
	
	@FindBy(xpath = "//div[contains(@class,'tile_images')]//img")
	private WebElement imgFirstAgent;
	@FindBy(xpath = "//*[contains(@class,'bioinfo_name')]")
	private WebElement lblName;
	@FindBy(xpath = "//*[contains(text(),'Active ')]//following-sibling::span//a")
	private WebElement lnkAreaListings;
	@FindBy(xpath = "//*[contains(text(),'Languages:')]//following-sibling::span")
	private WebElement lblLanguage;
	@FindBy(xpath = "//*[contains(text(),'Nationality:')]//following-sibling::span")
	private WebElement lblNationality;
	@FindBy(xpath = "//*[contains(text(),'License No')]//following-sibling::span")
	private WebElement lblLicense;
	@FindBy(xpath = "//*[contains(text(),'Experience')]//following-sibling::span")
	private WebElement lblExperience;
	@FindBy(xpath = "//*[contains(text(),'LinkedIn:')]//following-sibling::span//a")
	private WebElement linkLinkedInUrl;
	
	
	@FindBy(xpath = "//a//span[contains(@class,'phone')]//parent:a")
	private WebElement lnkPhoneNo;
	@FindBy(xpath = "//a//span[contains(@class,'phone')]")
	private WebElement lblHiddenPhoneNo;
	@FindBy(xpath = "	//a[contains(text(),'View profile')]//parent::p//preceding-sibling::p")
	private WebElement lblCompanyName;
	@FindBy(xpath = "	//a[contains(@title,'About')]//parent::div//following-sibling::div")
	private WebElement lblContentAboutMe;
	@FindBy(xpath = "	//a[contains(@title,'About')]")
	private WebElement lnkAboutMe;
	@FindBy(xpath = "//a[contains(@title,'About')]//parent::div//following-sibling::div")
	private WebElement lblAboutMeContent;
	
	public void isPageDisplayed() throws CustomisedException {
		try {
			TestFunctionsFactory.waitForPageLoaded();
			if (!lblCompanyName.isDisplayed())
				throw new CustomisedException("Agent Individual Page", "page is not displayed");
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Agent Individual Page", e.getMessage());
		}
	}
	public void getRequiredDetails(List<String> TestData) throws CustomisedException {
		try {
			HashMap<String, String> textFileLoader=new HashMap<>();
					for(String labels:TestData){
				switch(labels.toUpperCase().replaceAll(" ", "").trim())
				{
				case"NAME":
					textFileLoader.put(labels, lblName.getText());
					break;
				case"NATIONALITY":
					textFileLoader.put(labels, lblNationality.getText());
					break;
				case"LANGUAGE":
				case"LANGUAGES":
					textFileLoader.put(labels, lblLanguage.getText());
					break;
				case"LICENSE":
				case"LICENSENO":
					textFileLoader.put(labels, lblLicense.getText());
					break;
				case"ABOUTME":
					TestFunctionsFactory.webClick(lnkAboutMe);
					
					textFileLoader.put(labels, lblContentAboutMe.getText());
					break;
				case"PHONENO":
				case"PHONENUMBER":
					//TestFunctionsFactory.webClick(lnkPhoneNo);
					//textFileLoader.put(labels, lnkPhoneNo.getAttribute("href"));
					break;
				case"COMPANY":
				case"COMPANYNAME":
					textFileLoader.put(labels, lblCompanyName.getText());
					break;
				case"EXPERIENCE":
					textFileLoader.put(labels, lblExperience.getText());
					break;
				case"ACTIVELISTINGS":
				case"NOOFACTIVELISTINGS":
					textFileLoader.put(labels, lnkAreaListings.getText());
					break;
				case"LINKEDIN":
				case"LINKEDINURL":
					if(linkLinkedInUrl.isDisplayed()){
						textFileLoader.put(labels, linkLinkedInUrl.getText());
					}
					break;
					default:
					throw new CustomisedException(labels, "is not available in the page");
				}	
				
					}
					System.out.println(textFileLoader);
					TextFileWriter.textpadWriter(textFileLoader);
				
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Agent Individual Page", e.getMessage());
		}
		
}
}