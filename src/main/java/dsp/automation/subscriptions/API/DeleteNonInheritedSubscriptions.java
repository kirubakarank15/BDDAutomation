package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.json.JSONException;

import com.google.gson.Gson;

import dsp.automation.utilities.APIReponse;
import dsp.automation.utilities.DSPAutomationException;

public class DeleteNonInheritedSubscriptions 
{
	public static String level = null;
	public static String id =null;
	
	public static String DelNonInheritedsubscriptions(String cancelReason,String level) throws IOException,DSPAutomationException
	{
		
		DeleteSubscription DelSub = new DeleteSubscription();
		DelSub.setCancelReason(cancelReason);
		DelSub.setEndTime(CommonMethods.getCurrenttime());
		
		Gson gson = new Gson();
		String DeleteSub = gson.toJson(DelSub);
		System.out.println("DeleteSub:" + DeleteSub);
		String requestBody  = DeleteSub;
		String postAPIContentType = "application/subscriptions-v1+json";
		String postAPIAcceptType = "application/subscriptions-v1+json";
		/*
		HashMap<String, Object> Response = new HashMap<String, Object>();
		Response.put("CustResponse", CustInheritedSubscriptions.custresponse);
		Response.put("DealerResponse", CustInheritedSubscriptions.Dealerresponse);
		Response.put("CATResponse", CustInheritedSubscriptions.CATresponse);
	  	if(key == "CustResponse")
	  	{
	  		
	  	}*/
			
		/*JSONObject jsoncustobj = new JSONObject(CustInheritedSubscriptions.custresponse);
		level= jsoncustobj.getString("level");
		JSONObject jsonDealerobj = new JSONObject(CustInheritedSubscriptions.Dealerresponse);
		level= jsonDealerobj.getString("level");
		JSONObject jsonCATobj = new JSONObject(CustInheritedSubscriptions.CATresponse);
		level= jsonCATobj.getString("level");*/
				
		if(level.equals("Customer"))
		{
			id = NonInheritedSubscriptions.NonInheritedcustId;
		}
		else if(level.equals("CAT"))
		{
			 id = NonInheritedSubscriptions.NonInheritedCATId;
				
		}
		else if(level.equals("Dealer"))
		{
			id= NonInheritedSubscriptions.NonInheritedDealerId;
			
		}
      APIReponse APIObj = CommonMethods_DeleteSubscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST",id);
		
		String Delresponse = APIObj.getResponse();
		System.out.println("Delete Response :" + Delresponse);
		/*JSONObject jsonobj = new JSONObject(custresponse);
		custParentId = jsonobj.getString("id");
		//System.out.println("CUST LEVEL :" + r2);
		System.out.println("ID:" + "\t" + custParentId);
		return custParentId;*/
		return null;
	}
	
	
}
