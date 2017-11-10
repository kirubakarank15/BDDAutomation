package stepDefenition;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import org.json.simple.parser.ParseException;

import cucumber.api.java.en.Then;
import dsp.automation.subscriptions.API.CATLevelSubscription;
import dsp.automation.subscriptions.API.CommonMethods;
import dsp.automation.subscriptions.API.CustInheritedSubscriptions;
import dsp.automation.subscriptions.API.CustInheritedwithCATLevelSubscription;
import dsp.automation.subscriptions.API.CustInheritedwithCATLevelSubscriptionDelete;
import dsp.automation.subscriptions.API.DealerInheritedSubscriptions;
import dsp.automation.subscriptions.API.DealerInheritedwithCustomerSubscription;
import dsp.automation.subscriptions.API.DealerInheritedwithCustomerSubscriptionDelete;
import dsp.automation.subscriptions.API.DeleteCATSubscriptions;
import dsp.automation.subscriptions.API.DeleteCustInheritedSubscriptions;
import dsp.automation.subscriptions.API.DeleteDealerInheritedSubscriptions;
import dsp.automation.subscriptions.API.DeleteNonInheritedSubscriptions;
import dsp.automation.subscriptions.API.NonInheritedSubscriptions;
import junit.framework.Assert;

public class Asset_subscriptions_API 
{
	Properties properties = new Properties();
	CommonMethods CommonInstance = new CommonMethods();
	//DSPSqlconnection DBinstance = new DSPSqlconnection();
	CustInheritedSubscriptions CustInheritSub = new CustInheritedSubscriptions();
	DealerInheritedSubscriptions DealerInheritSub = new DealerInheritedSubscriptions();
	CATLevelSubscription CATLevelSub = new CATLevelSubscription();
	NonInheritedSubscriptions NonInheritedSub = new NonInheritedSubscriptions();
	DealerInheritedwithCustomerSubscription DealerInheritedwithCust = new DealerInheritedwithCustomerSubscription();
	CustInheritedwithCATLevelSubscription CustInheritedwithCAT = new CustInheritedwithCATLevelSubscription();
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
	
	@SuppressWarnings("deprecation")
	@Then("^Set CustInheritedSubscription for Customer Level with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\" and retrive the ParentID$")
	public void set_CustInheritedSubscription_for_Customer_Level_with_serialNumber_startTime_endTime_and_retrive_the_ParentID(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception, ParseException
	{
		System.out.println("*************************************  CREATING CUSTOMER INHERITED SUBSCRIPTIONS******************************************");
		//CustInheritSub.CustInheritedCustLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		try{
			CustInheritedSubscriptions.CustInheritedCustLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}
		catch(Exception e){
			 Assert.fail("Exception in CustInheritedCustLevel Subscription:" +e.getMessage().toString());
		}
	   
	}

