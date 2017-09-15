package stepDefenition;

import static org.testng.Assert.assertEquals;

import java.io.FileInputStream;
import java.util.Properties;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;

import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import dsp.automation.AssetStructures.API.Common_methods;
import junit.framework.Assert;


public class Asset_structure_API {
	Common_methods reusemethods = new Common_methods(); 
	Properties properties = new Properties();
	static String AssetSno;
	static String Asset_id;
	static String Subscription_ID;
	
	@Given("^Construct OAuth key and Random generated Attributes for PostAssetStructure Template$")
	public void construct_OAuth_() throws Throwable {
		
		System.out.println("Execution starts from here");
	   }

	@When("^Construct Post AssetStructure request API with \"([^\"]*)\"$")
	public void construct_Post_AssetStructure_request_API_with(String commercialType) throws Throwable {
	
		
		reusemethods.AssetTemplate(commercialType);
		AssetSno=Common_methods.SerialNumber;
		System.out.println("AssetSerialNumber:" +AssetSno);
		
	}

	@Then("^Validate Successful API Response and \"([^\"]*)\" of the Post AssetStructure request API$")
	public int validate_Successful_API_Response_and_of_the_Post_AssetStructure_request_API(int APIResponsecode) throws Throwable {
		
		
		HttpPost request = reusemethods.addingheaderstourl();
		HttpResponse httpResponse = reusemethods.apiexecutuion(request);
		int statusCode = httpResponse.getStatusLine().getStatusCode();
		System.out.println("StatusCode of the API:" +statusCode);
		assertEquals(statusCode,APIResponsecode);
		/*if(statusCode == APIResponsecode)
		{
			System.out.println("API Response code is 201");
			
		}
		
		else
		{
			System.out.println("API is not working");
		}*/
		return statusCode;
	} 
	

	@Given("^Connection set for DB to access AssetStructureMessage Table$")
	public void connection_set_for_DB_to_access_AssetStructureMessage_Table() throws Throwable {
		System.out.println("-------Connection to DB------------");
	}

	@Then("^Retrieve assetStructureVerbose with SerialNumber for the newly Onboarded Asset$")
	public void retrieve_assetStructureVerbose_with_SerialNumber_for_the_newly_Onboarded_Asset() throws Throwable {
        
		properties.load(new FileInputStream("Resources\\application.properties"));
		//AssetSno=reusemethods.SerialNumber;
		String query = properties.getProperty("db.assetstructuremessage").replace("DUMMYXYZ", AssetSno);
		System.out.println("AssetStructure query:" +query);
		Thread.sleep(60000);
		
		//reusemethods.getassetDetails(query);
       //assertEquals(reusemethods.dbValue("STATUS", query).toUpperCase(), "SKIPPED");
		
		if(reusemethods.dbValue("STATUS", query).equalsIgnoreCase("SKIPPED")){
			Assert.fail("Status of Assetstructure Message is SKIPPED");	
		}
		
	}

	@Given("^Connection set for DB to access Asset Table$")
	public void connection_set_for_DB_to_access_Asset_Table() throws Throwable {
		System.out.println("--------Asset Table-----------");
	}

	@Then("^Retrieve the values of EngineSerialNumber ,Device_Type,IS_Telematic_Registered,Serial_Number, device_Id, Asset_ID in Asset Table for the newly Onboarded Asset$")
	public void retrieve_the_values_of_EngineSerialNumber_Device_Type_IS_Telematic_Registered_Serial_Number_device_Id_Asset_ID_in_Asset_Table_for_the_newly_Onboarded_Asset() throws Throwable {
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		
		String query = properties.getProperty("db.AssetTable").replace("DUMMYXYZ", AssetSno);
		System.out.println("Asset Table Query:" +query);
		Asset_id = reusemethods.dbValue("ASSET_ID", query);
		//assertEquals(Asset_id, "");
		System.out.println("AssetID:" +Asset_id);
	
	}
	
	@Given("^Connection set for DB to access Radio, Device, SubsciptionHistory and AssetSubscription Tables$")
	public void connection_set_for_DB_to_access_Radio_Device_SubsciptionHistory_and_AssetSubscription_Tables() throws Throwable {
	    System.out.println("-----------Radio, Device, SubsciptionHistory and AssetSubscription Tables---------");
	}
	
	@Then("^Retrieve the values of Radio details in Radio Table for onboarded asset$")
	public void retrieve_the_values_of_Radio_details_in_Radio_Table_for_onboarded_asset() throws Throwable {
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String query = properties.getProperty("db.Radio").replace("DUMMYXYZ", Asset_id);
		System.out.println("Asset Table Query:" +query);
		
		reusemethods.getassetDetails(query);
	}

	@Then("^Retrieve the values of Device_Id ,Commercial_type in Device Table for onboarded asset$")
	public void retrieve_the_values_of_Device_Id_Commercial_type_in_Device_Table_for_onboarded_asset() throws Throwable {
		properties.load(new FileInputStream("Resources\\application.properties"));
	   String query = properties.getProperty("db.Device").replace("DUMMYXYZ", Asset_id);
	   System.out.println("Device Table Query:" +query);
	   reusemethods.getassetDetails(query);
	}

	@Then("^Retrieve the values of Subscription_id in AssetSubscriptionHistory Table for onboarded asset$")
	public void retrieve_the_values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_onboarded_asset() throws Throwable {
		properties.load(new FileInputStream("Resources\\application.properties"));
		String query = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", Asset_id);
	    System.out.println("AssetSubscriptionHistory Query:" +query);
	    reusemethods.getassetDetails(query);
	}

	@Then("^Retrieve the values of Subscription_id in AssetSubscription Table for onboarded asset$")
	public void retrieve_the_values_of_Subscription_id_in_AssetSubscription_Table_for_onboarded_asset() throws Throwable {
		properties.load(new FileInputStream("Resources\\application.properties"));
		String query = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", Asset_id);
	    System.out.println("AssetSubscription Query:" +query);
	    //reusemethods.getassetDetails(query);
	    Subscription_ID = reusemethods.dbValue("SUBSCRIPTION_ID", query);
	    System.out.println("Subscription_id:" +Subscription_ID);
	   }
	
	@And("^Verify the Subscription_id is \"([^\"]*)\"$")
	public void verify_the_Subscription_id(int Sub_ID)
	{
		assertEquals(Sub_ID, Subscription_ID);
	}
	
	
	
	
}
