package stepDefenition;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.json.JSONException;
import org.json.simple.parser.ParseException;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import dsp.automation.subscriptions.API.CATLevelSubscription;
import dsp.automation.subscriptions.API.CommonMethods;
import dsp.automation.subscriptions.API.CustInheritedSubscriptions;
import dsp.automation.subscriptions.API.DeleteCATSubscriptions;
import dsp.automation.subscriptions.API.DeleteCustInheritedSubscriptions;
import dsp.automation.subscriptions.API.DeleteDealerInheritedSubscriptions;
import dsp.automation.subscriptions.API.DealerInheritedScubscriptions;
import dsp.automation.utilities.DBconnection_API;
import junit.framework.Assert;

public class Asset_subscriptions_API 
{
	Properties properties = new Properties();
	CommonMethods CommonInstance = new CommonMethods();
	//DSPSqlconnection DBinstance = new DSPSqlconnection();
	CustInheritedSubscriptions CustInheritSub = new CustInheritedSubscriptions();
	DealerInheritedScubscriptions DealerInheritSub = new DealerInheritedScubscriptions();
	CATLevelSubscription CATLevelSub = new CATLevelSubscription();
	
	static String AssetSerialNumber;
	static String AssetID;
	static String APIresponse;

	/*@Given("^construct OAuth and post AssetStructure request API with parameters \"([^\"]*)\"$")
	public void construct_OAuth_and_post_AssetStructure_request_API_with_parameters(String Commercialtype) throws NullPointerException, IOException, JSONException  
	{


		CommonInstance.assetOnboardTemplate(Commercialtype);


	}

	@Then("^Retrive for Successful API Response and \"([^\"]*)\" of the PostAssetStructure request API$")
	public void retrive_for_Successful_API_Response_and_of_the_PostAssetStructure_request_API(int HttpStatus) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		HttpPost request;
		HttpResponse APIresponse;

		request = CommonInstance.addingheaderstourl();
		APIresponse = CommonInstance.apiexecutuion(request);
		int Statuscode = APIresponse.getStatusLine().getStatusCode();
		if (HttpStatus == Statuscode)
		{
			System.out.println("API Response code is 201");
		}
		else
		{
			System.out.println("API is not working");
		}

		//return null;
	}


	@Given("^Connection set for DB to access AssetStructureMessage, Asset, Radio, Device, AssetSubscription and AssetSubscriptionHistory Table$")
	public void connection_set_for_DB_to_access_AssetStructureMessage_Asset_Radio_Device_AssetSubscription_and_AssetSubscriptionHistory_Table() 
	{
		System.out.println("Connecting to Database......" +"\n");


	}


	@Then("^Retrive AssetStructureVerbose with serialNumber for the Onboarded Asset and retrieve AssetStructureVerbose content$")
	public void retrive_AssetStructureVerbose_with_serialNumber_for_the_Onboarded_Asset_and_retrieve_AssetStructureVerbose_content() throws FileNotFoundException, SQLException, IOException, ParseException, InterruptedException 
	{


		AssetSerialNumber = CommonMethods.AssetSno;
		System.out.println("asn :" +AssetSerialNumber);
		properties.load(new FileInputStream("C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\dspdatabase.properties"));
		String AssetVerboseQuery = properties.getProperty("DSP.AssetStructureVerbose").replace("DUMMYXYZ", AssetSerialNumber);
		System.out.println("AssetVerboseQuery:" +AssetVerboseQuery);
		DSPSqlconnection dbcheck = new DSPSqlconnection();
		Thread.sleep(90000);

		//dbcheck.getassetDetails(AssetVerboseQuery);
		//assertEquals(DBinstance.SkippedQuery("STATUS", AssetVerboseQuery).toUpperCase(), "SKIPPED");

		if(DBinstance.SkippedQuery("STATUS", AssetVerboseQuery).equalsIgnoreCase("SKIPPED"))
		{
			Assert.fail("VerboseStatus Skipped");
		}

	}

	@Then("^Retrive the values of EngineSerialNumber ,Device_Type,IS_Telematic_Registered,Serial_Number, device_Id, Asset_ID in Asset Table with serialNumber$")
	public void retrive_the_values_of_EngineSerialNumber_Device_Type_IS_Telematic_Registered_Serial_Number_device_Id_Asset_ID_in_Asset_Table_with_serialNumber() throws IOException, SQLException, ParseException 
	{
		AssetSerialNumber = CommonMethods.AssetSno;
		System.out.println("AssetSerialNumber :" +AssetSerialNumber);
		properties.load(new FileInputStream("C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\dspdatabase.properties"));
		String AssetTableQuery = properties.getProperty("DSP.AssetTable").replace("DUMMYXYZ", AssetSerialNumber);
		System.out.println("AssetTableQuery:" +AssetTableQuery);
		DSPSqlconnection dbcheck = new DSPSqlconnection();
		AssetID =dbcheck.SkippedQuery("ASSET_ID", AssetTableQuery);
		TreeMap<String, List<String>> AssetValues = new TreeMap<>(dbcheck.getassetDetails(AssetTableQuery));
		AssetValues.get("ASSET_ID");
		System.out.println("check AssetId :" +AssetValues.get("ASSET_ID"));
		System.out.println("Asset Id :" +AssetID);

	}

	@Then("^Retrive the values of Radio_Serial_number in Radio for onboarded Asset$")
	public void retrive_the_values_of_Radio_Serial_number_in_Radio_for_onboarded_Asset() throws FileNotFoundException, IOException, SQLException 
	{
		String RadioAssetId = AssetID;
		System.out.println("RadioAssetid :" +RadioAssetId);
		properties.load(new FileInputStream("C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\dspdatabase.properties"));
		String RadioTableQuery = properties.getProperty("DSP.Radio").replace("DUMMYXYZ", RadioAssetId);
		System.out.println("RadioTableQuery:" +RadioTableQuery);
		DSPSqlconnection dbcheck = new DSPSqlconnection();
		dbcheck.SkippedQuery("ASSET_ID", RadioTableQuery);

	}

	@Then("^Retrive the values of Device_Id ,Commercial_type in Device Table for for onboarded Asset$")
	public void retrive_the_values_of_Device_Id_Commercial_type_in_Device_Table_for_for_onboarded_Asset() throws SQLException, FileNotFoundException, IOException 
	{

		String DeviceAssetId = AssetID;
		System.out.println("RadioAssetid :" +DeviceAssetId);
		properties.load(new FileInputStream("C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\dspdatabase.properties"));
		String DeviceTableQuery = properties.getProperty("DSP.Device").replace("DUMMYXYZ", DeviceAssetId);
		System.out.println("RadioTableQuery:" +DeviceTableQuery);
		DSPSqlconnection dbcheck = new DSPSqlconnection();
		dbcheck.SkippedQuery("ASSET_ID", DeviceTableQuery);

	}

	@Then("^Retrive the values of Subscription_id in AssetSubscriptionHistory Table for for onboarded Asset$")
	public void retrive_the_values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_for_onboarded_Asset() throws FileNotFoundException, IOException, SQLException 
	{
		String SubscriptionHistoryAssetId = AssetID;
		System.out.println("SubscriptionHistoryAssetid :" +SubscriptionHistoryAssetId);
		properties.load(new FileInputStream("C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\dspdatabase.properties"));
		String HistoryTableQuery = properties.getProperty("DSP.AssetSubscriptionHistory").replace("DUMMYXYZ", SubscriptionHistoryAssetId);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		DSPSqlconnection dbcheck = new DSPSqlconnection();
		dbcheck.SkippedQuery("ASSET_ID", HistoryTableQuery);
	}

	@Then("^Retrive the values of Subscription_id in AssetSubscription Table for for onboarded Asset$")
	public void retrive_the_values_of_Subscription_id_in_AssetSubscription_Table_for_for_onboarded_Asset() throws FileNotFoundException, IOException, SQLException
	{
		String SubscriptionAssetId = AssetID;
		System.out.println("SubscriptionHistoryAssetid :" +SubscriptionAssetId);
		properties.load(new FileInputStream("C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\dspdatabase.properties"));
		String SubscritpionTableQuery = properties.getProperty("DSP.AssetSubscription").replace("DUMMYXYZ", SubscriptionAssetId);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		DSPSqlconnection dbcheck = new DSPSqlconnection();
		dbcheck.SkippedQuery("ASSET_ID", SubscritpionTableQuery);

	}*/

