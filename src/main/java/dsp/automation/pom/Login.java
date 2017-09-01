package dsp.automation.pom;

import java.util.logging.Logger;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.EcncryptorDecryptor;
import dsp.automation.utilities.FileHandling;
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
	private final static Logger LOGGER = Logger.getLogger(Login.class.getName());
	public Login isPageDisplayed() throws Exception {

		fieldValue = "Login";
		try {
			LOGGER.info(EcncryptorDecryptor.decryptor(FileHandling.getProperty("Password")));
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, txtCWSId);
			LOGGER.info("Login Page is displayed");
		

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
			TestFunctionsFactory.waitForPageLoaded();
			//TestFunctionsFactory.webWaitPages(30, linkHomePageQuickLink);
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
