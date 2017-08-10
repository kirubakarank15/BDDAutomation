package dsp.automation.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.TestFunctionsFactory;

public class Login {
	@FindBy(id = "cwsUID")
	private WebElement txtCWSId;
	@FindBy(id = "cwsPwd")
	private WebElement txtCWPswd;
	@FindBy(id = "submitButton")
	private WebElement btnSubmit;
	@FindBy(xpath = "//span[text()='Quick Links']")
	private WebElement linkHomePageQuickLink;
	String fieldValue;

	public Login isPageDisplayed() throws Exception {

		fieldValue = "Login";
		try {

			TestFunctionsFactory.webWait(120, txtCWSId);

		} catch (Exception e) { 
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException("Login page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else { 
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
		return null;
	}

	public void enterDetails(String userName, String pswd) throws CustomisedException {
		fieldValue = "Login Enter Details Text boxes";
		try {	
			System.out.println("User Name:"+userName+pswd);
			TestFunctionsFactory.webEditText(txtCWSId, userName);
			TestFunctionsFactory.webEditText(txtCWPswd, pswd);

			TestFunctionsFactory.webClick(btnSubmit);
			this.homePageVerification();
		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException("Login page is facing problem with" +CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		} 

	}
 
	private void homePageVerification() throws CustomisedException {
		try {
			
			//TestFunctionsFactory.driver.get(TestFunctionsFactory.driver.getCurrentUrl());

			TestFunctionsFactory.webWaitPages(120, linkHomePageQuickLink);
		} catch (Exception e) {
			if (!CustomisedException.getFieldValue().equals(null)) {
				throw new CustomisedException("Login page is facing problem with" + CustomisedException.getFieldValue(),
						CustomisedException.getErrorMessage());
			} else {
				throw new CustomisedException(fieldValue, e.getMessage().toString());
			}

		}
	}

}
