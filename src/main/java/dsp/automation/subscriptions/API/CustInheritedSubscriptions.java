package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

//import APIAutomation.APIReponse;
//import ReusableUtils.CommonMethods;
//import ReusableUtils.CommonMethods_Subscriptions;
import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;

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
	
	public static String CustInheritedCustLevelSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId)
			throws FileNotFoundException, IOException, JSONException, ParseException 
	{

		CreateCustomerSubscription creatsub = new CreateCustomerSubscription();
		
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
		//creatsub.setSerialNumber(CommonMethods.AssetSno);
		List<String> SerialNumbers = new ArrayList<String>();
		SerialNumbers = Common_methods.SerialNumbers;
		creatsub.setSerialNumber(SerialNumbers.get(0));
		/*for (int i =0;i<=SerialNumbers.size();i++){
			creatsub.setSerialNumber(SerialNumbers.get(i));
		}*/
		//creatsub.setSerialNumber(Common_methods.SerialNumber);
		creatsub.setSiteId(siteId);
		creatsub.setTypeId(typeId);

		Gson gson = new Gson();
		String CustLevel = gson.toJson(creatsub);
		System.out.println("Cust Level:" + CustLevel);
		String requestBody  = CustLevel;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";

		APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
		
		custresponse = APIObj.getResponse();
		System.out.println("custresponse :" + custresponse);
		JSONObject jsonobj = new JSONObject(custresponse);
		custParentId = jsonobj.getString("id");
		Custlevel  = jsonobj.getString("level");
		//System.out.println("CUST LEVEL :" + r2);
		System.out.println("ID:" + "\t" + custParentId);
		return custParentId;

	}
	
	public static String CustInheritedDealerLevelSubscription(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException
	{
		
		CreateDealerSubscription createDealerSub = new CreateDealerSubscription();
		createDealerSub.setMake(make);
		createDealerSub.setSiteId(siteId);
		createDealerSub.setAssociatedOrganization(associatedOrganization);
		createDealerSub.setAssociatedOrganizationType(associatedOrganizationType);
		createDealerSub.setBillingtUserAccountId(billingtUserAccountId);
		createDealerSub.setDcn(dcn);
		createDealerSub.setEndTime(CommonMethods.getCurrenttime());
		createDealerSub.setStartTime(CommonMethods.getCurrenttime());
		createDealerSub.setLevel(level);
		createDealerSub.setOrganization(organization);
		createDealerSub.setOrganizationType(organizationType);
		createDealerSub.setOrigin(origin);
		createDealerSub.setParentId(custParentId);
		createDealerSub.setTypeId(typeId);
		createDealerSub.setSerialNumber(Common_methods.SerialNumber);
				
		Gson gson = new Gson();
		String Dealerlevel = gson.toJson(createDealerSub);
		System.out.println("Dealer Level:" + Dealerlevel);
		String requestBody  = Dealerlevel;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";

		APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
		Dealerresponse = APIObj.getResponse();
		System.out.println("Dealerresponse :" + Dealerresponse);
		JSONObject jsonobj = new JSONObject(Dealerresponse);
		DealerId = jsonobj.getString("id");
		Deallevel  = jsonobj.getString("level");
		//System.out.println("CUST LEVEL :" + r2);
		System.out.println("DealerID:" + "\t" + DealerId);
				
		return Dealerresponse;
		
	}		
		public static String CustInheritedCATLevelSubscription(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException
		{
	    
			CreateCatSubscription createcatSub = new CreateCatSubscription();
			
			createcatSub.setAssociatedOrganization(associatedOrganization);
			createcatSub.setAssociatedOrganizationType(associatedOrganizationType);
			createcatSub.setBillingtUserAccountId(billingtUserAccountId);
			createcatSub.setDcn(dcn);
			createcatSub.setEndTime(CommonMethods.getCurrenttime());
			createcatSub.setStartTime(CommonMethods.getCurrenttime());
			createcatSub.setLevel(level);
			createcatSub.setMake(make);
			createcatSub.setSerialNumber(Common_methods.SerialNumber);
			createcatSub.setOrganization(associatedOrganizationType);
			createcatSub.setOrganizationType(associatedOrganizationType);
			createcatSub.setOrigin(origin);
			createcatSub.setSiteId(siteId);
			createcatSub.setTypeId(typeId);
			createcatSub.setParentId(custParentId);
					
			Gson gson = new Gson();
			String catlevel = gson.toJson(createcatSub);
			System.out.println("Cat Level:" + catlevel);
			String requestBody  = catlevel;
			String postAPIContentType = "application/subscriptions-v1+json";
			String postAPIAcceptType = "application/subscriptions-v1+json";

			APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
			CATresponse = APIObj.getResponse();
			System.out.println("catresponse :" + CATresponse);
			JSONObject jsonobj = new JSONObject(CATresponse);
			CATId = jsonobj.getString("id");
			CATlevel  = jsonobj.getString("level");
			//System.out.println("CUST LEVEL :" + r2);
			System.out.println("ID:" + "\n" + CATId);
					
			return CATresponse;
		}
		
}
