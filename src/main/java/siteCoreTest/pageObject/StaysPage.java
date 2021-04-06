package siteCoreTest.pageObject;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

/**
 * @author KK
 * This class consists of all the necessary objects and action methods for stays tab contents 
 */
public class StaysPage {
	@FindBy(xpath = "//div//input[@id=\"add-flight-switch\"]")
	private WebElement chkBoxAddFlight;

	@FindBy(xpath = "//a//span[contains(text(),'Stays')]")
	private WebElement menuStays;
	/*
	 * @FindBy(xpath = "	//button[@aria-label=\"Leaving from\"]") private
	 * WebElement btnL;
	 * 
	 * @FindBy(xpath = "	//button[@aria-label=\"Going to\"]") private WebElement
	 * btnGoingTo;
	 */
	@FindBy(xpath = "//div[@id=\"location-field-destination-menu\"]//button")
	private WebElement btnDestinationPlace;
	@FindBy(xpath = "//div[@id=\"location-field-origin-menu\"]//button")
	private WebElement btnFromPlace;
	@FindBy(xpath = "//input[@id=\"location-field-destination\"]")
	private WebElement textDestinationPlace;
	@FindBy(xpath = "//input[@id=\"location-field-origin\"]")
	private WebElement textFromPlace;

	@FindBy(xpath = "//div//span[text()='Check-in']//parent::label//parent::div//button")
	private WebElement btnCheckIn;
	@FindBy(xpath = "//div//span[text()='Check-out']//parent::label//parent::div/button")
	private WebElement btnCheckOut;

	@FindBy(xpath = "	//button[@data-stid=\"date-picker-paging\"][1]")
	private WebElement datePickerPrevious;
	@FindBy(xpath = "	//button[@data-stid=\"date-picker-paging\"][2]")
	private WebElement datePickeAfter;
	@FindBy(xpath = "	//button//span[text()='Done']")
	private WebElement btnDonedate;
	@FindBy(xpath = "	//button[text()='Done']")
	private WebElement btnDoneTravelers;
	@FindBy(xpath = "//*[contains(@data-testid,'travelers-field')]")
	private WebElement btnTravelers;
	@FindBy(xpath = "//div//label[text()='Adults']//following-sibling::div//button[2]")
	private WebElement btnPlusAdults;
	@FindBy(xpath = "//div//label[text()='Adults']//following-sibling::div//button[1]")
	private WebElement btnMinusAdults;
	@FindBy(xpath = "//div//label[text()='Children']//following-sibling::div//button[2]")
	private WebElement btnPlusChild;
	@FindBy(xpath = "//div//label[text()='Children']//following-sibling::div//button[1]")
	private WebElement btnMinusChild;
	@FindBy(xpath = "//div//label[text()='Adults']//following-sibling::div//input")
	private WebElement labelNoOfAdults;


	@FindBy(xpath = "//div//label[text()='Children']//following-sibling::div//input")
	private WebElement labelNoOfChilds;

	@FindBy(xpath = "//button[text()='Search']")
	private WebElement btnSearch;
	@FindBys({@FindBy(xpath = "	//ol//li//h3")})
	private java.util.List<WebElement>   linksResultsPage;

	@FindBys({
			@FindBy(xpath = "//button[@aria-label=\"Going to\"]//parent::div//following-sibling::div//div//strong") })
	private java.util.List<WebElement> dropDownListForDestionation;
	@FindBys({
			@FindBy(xpath = "//button[@aria-label=\"Leaving from\"]//parent::div//following-sibling::div//div//strong") })
	private java.util.List<WebElement> dropDownListForOrgin;
	// button[@aria-label="Going
	// to"]//parent::div//following-sibling::div//div//strong
	// div/h2[contains(text(),'April 2021')]
	// div/h2[contains(text(),'April
	// 2021')]//parent::div//button[contains(@data-day,'7')]
	// div[contains(text(),'New York')]
	// div//strong[contains(text(),'Brussels-')]
	// div//label[text()='Adults']//following-sibling::div//input[@value='1']
	// div//label[text()='Children']//following-sibling::div//input[@value='1']

