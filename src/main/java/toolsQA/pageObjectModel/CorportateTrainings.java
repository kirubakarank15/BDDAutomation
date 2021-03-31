/**
 * 
 */
package toolsQA.pageObjectModel;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(kk)
 *PropertyFinder-Demo Cucumber Automation
 * 
 */
public class CorportateTrainings {
	@FindBy(xpath = "//*[contains(text(),'TOOLSQA Offers In-Person Corporate Training')]")
	private WebElement pageHeader;
	String fieldValue;

	public void isPageDisplayed() throws CustomisedException {

		fieldValue = "CorportateTrainings";
		try {
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, pageHeader);


		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException(
						"CorportateTrainings page is facing problem with :" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		
	}



}
