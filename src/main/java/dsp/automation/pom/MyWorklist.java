package dsp.automation.pom;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(Krishk10)
 *DSP-ISSS Cucumber Automation
 * 
 */
public class MyWorklist {

	// Search Section Elements
	@FindBy(xpath = "	")
	private WebElement lblUCID;
	@FindBy(xpath = "//div[contains(text(),'S/N (Minimum three')]//following-sibling::input")
	private WebElement txtSerialNumber;
	@FindBy(xpath = "//div[text()='UCID Number']//following-sibling::input")
	private WebElement txtucIdNumber;
	@FindBy(xpath = "//div[text()='DCN Number']//following-sibling::input")
	private WebElement txtDCNnumber;
	@FindBy(className = "srchButtonPane")
	private WebElement btnSearch;
	//susbcripition page
	@FindBy(xpath = "//span[contains(text(),'Back')]")
	private WebElement linkback;
	// Search Result Section Elements
	@FindBy(xpath = "//*[contains(text(),'Search Results for:')]")

	private WebElement lblSearchResults;
	String fieldValue;
	
	private final static Logger LOGGER = Logger.getLogger(MyWorklist.class.getName());

	/*krishk10
	 * @return
	 * @throws CustomisedException
	 * @throws Exception
	 */
	public MyWorklist isPageDisplayed() throws CustomisedException, Exception {

		fieldValue = "My Worklist Page";
		try {
		
			TestFunctionsFactory.webWait(30, txtucIdNumber);
			//new TestFunctionsFactory().webEditText1(element, text);
		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"MyWorklist page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

	/*krishk10
	 * @param testData
	 * @return
	 * @throws CustomisedException
	 * @throws Exception
	 */
	public MyWorklist searchAssetDetails(String fieldName,String testData) throws CustomisedException, Exception {

		fieldValue = "My Worklist-Search Asset Details";
		try {
			List<WebElement> nullCheck=TestFunctionsFactory.driver.findElements(By.xpath("//span[contains(text(),'Back')]"));
		
		if(nullCheck.size()!=0){
			TestFunctionsFactory.javaScriptClick(linkback);
			List<WebElement> obj=TestFunctionsFactory.driver.findElements(By.xpath("//button[contains(text(),'Cancel')]"));
			if(obj.size()!=0){
				TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(By.xpath("	")));
			}
			TestFunctionsFactory.waitForPageLoaded();
		}
				switch (fieldName.toUpperCase().trim().replaceAll(" ", "")) {

				case "S/N":
				case "SERIALNUMBER":
				case "SERIALNO":
				case "S/N(MINIMUMTHREECHARACTERS)":
					TestFunctionsFactory.webEditText(txtSerialNumber, testData);
					break;
				case "UCIDNUMBER":
					TestFunctionsFactory.webEditText(txtucIdNumber,testData);
					break;
				case "DCNNUMBER":
					TestFunctionsFactory.webEditText(txtDCNnumber, testData);
					break;

				}
			

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"MyWorklist page is facing problem with " + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

	public MyWorklist actions(String action) throws CustomisedException, Exception {

		fieldValue = "My Worklist Page-Actions";
		try {
			
			
			
			
			

			switch (action.toUpperCase()) {
			case "SUBMIT":
				TestFunctionsFactory.webClick(btnSearch);
				TestFunctionsFactory.waitForPageLoaded();
				TestFunctionsFactory.webWait(60, lblSearchResults);
				break;
			default:
				throw new CustomisedException(fieldValue,
						"The Given Action is not a valid one for this page, please correct it");
	
			}

		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"MyWorklist page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

}
