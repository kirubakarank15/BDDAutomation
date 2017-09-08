package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.json.JSONException;

import com.google.gson.Gson;

/*import APIAutomation.APIReponse;
import ReusableUtils.CommonMethods;
import ReusableUtils.CommonMethods_DeleteSubscriptions;*/

import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;
public class DeleteCATSubscriptions
{
	public static String level = null;
	public static String id =null;
	
	 public static String DelCATLevelsubscriptions(String cancelReason,String level) throws FileNotFoundException, NullPointerException, IOException, JSONException
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
			
			if(level.equals("CAT"))
			{
				 id = CATLevelSubscription.CATId;
					
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