	@SuppressWarnings("deprecation")
	@Then("^Set CustInheritedSubscription for Dealer Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime$")
	public void set_CustInheritedSubscription_for_Dealer_Level_with_serialNumber_parentId_startTime_endTime(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		//CustInheritSub.CustInheritedDealerLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		try{
			CustInheritedSubscriptions.CustInheritedDealerLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}
		catch(Exception e){
			 Assert.fail("Exception in CustInheritedDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Set CustInheritedSubscription for CAT Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",startTime,endTime$")
	public void set_CustInheritedSubscription_for_CAT_Level_with_serialNumber_parentId_startTime_endTime(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		//CustInheritSub.CustInheritedCATLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		try{
		CustInheritedSubscriptions.CustInheritedCATLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}
		catch(Exception e){
			 Assert.fail("Exception in CustInheritedCATLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CustInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CustInheritedSubscription()  
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
			try {
				properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		    	System.out.println("SubscriptionAssetid :" +SubAssetID);
				String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
				System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
				//DSPSqlconnection dbcheck = new DSPSqlconnection();
			  //CommonInstance.getassetDetails(SubscritpionTableQuery);
				try {
					CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
				} catch (SQLException e) {
					Assert.fail("Invalid Query"+e.getMessage());
					/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
							ExceptionMessage.SQLEXCEPTION.getCode());*/
				}
			
			} catch (IOException e) {
				Assert.fail("Exception in file handling"+e.getMessage());
				/*throw new Exception(ExceptionMessage.IOException.getDescription(),
						ExceptionMessage.IOException.getCode());*/
			}
			
	
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CustInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CustInheritedSubscription() 
	{
	//	properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
	    	System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			try {
				//DSPSqlconnection dbcheck = new DSPSqlconnection();
				//CommonInstance.getassetDetails(HistoryTableQuery);
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
			} catch (IOException e) {
				Assert.fail("Exception in file handling"+e.getMessage());
			/*e.printStackTrace();
			throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
		
	}
	
	/*public void delete_the_Subscription_for_Customer_Level_with_endTime_without_deleting_the_ChildLevel_Subscription_and_Validate_the_ErrorMsg(String cancelReason) throws FileNotFoundException, NullPointerException, IOException, JSONException 
	{
		System.out.println("************************************* DELETING SUBSCRIPTIONS******************************************");
		DSPDeleteSubscriptions.Delsubscriptions(cancelReason);

	}*/
	
	
	@SuppressWarnings("deprecation")
	@Then("^Delete CustInheritedSubscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CustInheritedSubscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		System.out.println("************************************* DELETING CUST INHERITED SUBSCRIPTIONS******************************************");
		try{
			DeleteCustInheritedSubscriptions.DelCustInheritedsubscriptions(cancelReason,level);
		}catch(Exception e){
			 Assert.fail("Exception in deletion CustInheritedCATLevel Subscription:" +e.getMessage().toString());
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete CustInheritedSubscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CustInheritedSubscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		
		try{
			DeleteCustInheritedSubscriptions.DelCustInheritedsubscriptions(cancelReason,level);
		}catch(Exception e){
			 Assert.fail("Exception in CustInheritedDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete CustInheritedSubscription for Customer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CustInheritedSubscription_for_Customer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level)  throws IOException, Exception
	{
		try{
			DeleteCustInheritedSubscriptions.DelCustInheritedsubscriptions(cancelReason,level);
		}
		catch(Exception e){
			 Assert.fail("Exception in CustInheritedcustLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCustInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledCustInheritedSubscription() 
	{
	//	properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
	     	System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
			//CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCustInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledCustInheritedSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		    System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
			//CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	
	}

	@SuppressWarnings("deprecation")
	@Then("^Set DealerInheritedSubscription for Dealer Level with serialNumber,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime for DealerInheritedSubscriptions$")
	public void set_DealerInheritedSubscription_for_Dealer_Level_with_serialNumber_startTime_endTime_for_DealerInheritedSubscriptions(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		System.out.println("************************************* CREATING DEALER LEVEL SUBSCRIPTIONS******************************************");
		//DealerInheritSub.DealerInheritedDealerLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		try{
			DealerInheritedSubscriptions.DealerInheritedDealerLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in DealerInheritedDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@Then("^Set DealerInheritedSubscription for CAT Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",startTime,endTime for DealerInheritedSubscriptions$")
	public void set_DealerInheritedSubscription_for_CAT_Level_with_serialNumber_parentId_startTime_endTime_for_DealerInheritedSubscriptions(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
	  //DealerInheritSub.DealerInheritedCATLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		try{
			DealerInheritedSubscriptions.DealerInheritedCATLevelSubscription(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in DealerInheritedCATLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for DealerInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_DealerInheritedSubscription() 
	{

		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
	    	System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		  //CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for DealerInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_DealerInheritedSubscription()
	{
		
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
	    	System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		//	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}
		

	@SuppressWarnings("deprecation")
	@Then("^Delete DealerInheritedSubscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg for DealerInherited Subscription$")
	public void delete_DealerInheritedSubscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg_for_DealerInherited_Subscription(String cancelReason, String level) throws IOException, Exception
	{
		System.out.println("************************************* DELETING DEALER INHERITED SUBSCRIPTIONS******************************************");
		try{
			DeleteDealerInheritedSubscriptions.DelDealerInheritedsubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingDealerInheritedDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete DealerInheritedSubscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg for DealerInherited Subscription$")
	public void delete_DealerInheritedSubscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg_for_DealerInherited_Subscription(String cancelReason, String level) throws IOException, Exception
	{
		try{
			DeleteDealerInheritedSubscriptions.DelDealerInheritedsubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingDealerInheritedCATLevel Subscription:" +e.getMessage().toString());
		}

	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledDealerInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledDealerInheritedSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		    System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		    //DSPSqlconnection dbcheck = new DSPSqlconnection();
			//CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledDealerInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledDealerInheritedSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
	    	System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		  //CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
			    
	}

	
	@SuppressWarnings("deprecation")
	@Then("^Set CATLevelSubscription for CATLevel with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\" and retrive the ParentID$")
	public void set_CATLevelSubscription_for_CATLevel_with_serialNumber_startTime_endTime_and_retrive_the_ParentID(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		
		    System.out.println("************************************* CREATING CAT LEVEL SUBSCRIPTIONS******************************************");
	  try{
		//CATLevelSub.CATLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		CATLevelSubscription.CATLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in CATLevel Subscription:" +e.getMessage().toString());
		}
			
		 
	}
	
	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CATLevelSubscription()  
	{
		
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
	    	System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
			//CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
				
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CATLevelSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
	       	System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		//	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
		
	}
		
	@SuppressWarnings("deprecation")
	@Then("^Delete CATLevelSubscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CATLevelSubscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level)  throws IOException, Exception
	{
		System.out.println("************************************* DELETING CATLEVEL SUBSCRIPTIONS******************************************");
		try{
			DeleteCATSubscriptions.DelCATLevelsubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingCATLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledCATLevelSubscription()  
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
	    	System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		// CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledCATLevelSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		 //	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Set NonInheritedsubscription for Customer Level with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" for CustomerLevel$")
	public void set_NonInheritedsubscription_for_Customer_Level_with_serialNumber_startTime_endTime_for_CustomerLevel(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{	
	    System.out.println("************************************* CREATING NONINHERITEDALLLEVEL SUBSCRIPTIONS******************************************");
		try{
			//NonInheritedSub.NoninheritedCustLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
			NonInheritedSubscriptions.NoninheritedCustLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId); 
			}catch(Exception e){
				 Assert.fail("Exception in NonInheritedCustLevel Subscription:" +e.getMessage().toString());
			}
	}

	@SuppressWarnings("deprecation")
	@Then("^Set NonInheritedsubscription Dealer Level with serialNumber,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",startTime,endTime for Dealerlevel$")
	public void set_NonInheritedsubscription_Dealer_Level_with_serialNumber_startTime_endTime_for_Dealerlevel(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		try{
	   //NonInheritedSub.NonInheritedDealerLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		NonInheritedSubscriptions.NonInheritedDealerLevelSubscription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in NonInheritedDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Set NonInheritedsubscription CATLevel with serialNumber,startTime,endTime,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\" for CATLevel$")
	public void set_NonInheritedsubscription_CATLevel_with_serialNumber_startTime_endTime_for_CATLevel(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		try{
		//NonInheritedSub.NonInheritedCATLevelSusbcription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		NonInheritedSubscriptions.NonInheritedCATLevelSusbcription(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in NonInheritedCATLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for NonInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_NonInheritedSubscription() 
	{
		
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
			//CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for NonInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_NonInheritedSubscription() 
	{
	    
	//	properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		//	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete NonInheritedSubscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_NonInheritedSubscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		System.out.println("************************************* DELETING NONINHERITED SUBSCRIPTIONS******************************************");
		try{
			DeleteNonInheritedSubscriptions.DelNonInheritedsubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingNonInheritedCATLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete NonInheritedSubscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_NonInheritedSubscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level)  throws IOException, Exception
	{
		try{
			DeleteNonInheritedSubscriptions.DelNonInheritedsubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingNonInheritedDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete NonInheritedSubscription Customer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_NonInheritedSubscription_Customer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level)  throws IOException, Exception
	{
		try{
			DeleteNonInheritedSubscriptions.DelNonInheritedsubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingNonInheritedCustLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledNonInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledNonInheritedSubscription()throws FileNotFoundException, IOException, SQLException 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		// CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledNonInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledNonInheritedSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		 //	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}	
	
	@SuppressWarnings("deprecation")
	@Then("^Set DealerInheritedwithNonInheritedSubscription for Customer Level with serialNumber,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime for DealerInheritedwithNonInheritedSubscription$")
	public void set_DealerInheritedwithNonInheritedSubscription_for_Customer_Level_with_serialNumber_startTime_endTime_for_DealerInheritedwithNonInheritedSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception  
	{
		System.out.println("************************************* CREATING DEALERINHERITEDWITHNONINHERITEDCUST SUBSCRIPTIONS******************************************");
		try{
		//DealerInheritedwithCust.DealerInheritedwithCustomerSubscriptionCustomerLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
	    DealerInheritedwithCustomerSubscription.DealerInheritedwithCustomerSubscriptionCustomerLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in DealerInheritedwithCustLevel Subscription:" +e.getMessage().toString());
		}
		}

	@SuppressWarnings("deprecation")
	@Then("^Set DealerInheritedwithNonInheritedSubscription for Dealer Level with serialNumber,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime for DealerInheritedwithNonInheritedSubscription$")
	public void set_DealerInheritedwithNonInheritedSubscription_for_Dealer_Level_with_serialNumber_startTime_endTime_for_DealerInheritedwithNonInheritedSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		try{
		//DealerInheritedwithCust.DealerInheritedwithCustomerSubscriptionDealerLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		DealerInheritedwithCustomerSubscription.DealerInheritedwithCustomerSubscriptionDealerLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in DealerInheritedwithDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Set DealerInheritedwithNonInheritedSubscription for CAT Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\",startTime,endTime for DealerInheritedwithNonInheritedSubscription$")
	public void set_DealerInheritedwithNonInheritedSubscription_for_CAT_Level_with_serialNumber_parentId_startTime_endTime_for_DealerInheritedwithNonInheritedSubscription(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId)  throws IOException, Exception
	{
		try{
		//DealerInheritedwithCust.DealerInheritedwithCustomerSubscriptionCATLevel(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		DealerInheritedwithCustomerSubscription.DealerInheritedwithCustomerSubscriptionCATLevel(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		}catch(Exception e){
			 Assert.fail("Exception in DealerInheritedwithCATLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for DealerInheritedwithNonInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_DealerInheritedwithNonInheritedSubscription()throws FileNotFoundException, IOException, SQLException 
	{
		
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
			//CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for DealerInheritedwithNonInheritedSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_DealerInheritedwithNonInheritedSubscription() 
	{
	    
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		//	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
	
	}
	
	@SuppressWarnings("deprecation")
	@Then("^Delete DealerInheritedwithCustSubscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_DealerInheritedwithCustSubscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		System.out.println("************************************* DELETING DEALERINHERITEDWITHNONINHERITEDCUST SUBSCRIPTIONS******************************************");
		try{
		DealerInheritedwithCustomerSubscriptionDelete.DelDealerInheritedwithCustomerSubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingDealerInheritedwithCATLevel Subscription:" +e.getMessage().toString());
		}
		}

	@SuppressWarnings("deprecation")
	@Then("^Delete DealerInheritedwithCustSubscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_DealerInheritedwithCustSubscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		try{
		DealerInheritedwithCustomerSubscriptionDelete.DelDealerInheritedwithCustomerSubscriptions(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingDealerInheritedwithDealerLevel Subscription:" +e.getMessage().toString());
		}
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete DealerInheritedwithCustSubscription for Customer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_DealerInheritedwithCustSubscription_for_Customer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		try {
		DealerInheritedwithCustomerSubscriptionDelete.DelDealerInheritedwithCustomerSubscriptions(cancelReason, level);
	     }catch(Exception e){
		 Assert.fail("Exception in DeletingDealerInheritedwithCUSTLevel Subscription:" +e.getMessage().toString());
	   }
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledDealerInheritedwithCustSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledDealerInheritedwithCustSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		// CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledDealerInheritedwithCustSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledDealerInheritedwithCustSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		 //	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}
	@SuppressWarnings("deprecation")
	@Then("^Set CustInheritedwithCATLevelSubscription for Customer Level with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\" and retrive the ParentID$")
	public void set_CustInheritedwithCATLevelSubscription_for_Customer_Level_with_serialNumber_startTime_endTime_and_retrive_the_ParentID(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception, ParseException
	{
		System.out.println("************************************* CREATING CUSTINHERITEDWITHNONINHERITEDCATLEVEL SUBSCRIPTIONS******************************************");
		try{
		//CustInheritedwithCAT.CustInheritedwithCATLevelSubscriptionCustLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		CustInheritedwithCATLevelSubscription.CustInheritedwithCATLevelSubscriptionCustLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		  }catch(Exception e){
				 Assert.fail("Exception in CUSTInheritedwithCATLevelCustSubscription:" +e.getMessage().toString());
			   }
		}

	@SuppressWarnings("deprecation")
	@Then("^Set CustInheritedwithCATLevelSubscription for Dealer Level with serialNumber,parentId,\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\",startTime,endTime$")
	public void set_CustInheritedwithCATLevelSubscription_for_Dealer_Level_with_serialNumber_parentId_startTime_endTime(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
	 try{
		//CustInheritedwithCAT.CustInheritedwithCATLevelSubscriptionDealerLevel(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		CustInheritedwithCATLevelSubscription.CustInheritedwithCATLevelSubscriptionDealerLevel(make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
	}catch(Exception e){
		 Assert.fail("Exception in CUSTInheritedwithCATLevelDealerSubscription:" +e.getMessage().toString());
	   }
	}

	@SuppressWarnings("deprecation")
	@Then("^Set CustInheritedwithCATLevelSubscription for CATLevel with serialNumber,startTime,endTime, \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\" ,\"([^\"]*)\" , \"([^\"]*)\" ,\"([^\"]*)\",\"([^\"]*)\"$")
	public void set_CustInheritedwithCATLevelSubscription_for_CATLevel_with_serialNumber_startTime_endTime(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, Exception
	{
		try{
		//CustInheritedwithCAT.CustInheritedwithCATLevelSubscriptionCATLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
		CustInheritedwithCATLevelSubscription.CustInheritedwithCATLevelSubscriptionCATLevel(parentId, make, siteId, typeId, level, origin, organization, organizationType, associatedOrganization, associatedOrganizationType, dcn, billingtUserAccountId);
	}catch(Exception e){
		 Assert.fail("Exception in CUSTInheritedwithCATLevelCATSubscription:" +e.getMessage().toString());
	   }
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CustInheritedwithCATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CustInheritedwithCATLevelSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		// CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CustInheritedwithCATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CustInheritedwithCATLevelSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
	
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
				String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		 //	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
	
	}
	
	@SuppressWarnings("deprecation")
	@Then("^Delete CustInheritedwithCATLevelSubscription for CAT Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CustInheritedwithCATLevelSubscription_for_CAT_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level)  throws IOException, Exception
	{
		System.out.println("************************************* DELETING CUSTINHERITEDWITHNONINHERITEDCATLEVEL SUBSCRIPTIONS******************************************");
		try{
		CustInheritedwithCATLevelSubscriptionDelete.DelCustInheritedwithCATLevelSubscription(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingCUSTInheritedwithCATLevelCATSubscription:" +e.getMessage().toString());
		   }
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete CustInheritedwithCATLevelSubscription for Dealer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CustInheritedwithCATLevelSubscription_for_Dealer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception
	{
		try{
		CustInheritedwithCATLevelSubscriptionDelete.DelCustInheritedwithCATLevelSubscription(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingCUSTInheritedwithCATLevelDealerSubscription:" +e.getMessage().toString());
		   }
	}

	@SuppressWarnings("deprecation")
	@Then("^Delete CustInheritedwithCATLevelSubscription for Customer Level with \"([^\"]*)\",\"([^\"]*)\" endTime and Validate the SuccessMsg$")
	public void delete_CustInheritedwithCATLevelSubscription_for_Customer_Level_with_endTime_and_Validate_the_SuccessMsg(String cancelReason, String level) throws IOException, Exception 
	{
		try{
		CustInheritedwithCATLevelSubscriptionDelete.DelCustInheritedwithCATLevelSubscription(cancelReason, level);
		}catch(Exception e){
			 Assert.fail("Exception in DeletingCUSTInheritedwithCATLevelCustSubscription:" +e.getMessage().toString());
		   }
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCustInheritedwithCATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscription_and_Table_for_CancelledCustInheritedwithCATLevelSubscription() throws FileNotFoundException, IOException, SQLException 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionAssetid :" +SubAssetID);
			String SubscritpionTableQuery = properties.getProperty("db.AssetSubscription").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +SubscritpionTableQuery);
		//	DSPSqlconnection dbcheck = new DSPSqlconnection();
		// CommonInstance.getassetDetails(SubscritpionTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", SubscritpionTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

	@SuppressWarnings("deprecation")
	@Then("^Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCustInheritedwithCATLevelSubscription$")
	public void retrieve_the_Values_of_Subscription_id_in_AssetSubscriptionHistory_Table_for_CancelledCustInheritedwithCATLevelSubscription() 
	{
		//properties.load(new FileInputStream("Resources\\application.properties"));
		//String SubAssetID = Asset_structure_API.Asset_id;
		
		try {
			properties.load(new FileInputStream("Resources\\application.properties"));
			String SubAssetID = properties.getProperty("Asset.Asset_id");
		System.out.println("SubscriptionhistoryAssetid :" +SubAssetID);
			String HistoryTableQuery = properties.getProperty("db.AssetSubscriptionHistory").replace("DUMMYXYZ", SubAssetID);
			System.out.println("SubscriptionHistoryTableQuery:" +HistoryTableQuery);
			//DSPSqlconnection dbcheck = new DSPSqlconnection();
		 //	CommonInstance.getassetDetails(HistoryTableQuery);
			try {
				CommonInstance.SkippedQuery("ASSET_ID", HistoryTableQuery);
			} catch (SQLException e) {
				Assert.fail("Invalid Query"+e.getMessage());
				/*throw new Exception(ExceptionMessage.SQLEXCEPTION.getDescription(),
						ExceptionMessage.SQLEXCEPTION.getCode());*/
			}
		
		} catch (IOException e) {
			Assert.fail("Exception in file handling"+e.getMessage());
			/*throw new Exception(ExceptionMessage.IOException.getDescription(),
					ExceptionMessage.IOException.getCode());*/
		}
		
	}

		
}
