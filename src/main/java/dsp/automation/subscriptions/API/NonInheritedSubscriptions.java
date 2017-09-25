package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import dsp.automation.AssetStructures.API.Common_methods;
import dsp.automation.utilities.APIReponse;

public class NonInheritedSubscriptions 
{


	public static String NonInheritedcustId= null;
	public static String NonInheritedDealerId = null;
	public static String NonInheritedCATId = null;
	public static String custresponse = null;
	public static String Dealerresponse = null;
	public static String CATresponse = null;
	public static String Custlevel = null;
	public static String Deallevel =null;
	public static String CATlevel = null;

	
public static String NoninheritedCustLevelSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, JSONException, IOException
{
	
	CreateSubscription creatsub = new CreateSubscription();
	
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
	System.out.println("NonInheritedCustResponse :" + custresponse);
	JSONObject jsonobj = new JSONObject(custresponse);
	NonInheritedcustId = jsonobj.getString("id");
	Custlevel  = jsonobj.getString("level");
	//System.out.println("CUST LEVEL :" + r2);
	System.out.println("ID:" + "\t" + NonInheritedcustId);
	return NonInheritedcustId;
		
}


public static String NonInheritedDealerLevelSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, JSONException, IOException
{

	//CreateDealerSubscription createDealerSub = new CreateDealerSubscription();
	CreateSubscription creatsub = new CreateSubscription();
	
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
	creatsub.setParentId(parentId);
	creatsub.setTypeId(typeId);
	creatsub.setSerialNumber(Common_methods.SerialNumber);
			
	Gson gson = new Gson();
	String Dealerlevel = gson.toJson(creatsub);
	System.out.println("Dealer Level:" + Dealerlevel);
	String requestBody  = Dealerlevel;
	String postAPIContentType = "application/subscriptions-v1+json";
	String postAPIAcceptType = "application/subscriptions-v1+json";

	APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
	Dealerresponse = APIObj.getResponse();
	System.out.println("NonInheritedDealerResponse :" + Dealerresponse);
	JSONObject jsonobj = new JSONObject(Dealerresponse);
	NonInheritedDealerId = jsonobj.getString("id");
	Deallevel  = jsonobj.getString("level");
	//System.out.println("CUST LEVEL :" + r2);
	System.out.println("DealerID:" + "\t" + NonInheritedDealerId);
			
	return Dealerresponse;

}

public static String NonInheritedCATLevelSusbcription(String parentId,String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, JSONException, IOException
{
	//CreateCatSubscription createcatSub = new CreateCatSubscription();
	CreateSubscription creatsub = new CreateSubscription();
	
	creatsub.setAssociatedOrganization(associatedOrganization);
	creatsub.setAssociatedOrganizationType(associatedOrganizationType);
	creatsub.setBillingtUserAccountId(billingtUserAccountId);
	creatsub.setDcn(dcn);
	creatsub.setEndTime(CommonMethods.getCurrenttime());
	creatsub.setStartTime(CommonMethods.getCurrenttime());
	creatsub.setLevel(level);
	creatsub.setMake(make);
	creatsub.setSerialNumber(Common_methods.SerialNumber);
	creatsub.setOrganization(associatedOrganizationType);
	creatsub.setOrganizationType(associatedOrganizationType);
	creatsub.setOrigin(origin);
	creatsub.setSiteId(siteId);
	creatsub.setTypeId(typeId);
	creatsub.setParentId(parentId);
			
	Gson gson = new Gson();
	String catlevel = gson.toJson(creatsub);
	System.out.println("Cat Level:" + catlevel);
	String requestBody  = catlevel;
	String postAPIContentType = "application/subscriptions-v1+json";
	String postAPIAcceptType = "application/subscriptions-v1+json";

	APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
	CATresponse = APIObj.getResponse();
	System.out.println("NonInheritedCatResponse :" + CATresponse);
	JSONObject jsonobj = new JSONObject(CATresponse);
	NonInheritedCATId = jsonobj.getString("id");
	CATlevel  = jsonobj.getString("level");
	//System.out.println("CUST LEVEL :" + r2);
	System.out.println("ID:" + "\n" + NonInheritedCATId);
			
	return CATresponse;

	
}

}