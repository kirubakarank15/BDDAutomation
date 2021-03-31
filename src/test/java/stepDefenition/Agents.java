package stepDefenition;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import demo.pageObjectModel.AEHome;
import demo.pageObjectModel.IndvidualAgentDetails;
import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;
import io.cucumber.java.en.*;

public class Agents {
	
	
	
	
	@Given("^perform click on First Agent$")
	public void clickAgent() {
		try {
				AEHome obj = PageFactory.initElements(TestFunctionsFactory.driver, AEHome.class);
				obj.clickFirstAgent();
			
		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Agents Page");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Agents Page");
				Assert.fail(e.getMessage().toString());
			}
		}
	}

	
	@Given("^save the following fetched details \"([^\"]*)\" from Agent Details Page$")
	public void saveDetails(String testData) {
		try {
			List<String> list=new  ArrayList<>(Arrays.asList(testData.split(",")));
			System.out.println(list.get(0));
				IndvidualAgentDetails obj1 = PageFactory.initElements(TestFunctionsFactory.driver, IndvidualAgentDetails.class);
				obj1.getRequiredDetails(list);
			
		} catch (Exception e) {

			
				TestFunctionsFactory.takeSnapShot("Agents Page");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			
		}
	}

	@Given("^search with details as \"([^\"]*)\" in agent page of AE Property Finder$")
	public void searchAgent(String details) {
		try {
				AEHome obj = PageFactory.initElements(TestFunctionsFactory.driver, AEHome.class);
				obj.searchAgents(details);
			
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
	
	
	
	@Given("^store the agents count$")
	public void storeAgent() {
		try {
				AEHome obj = PageFactory.initElements(TestFunctionsFactory.driver, AEHome.class);
				obj.verifyAgentCount("");
			
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
	
	
	@Given("^verify the agent count is \"([^\"]*)\" than previous search in agent page of AE Property Finder$")
	public void verifyAgent(String comparator) {
		try {
				AEHome obj = PageFactory.initElements(TestFunctionsFactory.driver, AEHome.class);
				obj.verifyAgentCount(comparator);
			
		} catch (Exception e) {
System.out.println(CustomisedException.getErrorMessage());
			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot("Comparing Agent Count");

				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot("Comparing Agent Count");
				System.out.println(e.getMessage());
				Assert.fail(e.getMessage().toString());
			}
		}
	}

}
