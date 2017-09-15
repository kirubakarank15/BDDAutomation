package dsp.automation.subscriptions.API;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

//import APIAutomation.APIReponse;
//import ReusableUtils.CommonMethods;
//import ReusableUtils.CommonMethods_Subscriptions;
import dsp.automation.AssetStructures.API.Common_methods;
import dsp.automation.utilities.APIReponse;

public class CATLevelSubscription 
{
	public static String CATId = null;
	public static String CATlevel = null;
	public static String CATresponse = null;
	
	public static String CATLevelSubscription(String parentId,String make, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId) throws FileNotFoundException, NullPointerException, IOException, JSONException
	{
		CreateCatSubscription createcatSub = new CreateCatSubscription();
		
		createcatSub.setMake(make);
		createcatSub.setSiteId(siteId);
		createcatSub.setTypeId(typeId);
		createcatSub.setLevel(level);
		createcatSub.setOrigin(origin);
		createcatSub.setOrganization(organization);
		createcatSub.setOrganizationType(organizationType);
		createcatSub.setAssociatedOrganization(associatedOrganization);
		createcatSub.setAssociatedOrganizationType(associatedOrganizationType);
		createcatSub.setBillingtUserAccountId(billingtUserAccountId);
		createcatSub.setDcn(dcn);
		createcatSub.setEndTime(CommonMethods.getCurrenttime());
		createcatSub.setStartTime(CommonMethods.getCurrenttime());
		//createcatSub.setSerialNumber(CommonMethods.AssetSno);
		List<String> SerialNumbers = new ArrayList<String>();
		SerialNumbers = Common_methods.SerialNumbers;
		createcatSub.setSerialNumber(SerialNumbers.get(0));
		/*for (int i =0;i<=SerialNumbers.size();i++){
			createcatSub.setSerialNumber(SerialNumbers.get(i));
		}*/
		
		createcatSub.setParentId(parentId);
		
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
