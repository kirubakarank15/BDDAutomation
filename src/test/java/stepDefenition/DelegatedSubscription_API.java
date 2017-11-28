package stepDefenition;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import org.testng.Assert;
import cucumber.api.java.en.Then;
import dsp.automation.subscriptions.API.CreateAllDelegationSubscriptions;
import dsp.automation.subscriptions.API.DeleteAllDelegatedSubscriptions;
import dsp.automation.subscriptions.API.CommonMethods;
import dsp.automation.utilities.CustomisedException;


public class DelegatedSubscription_API 
{

	Properties properties = new Properties();
	CommonMethods CommonInstance = new CommonMethods();

	CreateAllDelegationSubscriptions CreateDelegated = new CreateAllDelegationSubscriptions();
	DeleteAllDelegatedSubscriptions DeleteDelegated = new DeleteAllDelegatedSubscriptions();


	@SuppressWarnings("static-access")
	//@Then("^Set Delegation for CATLevelSubscription from CAT to CUST with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	@Then("^Set Delegation for CATLevelSubscription from CAT to AllLevels with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Delegation_for_CATLevelSubscription_from_CAT_to_AllLevels_with_startTime_endTime(String parentId, String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedResponse) 
	{
		System.out.println("*************************************  CREATING CATLEVEL DELEGATED SUBSCRIPTIONS******************************************");
		try {
			CreateDelegated.CreateDelegatedSubscription(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, DelegatedFrom, DelegatedTo, Inheritance, ExpectedResponse);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}

	}
	
	@SuppressWarnings("static-access")
	@Then("^Delete CATLevelSubscription and Delegations for CATLevelSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"endTime$")
	public void delete_CATLevelSubscription_and_Delegations_for_CATLevelSubscription_with_endTime(String cancelReason, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING CATLEVEL AND DELEGATED SUBSCRIPTIONS******************************************");
		try
		{
			DeleteDelegated.DelegatedSubcriptionDelete(cancelReason, DelegatedFrom, DelegatedTo, Inheritance,ExpectedDeleteResponse);
		}
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}

	@Then("^Validate no record exists in DB for CAT Delegation$")
	public void validate_no_record_exists_in_DB_for_CAT_Delegation(String AssetId, String Sub_id) 
	{
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
		}
		catch (IOException e1) 
		{
			e1.printStackTrace();
		}

		String SubAssetID = AssetId;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);