	/**
	 *KK
	 *06 Apr 2021
	 *void
	 *The comma separated string input from the feature file will be parsed using GET TEST DATA method,
	 * then looped according to the no of inputs (keys) to perform various taks in stays tab
	 */
	public void enterHotelAndFlightSearchDetais(String testData) throws CustomisedException {
		String fieldName="";
		try {
			LinkedHashMap<String, String> testDataMap = TestFunctionsFactory.getTestData(testData);
			// TestFunctionsFactory.waitForPageLoaded();
			Set<String> keys = testDataMap.keySet();

			for (String key : keys) {
	   String option=key.replaceAll(" ", "").trim().toUpperCase();
				fieldName=key;
				switch (option) {
				
				case "GOINGTO":
					TestFunctionsFactory.javaScriptClick(btnDestinationPlace);
					//TestFunctionsFactory.waitForPageLoaded();
					TestFunctionsFactory.webEditText(textDestinationPlace,testDataMap.get(key));
					TestFunctionsFactory.selectFromTypeAhead(dropDownListForDestionation, testDataMap.get(key));
			break;
				case "LEAVINGFROM":
					TestFunctionsFactory.javaScriptClick(btnFromPlace);
				//	TestFunctionsFactory.waitForPageLoaded();
					TestFunctionsFactory.webEditText(textFromPlace,testDataMap.get(key));
					TestFunctionsFactory.selectFromTypeAhead(dropDownListForOrgin, testDataMap.get(key));
					break;
				case "CHECKIN":
					TestFunctionsFactory.javaScriptClick(btnCheckIn);
					//TestFunctionsFactory.waitForPageLoaded();
					TestFunctionsFactory.dateSelectorForExpediaSite(testDataMap.get(key));
					TestFunctionsFactory.webWaitUntilClickable(15, btnDonedate);
					TestFunctionsFactory.webClick(btnDonedate);
					break;
				case "CHECKOUT":
					TestFunctionsFactory.javaScriptClick(btnCheckOut);
					//TestFunctionsFactory.waitForPageLoaded();
					TestFunctionsFactory.dateSelectorForExpediaSite(testDataMap.get(key));
					TestFunctionsFactory.webWaitUntilClickable(15, btnDonedate);
					TestFunctionsFactory.webClick(btnDonedate);
					break;
				case "ADULTS":
					//TestFunctionsFactory.webWaitUntilClickable(15, btnTravelers);
					TestFunctionsFactory.webClick(btnTravelers);
					int noOfAdultsInSite = Integer.parseInt(labelNoOfAdults.getAttribute("value"));
					int noOfAdultsToChoose = Integer.parseInt(testDataMap.get(key));
					if (noOfAdultsInSite != noOfAdultsToChoose) {
						if (noOfAdultsInSite > noOfAdultsToChoose) {
							while (noOfAdultsInSite != noOfAdultsToChoose) {
								
								//TestFunctionsFactory.webWaitUntilClickable(15, btnMinusAdults);
								TestFunctionsFactory.webWaitStaleCheck(15, btnMinusAdults);
								TestFunctionsFactory.javaScriptClick(btnMinusAdults);
								//TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(By.xpath("//div//label[text()='Adults']//following-sibling::div//button[1]")));
								--noOfAdultsInSite;
							}
						} else {
							while (noOfAdultsInSite != noOfAdultsToChoose) {
								TestFunctionsFactory.webWaitStaleCheck(15, btnPlusAdults);
								TestFunctionsFactory.javaScriptClick(btnPlusAdults);
								++noOfAdultsInSite;
							}
						}
					}
					TestFunctionsFactory.webWaitUntilClickable(15, btnDoneTravelers);
					TestFunctionsFactory.webClick(btnDoneTravelers);
					break;
				case "CHILD":
					TestFunctionsFactory.webClick(btnTravelers);
					int noOfChildInSite = Integer.parseInt(labelNoOfChilds.getAttribute("value"));
					int noOfChildToChoose = Integer.parseInt(testDataMap.get(key));
					if (noOfChildInSite != noOfChildToChoose) {
						if (noOfChildInSite > noOfChildToChoose) {
							while (noOfChildInSite != noOfChildToChoose) {
								TestFunctionsFactory.webWaitStaleCheck(15, btnMinusChild);
								TestFunctionsFactory.javaScriptClick(btnMinusChild);
								--noOfChildInSite;
							}
						} else {
							while (noOfChildInSite != noOfChildToChoose) {
								TestFunctionsFactory.webWaitStaleCheck(15, btnPlusChild);
								TestFunctionsFactory.javaScriptClick(btnPlusChild);
								++noOfChildInSite;
							}
						}
					}
					TestFunctionsFactory.webWaitUntilClickable(15, btnDoneTravelers);
					TestFunctionsFactory.webClick(btnDoneTravelers);
					break;
				default:
					//throw new Exception("Provided operation is not available in the switch case , please add");
                
				}
		
			}

		} catch (Exception e) {
			e.printStackTrace();

			throw new CustomisedException("Error Occured in "+fieldName, e.getMessage());
		}

	}

	/**
	 *KK
	 *06 Apr 2021
	 *void
	 *based on input actions will be performed by respective switch Case
	 */
	public void Actions(String action) throws CustomisedException {
		try {
			// TestFunctionsFactory.waitForPageLoaded();

			switch (action.toUpperCase().replaceAll(" ", "")) {
		
			case "ADDFLIGHT":

//				TestFunctionsFactory.webWaitUntilClickable(10, menuStays);
//				TestFunctionsFactory.javaScriptClick(menuStays);
				TestFunctionsFactory.javaScriptClick(chkBoxAddFlight);
				//TestFunctionsFactory.waitForPageLoaded();
			case "SEARCH":
				TestFunctionsFactory.webClick(btnSearch);
			}

		} catch (Exception e) {

			throw new CustomisedException("Expedia Stays Page", e.getMessage());
		}

	}
	
	/**
	 *KK
	 *06 Apr 2021
	 *void
	 *verifying the fligh and accomdation results are displayed 
	 */
	public void verifyTheResultpageIsDisplayed() throws CustomisedException {
		try {
			// TestFunctionsFactory.waitForPageLoaded();
         if(linksResultsPage.size()<0) {
        	throw new Exception("No Results are displayed for the search") ;
         }
		
		} catch (Exception e) {

			throw new CustomisedException("Expedia Results Page", e.getMessage());
		}

	}


}
