package stepDefenition;

import org.testng.annotations.AfterMethod;
import org.testng.Assert;
import java.util.Properties;

import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.Parameters;

import cucumber.api.java.Before;
import cucumber.api.java.en.When;
import dsp.automation.pom.AdministratorConfiguration;
import dsp.automation.pom.AssetPopulation;
import dsp.automation.pom.CatLevelServices;
import dsp.automation.pom.Login;
import dsp.automation.pom.MineStar;
import dsp.automation.pom.MyWorklist;
import dsp.automation.pom.SoftwareUpdateLog;
import dsp.automation.pom.TroubleShootLog;
import dsp.automation.pom.UserAdministration;
import dsp.automation.runners.TestRunner;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.EcncryptorDecryptor;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.MenuBarNaviagtions;
import dsp.automation.utilities.TestFunctionsFactory;

public class CommonSteps { 
	 

	@When("Login into DSP Portal$")
	
	public void login()  {
		try {
			TestFunctionsFactory.launchUrl(FileHandling.getProperty("Browser"), FileHandling.getProperty(TestRunner.RUNTIME_ENV));
			Login obj = PageFactory.initElements(TestFunctionsFactory.driver, Login.class);
			
			obj.isPageDisplayed();

			obj.enterDetails(FileHandling.getProperty("User_Name"),EcncryptorDecryptor.decryptor(FileHandling.getProperty("Password")) ); 

		} catch (Exception e) {

			if (CustomisedException.getErrorMessage() != null) {
				TestFunctionsFactory.takeSnapShot( "Login_page");
				Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
			} else {
				e.printStackTrace();
				TestFunctionsFactory.takeSnapShot( "Login_page"); 
				Assert.fail(e.getMessage().toString()); 
			}
		}

	}

	@When("Navigate to \"([^\"]*)\"$")
	public void menuBarNavigation(String menu) {
		try {
			MenuBarNaviagtions obj1 = PageFactory.initElements(TestFunctionsFactory.driver, MenuBarNaviagtions.class);
			obj1.menuNavigation(menu);
	
		} catch (Exception e) {

				TestFunctionsFactory.takeSnapShot( "MenuNavigation");
		
			Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
		}

	} 

	@When("The page \"([^\"]*)\" should be displayed")
	public void isPageDisplayed(String pageName) {
		try {

			switch (pageName.replaceAll(" ", "").trim().toUpperCase()) {

			case "ADMINISTRATORCONFIGURATION":
				AdministratorConfiguration adminObj = PageFactory.initElements(TestFunctionsFactory.driver,
						AdministratorConfiguration.class);
				adminObj.isPageDisplayed();
				break;
			case "ASSETPOPULATION":
				AssetPopulation assetObj = PageFactory.initElements(TestFunctionsFactory.driver, AssetPopulation.class);
				assetObj.isPageDisplayed();
				break;
			case "CATLEVELSERVICES":
				CatLevelServices catServObj = PageFactory.initElements(TestFunctionsFactory.driver,
						CatLevelServices.class);
				catServObj.isPageDisplayed();
				break;
			case "USERADMINISTRATION":
				UserAdministration userAdminObj = PageFactory.initElements(TestFunctionsFactory.driver,
						UserAdministration.class);
				userAdminObj.isPageDisplayed();
				break;
			case "MYWORKLIST":
				MyWorklist myWorklistObj = PageFactory.initElements(TestFunctionsFactory.driver, MyWorklist.class);
				myWorklistObj.isPageDisplayed();
				break;
			case "SOFTWAREUPDATELOG":
				SoftwareUpdateLog softUpdateObj = PageFactory.initElements(TestFunctionsFactory.driver,
						SoftwareUpdateLog.class);
				softUpdateObj.isPageDisplayed();
				break;
			case "TROUBLESHOOTLOG":
				TroubleShootLog troubleShootObj = PageFactory.initElements(TestFunctionsFactory.driver,
						TroubleShootLog.class);
				troubleShootObj.isPageDisplayed();
				break;
			case "MINESTAR":
				MineStar mineObj = PageFactory.initElements(TestFunctionsFactory.driver, MineStar.class);
				mineObj.isPageDisplayed();
				break;
			default:

				throw new CustomisedException(pageName, "is not a valid page in Applicaiton");

			}

		} catch (Exception e) {
			TestFunctionsFactory.takeSnapShot( pageName+"IsPageDisplayed");
			e.printStackTrace();
			Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
		}

	}

	@When("close browser")
	public void closeBrows() {  
		TestFunctionsFactory.closeBrowser();

	}
	@When("^change dealer code to \"([^\"]*)\"$")
	public void dealerCodeSearch(String dealerCode) {
		try{
		MenuBarNaviagtions menuObj=PageFactory.initElements(TestFunctionsFactory.driver, MenuBarNaviagtions.class);
		menuObj.dealerSearch(dealerCode);}
		catch (Exception e) {
			TestFunctionsFactory.takeSnapShot("DelaerCodeChange");
			Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
		}
	}
	@When("^DealerCode should be changed to \"([^\"]*)\"$")
	public void dealerCodeVerify(String dealerCode) {
		try{ 
		MenuBarNaviagtions menuObj=PageFactory.initElements(TestFunctionsFactory.driver, MenuBarNaviagtions.class);
		menuObj.delaerCodeVerification(dealerCode);;}
		catch (Exception e) {
			TestFunctionsFactory.takeSnapShot("DelaerCodeChange_Verification");
			Assert.fail(CustomisedException.getFieldValue() + " :" + CustomisedException.getErrorMessage());
		}
	}
}
