package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

/*import APIAutomation.APIReponse;
import ReusableUtils.CommonMethods;
import ReusableUtils.CommonMethods_Subscriptions;*/
import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;

public class DealerInheritedSubscriptions 
{
	public static String DealerParentId= null;
	public static String CATId = null;
	
	public static String DealerInheritedDealerLevelSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId ) throws FileNotFoundException, NullPointerException, IOException, JSONException
	{
		//CreateDealerSubscription CreateDealerSub = new CreateDealerSubscription();
		CreateSubscription creatsub = new CreateSubscription();
		
		creatsub.setParentId(parentId);
		creatsub.setMake(make);
		creatsub.setSiteId(siteId);
		creatsub.setTypeId(typeId);
		creatsub.setLevel(level);
		creatsub.setOrigin(origin);
		creatsub.setOrganization(organization);
		creatsub.setOrganizationType(organizationType);
		creatsub.setAssociatedOrganization(associatedOrganization);
		creatsub.setAssociatedOrganizationType(associatedOrganizationType);
		creatsub.setDcn(dcn);
		creatsub.setBillingtUserAccountId(billingtUserAccountId);
		creatsub.setEndTime(CommonMethods.getCurrenttime());
		creatsub.setStartTime(CommonMethods.getCurrenttime());
		creatsub.setSerialNumber(Common_methods.SerialNumber);
	    /*List<String> SerialNumbers = new ArrayList<String>();
		SerialNumbers = Common_methods.SerialNumbers;
		creatsub.setSerialNumber(SerialNumbers.get(0));*/
		/*for (int i =0;i<=SerialNumbers.size();i++){
			CreateDealerSub.setSerialNumber(SerialNumbers.get(i));
		}*/
	    
	   // CreateDealerSub.setSerialNumber(Common_methods.SerialNumber);
        
	    Gson gson = new Gson();
		String DealertLevel = gson.toJson(creatsub);
		System.out.println("Dealer Level:" + DealertLevel);
		String requestBody  = DealertLevel;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";
		
		APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
		String Dealerresponse = APIObj.getResponse();
		System.out.println("Dealerresponse :" + Dealerresponse);
		JSONObject jsonobj = new JSONObject(Dealerresponse);
		DealerParentId = jsonobj.getString("id");
		System.out.println("DealerID:" + "\t" + DealerParentId);
				
		return DealerParentId;

	}
	
	public static String DealerInheritedCATLevelSubscription(String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException
	{
	
		//CreateCatSubscription CreateCATSub  = new CreateCatSubscription();
		CreateSubscription creatsub = new CreateSubscription();
		
		creatsub.setMake(make);
		creatsub.setSiteId(siteId);
		creatsub.setTypeId(typeId);
		creatsub.setLevel(level);
		creatsub.setOrigin(origin);
		creatsub.setOrganization(organization);
		creatsub.setOrganizationType(organizationType);
		creatsub.setAssociatedOrganization(associatedOrganization);
		creatsub.setAssociatedOrganizationType(associatedOrganizationType);
		creatsub.setDcn(dcn);
		creatsub.setBillingtUserAccountId(billingtUserAccountId);
		creatsub.setEndTime(CommonMethods.getCurrenttime());
		creatsub.setStartTime(CommonMethods.getCurrenttime());
		creatsub.setSerialNumber(Common_methods.SerialNumber);
		creatsub.setParentId(DealerParentId);
		
		Gson gson = new Gson();
		String CATLevel = gson.toJson(creatsub);
		System.out.println("CAT Level:" + CATLevel);
		String requestBody  = CATLevel;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";
		
		APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
		String CATresponse = APIObj.getResponse();
		System.out.println("Dealerresponse :" + CATresponse);
		JSONObject jsonobj = new JSONObject(CATresponse);
		CATId = jsonobj.getString("id");
		System.out.println("CATID:" + "\t" + CATId);
				
		return CATId;

	}

}
