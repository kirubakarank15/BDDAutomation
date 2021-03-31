/**
 * 
 */
package stepDefenition;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;


import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.When;
import toolsQA.pageObjectModel.SeleniumOnlineTraining;

/**
 * @author Kirubakaran.K(kk) PropertyFinder-Demo Cucumber Automation
 * 
 */
public class SeleniumOnlineTraining_def { 

	toolsQA.pageObjectModel.SeleniumOnlineTraining obj = PageFactory.initElements(TestFunctionsFactory.driver,
			toolsQA.pageObjectModel.SeleniumOnlineTraining.class);

	@When("^enter details as \"([^\"]*)\" in enrollment form for Training$")
	public void enter_details_as_in_enrollment_form_for_Training(String testData) {

		try {
			obj.enterDetails(testData);
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("EnrollmentForm");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("EnrollmentForm");
				Assert.fail(e.getMessage().toString());
			}
		}

	}

	@When("^submit the enrollment form$")
	public void submit_the_enrollment_form() throws Throwable {

		try {
			obj.actions("send");
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("EnrollmentForm");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("EnrollmentForm");
				Assert.fail(e.getMessage().toString());
			}
		}

	}
}