	@Then("^Set the Subscription for Customer Level with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\" and retrive the ParentID$")
	public void set_the_Subscription_for_Customer_Level_with_serialNumber_startTime_endTime_and_retrive_the_ParentID(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, IOException, JSONException, ParseException 
	{
		System.out.println("*************************************  CREATING CUSTOMER INHERITED SUBSCRIPTIONS******************************************");
		CustInheritSub.CustInheritedCustLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);

	}

	@Then("^Set the Subscription for Dealer Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime$")
	public void set_the_Subscription_for_Dealer_Level_with_serialNumber_parentId_startTime_endTime(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{

		CustInheritSub.CustInheritedDealerLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);


	}

	@Then("^Set the Subscription for CAT Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",startTime,endTime$")
	public void set_the_Subscription_for_CAT_Level_with_serialNumber_parentId_startTime_endTime(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		CustInheritSub.CustInheritedCATLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
	}
	
		
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CustInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CustInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		properties.load(new FileInputStream("Resources\\application.properties"));
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
	//	CommonInstance.getassetDetails(SubscritpionTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);

	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CustInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CustInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
		properties.load(new FileInputStream("Resources\\application.properties"));
		String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
		//CommonInstance.getassetDetails(HistoryTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
	}
	
	
	/*public void delete_the_Subscription_for_Customer_Level_with_endTime_without_deleting_the_ChildLevel_Subscription_and_Validate_the_ErrorMsg(String cancelReason) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		System.out.println("************************************* DELETING SUBSCRIPTIONS******************************************");
		DSPDeleteSubscriptions.Delsubscriptions(cancelReason);

	}*/


