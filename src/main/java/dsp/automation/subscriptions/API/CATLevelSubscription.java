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
		//CreateCatSubscription createcatSub = new CreateCatSubscription();
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
		creatsub.setBillingtUserAccountId(billingtUserAccountId);
		creatsub.setDcn(dcn);
		creatsub.setEndTime(CommonMethods.getCurrenttime());
		creatsub.setStartTime(CommonMethods.getCurrenttime());
		creatsub.setSerialNumber(Common_methods.SerialNumber);
		//createcatSub.setSerialNumber(CommonMethods.AssetSno);
		//Commenting to check for single device
		/*List<String> SerialNumbers = new ArrayList<String>();
		SerialNumbers = Common_methods.SerialNumbers;
		creatsub.setSerialNumber(SerialNumbers.get(0));*/
		
		/*for (int i =0;i<=SerialNumbers.size();i++){
			createcatSub.setSerialNumber(SerialNumbers.get(i));
		}*/
		
		creatsub.setParentId(parentId);
		
		Gson gson = new Gson();
		String catlevel = gson.toJson(creatsub);
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
