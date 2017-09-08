package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;

import java.io.IOException;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

/*import APIAutomation.APIReponse;
import ReusableUtils.CommonMethods;
import ReusableUtils.CommonMethods_Subscriptions;*/
import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;

public class DealerInheritedScubscriptions 
{
	public static String DealerParentId= null;
	public static String CATId = null;
	
	public static String DealerInheritedDealerLevelSubscription(String parentId, String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId ) throws FileNotFoundException, NullPointerException, IOException, JSONException
	{
		CreateDealerSubscription CreateDealerSub = new CreateDealerSubscription();
		
		CreateDealerSub.setParentId(parentId);
		CreateDealerSub.setMake(make);
		CreateDealerSub.setSiteId(siteId);
		CreateDealerSub.setTypeId(typeId);
		CreateDealerSub.setLevel(level);
		CreateDealerSub.setOrigin(origin);
		CreateDealerSub.setOrganization(organization);
		CreateDealerSub.setOrganizationType(organizationType);
	    CreateDealerSub.setAssociatedOrganization(associatedOrganization);
	    CreateDealerSub.setAssociatedOrganizationType(associatedOrganizationType);
	    CreateDealerSub.setDcn(dcn);
	    CreateDealerSub.setBillingtUserAccountId(billingtUserAccountId);
	    CreateDealerSub.setEndTime(CommonMethods.getCurrenttime());
	    CreateDealerSub.setStartTime(CommonMethods.getCurrenttime());
	    CreateDealerSub.setSerialNumber(Common_methods.SerialNumber);
        
	    Gson gson = new Gson();
		String DealertLevel = gson.toJson(CreateDealerSub);
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
	
		CreateCatSubscription CreateCATSub  = new CreateCatSubscription();
		
		CreateCATSub.setMake(make);
		CreateCATSub.setSiteId(siteId);
		CreateCATSub.setTypeId(typeId);
		CreateCATSub.setLevel(level);
		CreateCATSub.setOrigin(origin);
		CreateCATSub.setOrganization(organization);
		CreateCATSub.setOrganizationType(organizationType);
		CreateCATSub.setAssociatedOrganization(associatedOrganization);
		CreateCATSub.setAssociatedOrganizationType(associatedOrganizationType);
		CreateCATSub.setDcn(dcn);
		CreateCATSub.setBillingtUserAccountId(billingtUserAccountId);
		CreateCATSub.setEndTime(CommonMethods.getCurrenttime());
		CreateCATSub.setStartTime(CommonMethods.getCurrenttime());
		CreateCATSub.setSerialNumber(Common_methods.SerialNumber);
		CreateCATSub.setParentId(DealerParentId);
		
		Gson gson = new Gson();
		String CATLevel = gson.toJson(CreateCATSub);
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