	@Then("^Delete the Subscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")		
	public void delete_the_Subscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{

		System.out.println("************************************* DELETING CUST INHERITED SUBSCRIPTIONS******************************************");
		DeleteCustInheritedSubscriptions.DelCustInheritedsubscriptions(cancelReason,level);
	}

	@Then("^Delete the Subscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_the_Subscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		
		DeleteCustInheritedSubscriptions.DelCustInheritedsubscriptions(cancelReason,level);
	}

	@Then("^Delete the Subscription for Customer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_the_Subscription_for_Customer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		DeleteCustInheritedSubscriptions.DelCustInheritedsubscriptions(cancelReason,level);
	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCustInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledCustInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		properties.load(new FileInputStream("Resources\\application.properties"));
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
		//CommonInstance.getassetDetails(SubscritpionTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);

	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCustInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledCustInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
		properties.load(new FileInputStream("Resources\\application.properties"));
		String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
		//CommonInstance.getassetDetails(HistoryTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);

	}
	
	
	@Then("^Set the Subscription for Dealer Level with serialNumber,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime for DealerInheritedSubscriptions$")
	public void set_the_Subscription_for_Dealer_Level_with_serialNumber_startTime_endTime_for_DealerInheritedSubscriptions(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException
	{
		System.out.println("************************************* CREATING DEALER LEVEL SUBSCRIPTIONS******************************************");
		DealerInheritSub.DealerInheritedDealerLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);

	}

	@Then("^Set the Subscription for CAT Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",startTime,endTime for DealerInheritedSubscriptions$")
	public void set_the_Subscription_for_CAT_Level_with_serialNumber_parentId_startTime_endTime_for_DealerInheritedSubscriptions(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		DealerInheritSub.DealerInheritedCATLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
 
	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for DealerInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_DealerInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{

		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
	//	CommonInstance.getassetDetails(SubscritpionTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
		

	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for DealerInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_DealerInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException
	{
		
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
	//	CommonInstance.getassetDetails(HistoryTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
		
	   
	}

	@Then("^Delete the Subscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg for DealerInherited Subscription$")
	public void delete_the_Subscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg_for_DealerInherited_Subscription(String cancelReason, String level) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		System.out.println("************************************* DELETING DEALER INHERITED SUBSCRIPTIONS******************************************");
		DeleteDealerInheritedSubscriptions.DelDealerInheritedsubscriptions(cancelReason, level);
	}

	@Then("^Delete the Subscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg for DealerInherited Subscription$")
	public void delete_the_Subscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg_for_DealerInherited_Subscription(String cancelReason, String level) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		DeleteDealerInheritedSubscriptions.DelDealerInheritedsubscriptions(cancelReason, level);

	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledDealerInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledDealerInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
	//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		//CommonInstance.getassetDetails(SubscritpionTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
		

	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledDealerInheritedSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledDealerInheritedSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
	//	CommonInstance.getassetDetails(HistoryTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			    
	}

	@Then("^Set the Subscription for CATLevel with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\" and retrive the ParentID$")
	public void set_the_Subscription_for_CATLevel_with_serialNumber_startTime_endTime_and_retrive_the_ParentID(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		System.out.println("************************************* CREATING CAT LEVEL SUBSCRIPTIONS******************************************");
		CATLevelSub.CATLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CATLevelSubscription() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
		//CommonInstance.getassetDetails(SubscritpionTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
		
	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CATLevelSubscription() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
		
		properties.load(new FileInputStream("Resources\\application.properties"));
		String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
	//	DSPSqlconnection dbcheck = new DSPSqlconnection();
	//	CommonInstance.getassetDetails(HistoryTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
		
	}

	@Then("^Delete the  CATLevel Subscription with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_the_CATLevel_Subscription_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		System.out.println("************************************* DELETING CATLEVEL SUBSCRIPTIONS******************************************");
		DeleteCATSubscriptions.DelCATLevelsubscriptions(cancelReason, level);
	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCATLevelSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledCATLevelSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionAssetid :" +SubAssetID);
	
		properties.load(new FileInputStream("Resources\\application.properties"));
		String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
	//	DSPSqlconnection dbcheck = new DSPSqlconnection();
	// CommonInstance.getassetDetails(SubscritpionTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
		
	}

	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCATLevelSubscriptions$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledCATLevelSubscriptions() throws FileNotFoundException, IOException, SQLException 
	{
		String SubAssetID = Asset_structure_API.Asset_id;
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
	
		properties.load(new FileInputStream("Resources\\application.properties"));
		String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
		System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//DSPSqlconnection dbcheck = new DSPSqlconnection();
	 //	CommonInstance.getassetDetails(HistoryTableQuery);
		CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			    
	}
		
}
