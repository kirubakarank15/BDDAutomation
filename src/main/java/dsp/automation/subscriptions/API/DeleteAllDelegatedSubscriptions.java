package dsp.automation.subscriptions.API;

import java.io.IOException;

import com.google.gson.Gson;

import dsp.automation.utilities.APIReponse;
import dsp.automation.utilities.CustomisedException;

public class DeleteAllDelegatedSubscriptions
{
	public static String id =null;

	public static void DelegatedSubcriptionDelete(String cancelReason,String DelegatedFrom, String DelegatedTo ,String Inheritance, String ExpectedDeleteResponse ) throws IOException, CustomisedException
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
			System.out.println("DelDelegationRequest:" +Inheritance +DelegatedFrom +"to" +DelegatedTo +":" + DeleteSub);
			String requestBody  = DeleteSub;
			String postAPIContentType = "application/subscriptions-v1+json";
			String postAPIAcceptType = "application/subscriptions-v1+json";


			if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer") && Inheritance.equals("CatLevel"))
			{
				id = CreateAllDelegationSubscriptions.CATLevelCATDelegatedToCustId;
				System.out.println("CATLevelCATDelegatedToCustId: "+id);
			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer") && Inheritance.equals("CatLevel"))
			{
				id = CreateAllDelegationSubscriptions.CATLevelCATDelegatedToDealerId;
				System.out.println("CATLevelCATDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CatLevel"))
			{
				id = CreateAllDelegationSubscriptions.CATLevelCATDelegatedToDealerUserId; //CATLevelCATDelegatedToDealerUserId
				System.out.println("CATLevelCATDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser") && Inheritance.equals("CatLevel"))
			{
				id = CreateAllDelegationSubscriptions.CATLevelCATDelegatedToCustUserId;
				System.out.println("CATLevelCATDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("") && Inheritance.equals("CatLevel"))
			{
				id = CreateAllSubscription.CATLevelCATId;
				System.out.println("CATLevelCATId:"+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCustDelegatedToCustId; 
				System.out.println("CustInheritedCustDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCustDelegatedToDealerId;
				System.out.println("CustInheritedCustDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCustDelegatedToCustUserId;
				System.out.println("CustInheritedCustDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCustDelegatedToDealerUserId;
				System.out.println("CustInheritedCustDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllSubscription.CustinheritedcustParentId;
				System.out.println("CustinheritedcustParentId:"+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedDealerDelegatedToCustId;
				System.out.println("CustInheritedDealerDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedDealerDelegatedToDealerId;
				System.out.println("CustInheritedDealerDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedDealerDelegatedToCustUserId;
				System.out.println("CustInheritedDealerDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedDealerDelegatedToDealerUserId;
				System.out.println("CustInheritedDealerDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("") && Inheritance.equals("CustInherited"))
			{
				id =CreateAllSubscription.CustInheritedDealerId;
				System.out.println("CustInheritedDealerId:"+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCATDelegatedToCustId;
				System.out.println("CustInheritedCATDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCATDelegatedToDealerId;
				System.out.println("CustInheritedCATDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCATDelegatedToCustUserId;
				System.out.println("CustInheritedCATDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedCATDelegatedToDealerUserId;
				System.out.println("CustInheritedCATDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("") && Inheritance.equals("CustInherited"))
			{
				id = CreateAllSubscription.CustInheritedCATId;
				System.out.println("CustInheritedCATId: "+id);

			}

			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedDealerDelegatedToCustId;
				System.out.println("DealerInheritedDealerDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedDealerDelegatedToDealerId;
				System.out.println("DealerInheritedDealerDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedDealerDelegatedToCustUserId;
				System.out.println("DealerInheritedDealerDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedDealerDelegatedToDealerUserId;
				System.out.println("DealerInheritedDealerDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllSubscription.DealerInheritedDealerParentId;
				System.out.println("DealerInheritedDealerParentId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedCATDelegatedToCustId;
				System.out.println("DealerInheritedCATDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedCATDelegatedToDealerId;
				System.out.println("DealerInheritedCATDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedCATDelegatedToCustUserId;
				System.out.println("DealerInheritedCATDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedCATDelegatedToDealerUserId;
				System.out.println("DealerInheritedCATDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("") && Inheritance.equals("DealerInherited"))
			{
				id = CreateAllSubscription.DealerInheritedCATId;
				System.out.println("DealerInheritedCATId: "+id);

			}

			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCustDelegatedToCustId; 
				System.out.println("CustInheritedWithCatCustDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCustDelegatedToDealerId;
				System.out.println("CustInheritedWithCatCustDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCustDelegatedToCustUserId;
				System.out.println("CustInheritedWithCatCustDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCustDelegatedToDealerUserId;
				System.out.println("CustInheritedWithCatCustDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllSubscription.CustinheritedWithCatcustParentId;
				System.out.println("CustinheritedWithCatcustParentId:"+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatDealerDelegatedToCustId;
				System.out.println("CustInheritedWithCatDealerDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatDealerDelegatedToDealerId;
				System.out.println("CustInheritedWithCatDealerDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatDealerDelegatedToCustUserId;
				System.out.println("CustInheritedWithCatDealerDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatDealerDelegatedToDealerUserId;
				System.out.println("CustInheritedWithCatDealerDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("") && Inheritance.equals("CustInheritedWithCat"))
			{
				id =CreateAllSubscription.CustInheritedWithCatDealerId;
				System.out.println("CustInheritedWithCatDealerId:"+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCatDelegatedToCustId;
				System.out.println("CustInheritedWithCatCatDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCatDelegatedToDealerId;
				System.out.println("CustInheritedWithCatCatDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCatDelegatedToCustUserId;
				System.out.println("CustInheritedWithCatCatDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllDelegationSubscriptions.CustInheritedWithCatCatDelegatedToDealerUserId;
				System.out.println("CustInheritedWithCatCatDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("") && Inheritance.equals("CustInheritedWithCat"))
			{
				id = CreateAllSubscription.CustInheritedWithCatCATId;
				System.out.println("CustInheritedWithCatCATId: "+id);

			}

			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCustDelegatedToCustId; 
				System.out.println("DealerInheritedWithCustCustDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCustDelegatedToDealerId;
				System.out.println("DealerInheritedWithCustCustDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCustDelegatedToCustUserId;
				System.out.println("DealerInheritedWithCustCustDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCustDelegatedToDealerUserId;
				System.out.println("DealerInheritedWithCustCustDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllSubscription.DealerInheritedWithCustCustId;
				System.out.println("DealerInheritedWithCustCustId:"+id);

			}

			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustDealerDelegatedToCustId;
				System.out.println("DealerInheritedWithCustDealerDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustDealerDelegatedToDealerId;
				System.out.println("DealerInheritedWithCustDealerDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustDealerDelegatedToCustUserId;
				System.out.println("DealerInheritedWithCustDealerDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustDealerDelegatedToDealerUserId;
				System.out.println("DealerInheritedWithCustDealerDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id =CreateAllSubscription.DealerInheritedWithCustDealerParentId;
				System.out.println("DealerInheritedWithCustDealerParentId:"+id);

			}

			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCatDelegatedToCustId;
				System.out.println("DealerInheritedWithCustCatDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCatDelegatedToDealerId;
				System.out.println("DealerInheritedWithCustCatDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCatDelegatedToCustUserId;
				System.out.println("DealerInheritedWithCustCatDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllDelegationSubscriptions.DealerInheritedWithCustCatDelegatedToDealerUserId;
				System.out.println("DealerInheritedWithCustCatDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("") && Inheritance.equals("DealerInheritedWithCust"))
			{
				id = CreateAllSubscription.DealerInheritedWithCustCATId;
				System.out.println("DealerInheritedWithCustCATId: "+id);

			}

			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCustDelegatedToCustId; 
				System.out.println("NonInheritedCustDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCustDelegatedToDealerId;
				System.out.println("NonInheritedCustDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCustDelegatedToCustUserId;
				System.out.println("NonInheritedCustDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCustDelegatedToDealerUserId;
				System.out.println("NonInheritedCustDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Customer") && DelegatedTo.equals("") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllSubscription.NonInheritedcustId;
				System.out.println("NonInheritedcustId:"+id);

			}

			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedDealerDelegatedToCustId;
				System.out.println("NonInheritedDealerDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedDealerDelegatedToDealerId;
				System.out.println("NonInheritedDealerDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedDealerDelegatedToCustUserId;
				System.out.println("NonInheritedDealerDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedDealerDelegatedToDealerUserId;
				System.out.println("NonInheritedDealerDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("Dealer") && DelegatedTo.equals("") && Inheritance.equals("NonInherited"))
			{
				id =CreateAllSubscription.NonInheritedDealerId;
				System.out.println("NonInheritedDealerId:"+id);

			}

			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCatDelegatedToCustId;
				System.out.println("NonInheritedCatDelegatedToCustId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCatDelegatedToDealerId;
				System.out.println("NonInheritedCatDelegatedToDealerId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCatDelegatedToCustUserId;
				System.out.println("NonInheritedCatDelegatedToCustUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllDelegationSubscriptions.NonInheritedCatDelegatedToDealerUserId;
				System.out.println("NonInheritedCatDelegatedToDealerUserId: "+id);

			}
			else if(DelegatedFrom.equals("CAT") && DelegatedTo.equals("") && Inheritance.equals("NonInherited"))
			{
				id = CreateAllSubscription.NonInheritedCATId;
				System.out.println("NonInheritedCATId: "+id);

			}

			APIReponse APIObj = CommonMethods_DeleteSubscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST",id);
			Delresponse = APIObj.getResponse();
			DeletionStatusCode = APIObj.getStatusCode();
			String StatusCode =Integer.toString(DeletionStatusCode);
			String DeletionFailurereason =APIObj.getFailureReason();

			
			if(DelegatedTo.equals("") && ExpectedDeleteResponse.equals("500")) 
			{
				System.out.println("Parent Subscription Not Deleted:" +Inheritance+DelegatedFrom);
			}
			else if	(StatusCode.equals(ExpectedDeleteResponse))
			{
				if(DelegatedTo.equals(""))
				{
					System.out.println("Parent Subscription Deleted:"+Inheritance+DelegatedFrom);
				}
				System.out.println("Subscription Deleted for:"+Inheritance+DelegatedFrom+DelegatedTo);
			}
			else if(!StatusCode.equals(ExpectedDeleteResponse))
			{
				throw new CustomisedException("ExpectedStatusCode is:"+ExpectedDeleteResponse, "ActualStatusCode with FailureReason is:"+DeletionStatusCode +":"+DeletionFailurereason);
			}

		}

		catch(Exception e)
		{
			//e.printStackTrace();
			throw new CustomisedException("Check DelegationSubscriptionDeleteMethod:", e.getMessage().toString());

		}
	}
}

