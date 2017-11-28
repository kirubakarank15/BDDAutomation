package stepDefenition;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import org.json.simple.parser.ParseException;
import org.testng.Assert;

import cucumber.api.java.en.Then;
import dsp.automation.subscriptions.API.CommonMethods;
import dsp.automation.subscriptions.API.CreateAllSubscription;
import dsp.automation.subscriptions.API.DeleteAllSubscription;
import dsp.automation.utilities.CustomisedException;


public class Asset_subscriptions_API 
{
	Properties properties = new Properties();
	CommonMethods CommonInstance = new CommonMethods();

	@Then("^Set CATLevelSubscription with startTime,endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_CATLevelSubscription_with_startTime_endTime(String parentId,String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String RequestLevel, String ExpectedResponse,String Inheritance) 
	{
		System.out.println("************************************* CREATING CAT LEVEL SUBSCRIPTIONS******************************************");
		try {
			CreateAllSubscription.SubscriptionCreate(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, RequestLevel,ExpectedResponse,Inheritance);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	    
	}

	@Then("^Delete CATLevelSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" endTime$")
	public void delete_CATLevelSubscription_with_endTime(String cancelReason, String level, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING CATLEVEL SUBSCRIPTIONS******************************************");

		try {
			DeleteAllSubscription.SubscriptionDelete(cancelReason,level, Inheritance,ExpectedDeleteResponse);
		} 
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	   
	}

	@Then("^Set CustInheritedSubscription with startTime,endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_CustInheritedSubscription_with_startTime_endTime(String parentId,String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String RequestLevel, String ExpectedResponse,String Inheritance) 
	{
		System.out.println("*************************************  CREATING CUSTOMER INHERITED SUBSCRIPTIONS******************************************");
		try {
			CreateAllSubscription.SubscriptionCreate(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, RequestLevel, ExpectedResponse,Inheritance);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}

	@Then("^Delete CustInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" endTime$")
	public void delete_CustInheritedSubscription_with_endTime(String cancelReason, String level, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING CUST INHERITED SUBSCRIPTIONS******************************************");

		try {
			DeleteAllSubscription.SubscriptionDelete(cancelReason, level, Inheritance,ExpectedDeleteResponse);
		} 

		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			// Assert.fail("Exception in deletion CustInheritedCATLevel Subscription:" +e.getExcpetionMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	    
	}

	@Then("^Set CustInheritedwithCATLevelSubscription with startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_CustInheritedwithCATLevelSubscription_with_startTime_endTime(String parentId,String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String RequestLevel, String ExpectedResponse,String Inheritance) 
	{
		
		System.out.println("************************************* CREATING CUSTINHERITEDWITHNONINHERITEDCATLEVEL SUBSCRIPTIONS******************************************");
		try {
			CreateAllSubscription.SubscriptionCreate(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, RequestLevel,ExpectedResponse,Inheritance);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	    
	}

	@Then("^Delete CustInheritedwithCATLevelSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" endTime$")
	public void delete_CustInheritedwithCATLevelSubscription_with_endTime(String cancelReason, String level, String Inheritance, String ExpectedDeleteResponse)
	{
		System.out.println("************************************* DELETING CUSTINHERITEDWITHNONINHERITEDCATLEVEL SUBSCRIPTIONS******************************************");
		try {
			DeleteAllSubscription.SubscriptionDelete(cancelReason, level, Inheritance,ExpectedDeleteResponse);
		} 
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	   
	}

	@Then("^Set DealerInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_DealerInheritedSubscription_with_startTime_endTime(String parentId,String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String RequestLevel, String ExpectedResponse,String Inheritance) 
	{

		System.out.println("************************************* CREATING DEALER LEVEL SUBSCRIPTIONS******************************************");
		try {
			CreateAllSubscription.SubscriptionCreate(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, RequestLevel,ExpectedResponse,Inheritance);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	    
	}

	@Then("^Delete DealerInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" endTime$")
	public void delete_DealerInheritedSubscription_with_endTime(String cancelReason, String level, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING DEALER INHERITED SUBSCRIPTIONS******************************************");

		try {
			DeleteAllSubscription.SubscriptionDelete(cancelReason, level, Inheritance,ExpectedDeleteResponse);
		} 
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
		  
	}

	@Then("^Set DealerInheritedwithCustSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_DealerInheritedwithCustSubscription_with_startTime_endTime(String parentId,String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String RequestLevel, String ExpectedResponse,String Inheritance) 
	{
		System.out.println("************************************* CREATING DEALERINHERITEDWITHNONINHERITEDCUST SUBSCRIPTIONS******************************************");
		try {
			CreateAllSubscription.SubscriptionCreate(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, RequestLevel,ExpectedResponse,Inheritance);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}

	    
	}

	@Then("^Delete DealerInheritedwithCustSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" endTime$")
	public void delete_DealerInheritedwithCustSubscription_with_endTime(String cancelReason, String level, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING DEALERINHERITEDWITHNONINHERITEDCUST SUBSCRIPTIONS******************************************");
		try {
			DeleteAllSubscription.SubscriptionDelete(cancelReason, level, Inheritance,ExpectedDeleteResponse);
		} 
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}

	@Then("^Set NonInheritedSubscription with startTime,endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_NonInheritedSubscription_with_startTime_endTime(String parentId,String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String RequestLevel, String ExpectedResponse,String Inheritance) 
	{
		System.out.println("************************************* CREATING NONINHERITEDALLLEVEL SUBSCRIPTIONS******************************************");
		try {
			CreateAllSubscription.SubscriptionCreate(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, RequestLevel,ExpectedResponse,Inheritance);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	   
	}

	@Then("^Delete NonInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" endTime$")
	public void delete_NonInheritedSubscription_with_endTime(String cancelReason, String level, String Inheritance, String ExpectedDeleteResponse)
	{
		System.out.println("************************************* DELETING NONINHERITED SUBSCRIPTIONS******************************************");

		try {
			DeleteAllSubscription.SubscriptionDelete(cancelReason, level, Inheritance,ExpectedDeleteResponse);
		} 
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}

	}
	

	@Then("^Retrieve the Values of Subscription_id \"([^\"]*)\",\"([^\"]*)\" in AssetSubscription Table$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_Table(String AssetId, String Sub_id) 
	{
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));

		} catch (IOException e1) {

			e1.printStackTrace();
		}
		
		String SubAssetID = AssetId;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		
		try {
			CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
		} catch (SQLException e)
		{
			Assert.fail("Invalid Query"+e.getMessage());

		}
		catch (CustomisedException e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			
			else
				Assert.fail(e.getMessage().toString());
		}

	}

	@Then("^Retrieve the Values of Subscription_id \"([^\"]*)\",\"([^\"]*)\" in AssetSubscriptionHistory Table$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table(String AssetId, String Sub_id) 
	{

		try {
			properties.load(new FileInputStream("Resources\\application.properties"));

		} catch (IOException e1) {

			e1.printStackTrace();
		}
		
		String SubAssetID = AssetId;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		
		try {
			CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
		} catch (SQLException e)
		{
			Assert.fail("Invalid Query"+e.getMessage());

		}
		catch (CustomisedException e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
		
			else
				Assert.fail(e.getMessage().toString());
		}

	}
}

	