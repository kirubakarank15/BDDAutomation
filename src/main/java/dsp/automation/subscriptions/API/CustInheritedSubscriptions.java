package dsp.automation.subscriptions.API;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

//import APIAutomation.APIReponse;
//import ReusableUtils.CommonMethods;
//import ReusableUtils.CommonMethods_Subscriptions;
import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.DBMapValues;
import dsp.automation.utilities.DSPAutomationException;

public class CustInheritedSubscriptions 
{

		public static String custParentId= null;
		public static String DealerId = null;
		public static String CATId = null;
		public static String custresponse = null;
		public static String Dealerresponse = null;
		public static String CATresponse = null;
		public static String Custlevel = null;
		public static String Deallevel =null;
		public static String CATlevel = null;
		public static String SerialNumber = null;
	
	public static void CustInheritedCustLevelSubscription(String parentId, String make,String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, DSPAutomationException
	{

		CreateSubscription creatsub = new CreateSubscription();
		/*Properties properties = new Properties();
		properties.load(new FileInputStream("Resources\\application.properties"));
		SerialNumber = properties.getProperty("Asset.SerialNumber");
	  	creatsub.setSerialNumber(SerialNumber);*/
		
		creatsub.setSerialNumber(serialNumber);
		creatsub.setParentId(parentId);
		creatsub.setBillingtUserAccountId(billingtUserAccountId);
		creatsub.setAssociatedOrganization(associatedOrganization);
		creatsub.setAssociatedOrganizationType(associatedOrganizationType);
		creatsub.setDcn(dcn);
		creatsub.setEndTime(CommonMethods.getCurrenttime());
		creatsub.setStartTime(CommonMethods.getCurrenttime());
		creatsub.setLevel(level);
		creatsub.setMake(make);
		creatsub.setOrganization(organization);
		creatsub.setOrganizationType(organizationType);
		creatsub.setOrigin(origin);
		creatsub.setSiteId(siteId);
		creatsub.setTypeId(typeId);
		//creatsub.setSerialNumber(Common_methods.SerialNumber);
		//creatsub.setSerialNumber(CommonMethods.AssetSno);
		/*List<String> SerialNumbers = new ArrayList<String>();
		SerialNumbers = Common_methods.SerialNumbers;
		creatsub.setSerialNumber(SerialNumbers.get(0));*/
		/*for (int i =0;i<=SerialNumbers.size();i++){
			creatsub.setSerialNumber(SerialNumbers.get(i));
		}*/
		//creatsub.setSerialNumber(Common_methods.SerialNumber);
		

		Gson gson = new Gson();
		String CustLevel = gson.toJson(creatsub);
		System.out.println("CustLevel:" + CustLevel);
		String requestBody  = CustLevel;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";

		APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
		
		custresponse = APIObj.getResponse();
		//System.out.println("CustLevelResponse :" + custresponse);
		JSONObject jsonobj = new JSONObject(custresponse);
		custParentId = jsonobj.getString("id");
		Custlevel  = jsonobj.getString("level");
		//System.out.println("CUST LEVEL :" + r2);
		System.out.println("ID:" + "\t" + custParentId);
		//return null;

	}
	
	public static void CustInheritedDealerLevelSubscription(String make,String serialNumber,String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, DSPAutomationException, CustomisedException
	{
		
		//CreateDealerSubscription createDealerSub = new CreateDealerSubscription();
		CreateSubscription creatsub = new CreateSubscription();
		/*Properties properties = new Properties();
		properties.load(new FileInputStream("Resources\\application.properties"));
		SerialNumber = properties.getProperty("Asset.SerialNumber");
		creatsub.setSerialNumber(SerialNumber);*/
		
		creatsub.setSerialNumber(serialNumber);
		creatsub.setMake(make);
		creatsub.setSiteId(siteId);
		creatsub.setAssociatedOrganization(associatedOrganization);
		creatsub.setAssociatedOrganizationType(associatedOrganizationType);
		creatsub.setBillingtUserAccountId(billingtUserAccountId);
		creatsub.setDcn(dcn);
		creatsub.setEndTime(CommonMethods.getCurrenttime());
		creatsub.setStartTime(CommonMethods.getCurrenttime());
		creatsub.setLevel(level);
		creatsub.setOrganization(organization);
		creatsub.setOrganizationType(organizationType);
		creatsub.setOrigin(origin);
		creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=3"));
		creatsub.setTypeId(typeId);
		//creatsub.setSerialNumber(Common_methods.SerialNumber);
		/*List<String> SerialNumbers = new ArrayList<String>();
		SerialNumbers = Common_methods.SerialNumbers;
		creatsub.setSerialNumber(SerialNumbers.get(0));	*/	
		
		Gson gson = new Gson();
		String Dealerlevel = gson.toJson(creatsub);
		System.out.println("DealerLevel:" + Dealerlevel);
		String requestBody  = Dealerlevel;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";

		APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
		Dealerresponse = APIObj.getResponse();
		//System.out.println("Dealerresponse :" + Dealerresponse);
		JSONObject jsonobj = new JSONObject(Dealerresponse);
		DealerId = jsonobj.getString("id");
		Deallevel  = jsonobj.getString("level");
		//System.out.println("CUST LEVEL :" + r2);
		System.out.println("DealerID:" + "\t" + DealerId);
				
		//return Dealerresponse;
		
	}		
		public static void CustInheritedCATLevelSubscription(String make,String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws IOException, DSPAutomationException, CustomisedException
		{
	    
			//CreateCatSubscription createcatSub = new CreateCatSubscription();
			CreateSubscription creatsub = new CreateSubscription();
			/*Properties properties = new Properties();
			properties.load(new FileInputStream("Resources\\application.properties"));
			SerialNumber = properties.getProperty("Asset.SerialNumber");
			creatsub.setSerialNumber(SerialNumber);*/
			
			creatsub.setSerialNumber(serialNumber);
			creatsub.setAssociatedOrganization(associatedOrganization);
			creatsub.setAssociatedOrganizationType(associatedOrganizationType);
			creatsub.setBillingtUserAccountId(billingtUserAccountId);
			creatsub.setDcn(dcn);
			creatsub.setEndTime(CommonMethods.getCurrenttime());
			creatsub.setStartTime(CommonMethods.getCurrenttime());
			creatsub.setLevel(level);
			creatsub.setMake(make);
			//creatsub.setSerialNumber(Common_methods.SerialNumber);
			creatsub.setOrganization(associatedOrganizationType);
			creatsub.setOrganizationType(associatedOrganizationType);
			creatsub.setOrigin(origin);
			creatsub.setSiteId(siteId);
			creatsub.setTypeId(typeId);
			creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=3"));
			
			//creatsub.setParentId(custParentId);
			/*List<String> SerialNumbers = new ArrayList<String>();
			SerialNumbers = Common_methods.SerialNumbers;
			creatsub.setSerialNumber(SerialNumbers.get(0));*/
					
			Gson gson = new Gson();
			String catlevel = gson.toJson(creatsub);
			System.out.println("CatLevel:" + catlevel);
			String requestBody  = catlevel;
			String postAPIContentType = "application/subscriptions-v1+json";
			String postAPIAcceptType = "application/subscriptions-v1+json";

			APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
			CATresponse = APIObj.getResponse();
			//System.out.println("catresponse :" + CATresponse);
			JSONObject jsonobj = new JSONObject(CATresponse);
			CATId = jsonobj.getString("id");
			CATlevel  = jsonobj.getString("level");
			//System.out.println("CUST LEVEL :" + r2);s
			System.out.println("ID:" + "\t" + CATId);
					
			//return CATresponse;
		}
}
