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
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.DSPAutomationException;

public class DeleteAllSubscription
{
	public static String level = null;
	public static String id =null;


	public static void SubscriptionDelete(String cancelReason,String level,String Inheritance,String ExpectedDeleteResponse) throws IOException, CustomisedException
	{
		String Delresponse = null;
		Integer DeletionStatusCode =null;

		try
		{
			DeleteSubscription DelSub = new DeleteSubscription();
			DelSub.setCancelReason(cancelReason);
			DelSub.setEndTime(CommonMethods.getCurrenttime());

			Gson gson = new Gson();
			String DeleteSub = gson.toJson(DelSub);
			System.out.println("DeleteRequest:"+Inheritance+level +":" + DeleteSub);
			String requestBody  = DeleteSub;
			String postAPIContentType = "application/subscriptions-v1+json";
			String postAPIAcceptType = "application/subscriptions-v1+json";


			if(level.equals("CAT") && Inheritance.equals("CatLevel"))
			{
				id = CreateAllSubscription.CATLevelCATId;
				System.out.println("Catlevelcatid: "+id);

			}
			else if(level.equals("Customer") && Inheritance.equals("CustInherited"))
			{
				id =CreateAllSubscription.CustinheritedcustParentId;
				System.out.println("Custcustid: "+id);

			}
			else if(level.equals("CAT") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllSubscription.CustInheritedCATId;
				System.out.println("Custcatid: "+id);						
			}
			else if(level.equals("Dealer") && Inheritance.equals("CustInherited"))
			{
				id= CreateAllSubscription.CustInheritedDealerId;
				System.out.println("Custdealerid: "+id);

			}
			else if(level.equals("Customer") && Inheritance.equals("DealerInherited"))
			{
				id = null;
			}
			else if(level.equals("CAT") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllSubscription.DealerInheritedCATId;
				System.out.println("DealerCATid: "+id);

			}
			else if(level.equals("Dealer") && Inheritance.equals("DealerInherited"))
			{
				id= CreateAllSubscription.DealerInheritedDealerParentId;
				System.out.println("Dealerdealerid: "+id);

			}
			else if(level.equals("Customer") && Inheritance.equals("NonInherited"))
			{
				id= CreateAllSubscription.NonInheritedcustId;
				System.out.println("nonInheritedCustid: "+id);
			}
			else if(level.equals("CAT") && Inheritance.equals("NonInherited"))
			{
				id= CreateAllSubscription.NonInheritedCATId;
				System.out.println("nonInheritedcATid: "+id);

			}
			else if(level.equals("Dealer") && Inheritance.equals("NonInherited"))
			{

				id= CreateAllSubscription.NonInheritedDealerId;
				System.out.println("nonInheritedDealerid: "+id);

			}
			else if(level.equals("Customer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllSubscription.DealerInheritedWithCustCustId;
				System.out.println("DealerwithCustCustid: "+id);
			}
			else if(level.equals("CAT") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllSubscription.DealerInheritedWithCustCATId;
				System.out.println("DealerwithCustCAtid: "+id);

			}
			else if(level.equals("Dealer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllSubscription.DealerInheritedWithCustDealerParentId;
				System.out.println("DealerwithCustDealerid: "+id);

			}
			else if(level.equals("Customer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllSubscription.CustinheritedWithCatcustParentId;
				System.out.println("CustwithCatCustid: "+id);

			}
			else if(level.equals("CAT") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllSubscription.CustInheritedWithCatCATId;
				System.out.println("CustwithCatCustid: "+id);

			}
			else if(level.equals("Dealer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllSubscription.CustInheritedWithCatDealerId;
				System.out.println("CustwithCatCustid: "+id);

			}


			APIReponse APIObj = CommonMethods_DeleteSubscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST",id);
			Delresponse = APIObj.getResponse();
			DeletionStatusCode = APIObj.getStatusCode();
			String StatusCode =Integer.toString(DeletionStatusCode);
			String DeletionFailurereason =APIObj.getFailureReason();
			
			if(StatusCode.equals(ExpectedDeleteResponse))
			{
				System.out.println("Subscription Deleted for:"+level);
			}
			else
			{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedDeleteResponse, "ActualStatusCodewithFailureReason is:"+DeletionStatusCode +":"+DeletionFailurereason);
			}


			/*if(Delresponse.equals(null))
			{
				if (!DeletionStatusCode.equals(200))
				{
					throw new CustomisedException("Deleting Subscription failed with :"+StatusCode,DeletionFailurereason.toString());
				}
				throw new CustomisedException("Delete SubscriptionResponse:" +StatusCode,DeletionFailurereason.toString()) ;
			}*/

		}

		catch(Exception e)
		{
			//e.printStackTrace();
			throw new CustomisedException("Check SubscriptionDeleteMethod:", e.getMessage().toString());
			//throw obj;

		}
	}

}