		String HistoryTableQuery = properties.getProperty("db.DelegatedToCAT").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);

		try {
			CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
		}
		catch (SQLException e)
		{
			Assert.fail("Invalid Query"+e.getMessage());

		}
		catch (Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null)){
				Assert.fail("Query for CATLevel to CAT have no or Null value in DB :"+CustomisedException.getFieldValue()+CustomisedException.getErrorMessage());
			}
			else{
				Assert.fail(e.getMessage().toString());

			}

		}

	}
	@SuppressWarnings("static-access")
	@Then("^Set Delegation for CustInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Delegation_for_CustInheritedSubscription_from_Customer_Dealer_and_CAT_to_Customer_Dealer_CAT_CustUser_and_DealerUser_Levels_with_startTime_endTime(String parentId, String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedResponse) 
	{
		System.out.println("*************************************  CREATING CUSTINHERITED AND DELEGATED SUBSCRIPTIONS******************************************");
		try {
			CreateDelegated.CreateDelegatedSubscription(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, DelegatedFrom, DelegatedTo, Inheritance, ExpectedResponse);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}

	   
	}


	@SuppressWarnings("static-access")
	@Then("^Delete CustInheritedSubscription and Delegations for CustInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"endTime$")
	public void delete_CustInheritedSubscription_and_Delegations_for_CustInheritedSubscription_with_endTime(String cancelReason, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING CUSTINHERITED AND DELEGATED SUBSCRIPTIONS******************************************");
		try
		{
			DeleteDelegated.DelegatedSubcriptionDelete(cancelReason, DelegatedFrom, DelegatedTo, Inheritance,ExpectedDeleteResponse);
		}
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}
   
	@SuppressWarnings("static-access")
	@Then("^Set Delegation for DealerInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Delegation_for_DealerInheritedSubscription_from_Customer_Dealer_and_CAT_to_Customer_Dealer_CAT_CustUser_and_DealerUser_Levels_with_startTime_endTime(String parentId, String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedResponse) 
	{
		System.out.println("*************************************  CREATING DEALER INHERITED AND DELEGATED SUBSCRIPTIONS******************************************");
		try {
			CreateDelegated.CreateDelegatedSubscription(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, DelegatedFrom, DelegatedTo, Inheritance, ExpectedResponse);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}

	    
	}

	@SuppressWarnings("static-access")
	@Then("^Delete DealerInheritedSubscription and Delegations for DealerInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"endTime$")
	public void delete_DealerInheritedSubscription_and_Delegations_for_DealerInheritedSubscription_with_endTime(String cancelReason, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedDeleteResponse)
	{
		System.out.println("************************************* DELETING DEALERINHERITED AND DELEGATED SUBSCRIPTIONS******************************************");
		try
		{
			DeleteDelegated.DelegatedSubcriptionDelete(cancelReason, DelegatedFrom, DelegatedTo, Inheritance,ExpectedDeleteResponse);
		}
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	    
	}
   
	@SuppressWarnings("static-access")
	@Then("^Set Delegation for CustInheritedWithCatSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Delegation_for_CustInheritedWithCatSubscription_from_Customer_Dealer_and_CAT_to_Customer_Dealer_CAT_CustUser_and_DealerUser_Levels_with_startTime_endTime(String parentId, String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedResponse) 
	{
		System.out.println("*************************************  CREATING CUSTINHERITEDWITHCATSUBSCRIPTIONS AND DELEGATED SUBSCRIPTIONS******************************************");
		try {
			CreateDelegated.CreateDelegatedSubscription(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, DelegatedFrom, DelegatedTo, Inheritance, ExpectedResponse);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	    
	}

	@SuppressWarnings("static-access")
	@Then("^Delete CustInheritedWithCatSubscription and Delegations for CustInheritedWithCatSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"endTime$")
	public void delete_CustInheritedWithCatSubscription_and_Delegations_for_CustInheritedWithCatSubscription_with_endTime(String cancelReason, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedDeleteResponse)
	{
		System.out.println("************************************* DELETING CUSTINHERITEDWITHCATSUBSCRIPTIONS AND DELEGATED SUBSCRIPTIONS******************************************");
		try
		{
			DeleteDelegated.DelegatedSubcriptionDelete(cancelReason, DelegatedFrom, DelegatedTo, Inheritance,ExpectedDeleteResponse);
		}
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}
	@SuppressWarnings("static-access")
	@Then("^Set Delegation for DealerInheritedWithCustSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Delegation_for_DealerInheritedWithCustSubscription_from_Customer_Dealer_and_CAT_to_Customer_Dealer_CAT_CustUser_and_DealerUser_Levels_with_startTime_endTime(String parentId, String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedResponse) 
	{
		System.out.println("*************************************  CREATING DEALERINHERITEDWITHCUSTSUBSCRIPTIONS AND DELEGATED SUBSCRIPTIONS******************************************");
		try {
			CreateDelegated.CreateDelegatedSubscription(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, DelegatedFrom, DelegatedTo, Inheritance, ExpectedResponse);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}

	@SuppressWarnings("static-access")
	@Then("^Delete DealerInheritedWithCustSubscription and Delegations for DealerInheritedWithCustSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"endTime$")
	public void delete_DealerInheritedWithCustSubscription_and_Delegations_for_DealerInheritedWithCustSubscription_with_endTime(String cancelReason, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedDeleteResponse)
	{
		System.out.println("************************************* DELETING DEALERINHERITEDWITHCUSTSUBSCRIPTIONS AND DELEGATED SUBSCRIPTIONS******************************************");
		try
		{
			DeleteDelegated.DelegatedSubcriptionDelete(cancelReason, DelegatedFrom, DelegatedTo, Inheritance,ExpectedDeleteResponse);
		}
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}
	
	@SuppressWarnings("static-access")
	@Then("^Set Delegation for NonInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_Delegation_for_NonInheritedSubscription_from_Customer_Dealer_and_CAT_to_Customer_Dealer_CAT_CustUser_and_DealerUser_Levels_with_startTime_endTime(String parentId, String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedResponse)
	{
		System.out.println("*************************************  CREATING NONINHERITEDSUBSCRIPTIONS AND DELEGATED SUBSCRIPTIONS******************************************");
		try {
			CreateDelegated.CreateDelegatedSubscription(parentId, make, serialNumber, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId, DelegatedFrom, DelegatedTo, Inheritance, ExpectedResponse);

		} catch (Exception e) 
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}

	@SuppressWarnings("static-access")
	@Then("^Delete NonInheritedSubscription and Delegations for NonInheritedSubscription with \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"endTime$")
	public void delete_NonInheritedSubscription_and_Delegations_for_NonInheritedSubscription_with_endTime(String cancelReason, String DelegatedFrom, String DelegatedTo, String Inheritance, String ExpectedDeleteResponse) 
	{
		System.out.println("************************************* DELETING NONINHERITEDSUBSCRIPTIONS AND DELEGATED SUBSCRIPTIONS******************************************");
		try
		{
			DeleteDelegated.DelegatedSubcriptionDelete(cancelReason, DelegatedFrom, DelegatedTo, Inheritance,ExpectedDeleteResponse);
		}
		catch(Exception e)
		{
			if(!CustomisedException.getFieldValue().equals(null))
				Assert.fail(CustomisedException.getFieldValue() +":" +CustomisedException.getErrorMessage());
			else
				Assert.fail(e.getMessage().toString());
		}
	}
}	
	