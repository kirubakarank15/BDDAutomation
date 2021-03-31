package stepDefenition;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import demo.pageObjectModel.AEHome;
import demo.pageObjectModel.IndvidualAgentDetails;
import demo.pageObjectModel.QAHome;
import demo.utilities.CustomisedException;
import demo.utilities.FileHandling;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.Given;

public class PropertyFinder {

	
	@io.cucumber.java.en.Given("^Launch propertyFinder url$")
	public void launch_toolsQA_url() {
		try {
//			System.out.println("Value is"+System.getProperty("browserName"));
//			System.out.println("Value is"+System.getProperty("environment"));
			TestFunctionsFactory.launchUrl("CHROME", FileHandling.getProperty("Dev"));
			//TestFunctionsFactory.launchUrl("chrome", FileHandling.getProperty("Dev"));
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage().toString());
			}
		}
	}
	
	@Given("^page \"([^\"]*)\" should be displayed$")
	public void verify_PageDisplayed(String page) {
		try { 
			switch(page.replaceAll(" ", "").toLowerCase())
			{
			case "propertyfinderqahome" :
				QAHome obj1 = PageFactory.initElements(TestFunctionsFactory.driver, QAHome.class);
				obj1.isPageDisplayed();
				break;
			case  "agents" :
			case "topagents" :
				AEHome obj2 = PageFactory.initElements(TestFunctionsFactory.driver, AEHome.class);
				obj2.isPageDisplayed();
				break;
			case  "agent" :
			case "agentdetails" :
				IndvidualAgentDetails obj3 = PageFactory.initElements(TestFunctionsFactory.driver, IndvidualAgentDetails.class);
				obj3.isPageDisplayed();
				break;
			}
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Launching URL");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Launching URL");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	
	@Given("^search with details as \"([^\"]*)\" in home page of QA Property Finder$")
	public void searchDetails(String details) {
		try {
			System.out.println("Details is : "+details);
				QAHome obj = PageFactory.initElements(TestFunctionsFactory.driver, QAHome.class);
				obj.searchDetails(details);
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Searching details");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Searching details");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	
	
	@Given("^perform sorting as \"([^\"]*)\" in home page of QA Property Finder$")
	public void performSort(String details) {
		try {
			System.out.println("Details is : "+details);
				QAHome obj = PageFactory.initElements(TestFunctionsFactory.driver, QAHome.class);
				obj.performSort(details);
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Sorting");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Sorting");
				Assert.fail(e.getMessage().toString());
			}
		}
	}
	
	
	
	@Given("^save the fetched details from home page of QA Property Finder$")
	public void saveDetails() {
		try {
				QAHome obj = PageFactory.initElements(TestFunctionsFactory.driver, QAHome.class);
				obj.getPropertyDetails();
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Saving Values");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Saving Values");
				Assert.fail(e.getMessage().toString());
			}
		}
	}
	
	
	
	@Given("^switch to \"([^\"]*)\" tab in home page of AE Property Finder$")
	public void switchTab(String tab) {
		try {
				AEHome obj = PageFactory.initElements(TestFunctionsFactory.driver, AEHome.class);
				obj.moveToTab(tab);
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Saving Values");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Saving Values");
				Assert.fail(e.getMessage().toString());
			}
		}
	}
	
}
