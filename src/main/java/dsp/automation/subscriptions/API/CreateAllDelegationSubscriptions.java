package dsp.automation.subscriptions.API;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

import dsp.automation.utilities.APIReponse;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.DBMapValues;
import dsp.automation.utilities.DSPAutomationException;
//import junit.framework.Assert;
import org.testng.Assert;



public class CreateAllDelegationSubscriptions 
{
	
	public static String DelegatedSubscriptionResponse =null;
	public static String CATLevelCATDelegatedToCustId =null;
	public static String CATLevelCATDelegatedToDealerId =null;
	public static String CATLevelCATDelegatedToCATId =null;
	public static String CATLevelCATDelegatedToCustUserId =null;
	public static String CATLevelCATDelegatedToDealerUserId = null;
	public static String CustInheritedCustDelegatedToCustId =null;
	public static String CustInheritedCustDelegatedToDealerId =null;
	public static String CustInheritedCustDelegatedToCustUserId =null;
	public static String CustInheritedCustDelegatedToDealerUserId =null;
	public static String CustInheritedDealerDelegatedToCustId = null;
	public static String CustInheritedDealerDelegatedToDealerId =null;
	public static String CustInheritedDealerDelegatedToCustUserId =null;
	public static String CustInheritedDealerDelegatedToDealerUserId= null;
	public static String CustInheritedCATDelegatedToCustId =null;
	public static String CustInheritedCATDelegatedToDealerId=null;
	public static String CustInheritedCATDelegatedToCustUserId =null;
	public static String CustInheritedCATDelegatedToDealerUserId =null;
	public static String DealerInheritedDealerDelegatedToCustId =null;
	public static String DealerInheritedDealerDelegatedToDealerId =null;
	public static String DealerInheritedDealerDelegatedToCustUserId =null;
	public static String DealerInheritedDealerDelegatedToDealerUserId =null;
	public static String DealerInheritedCATDelegatedToCustId =null;
	public static String DealerInheritedCATDelegatedToDealerId =null;
	public static String DealerInheritedCATDelegatedToCustUserId = null;
	public static String DealerInheritedCATDelegatedToDealerUserId  =null;
    public static String CustInheritedWithCatCustDelegatedToCustId =null;
    public static String CustInheritedWithCatCustDelegatedToDealerId =null;
    public static String CustInheritedWithCatCustDelegatedToCustUserId =null;
    public static String CustInheritedWithCatCustDelegatedToDealerUserId =null;
    public static String CustInheritedWithCatDealerDelegatedToCustId =null;
    public static String CustInheritedWithCatDealerDelegatedToDealerId=null;
    public static String CustInheritedWithCatDealerDelegatedToCustUserId =null;
    public static String CustInheritedWithCatDealerDelegatedToDealerUserId =null;
    public static String CustInheritedWithCatCatDelegatedToDealerUserId =null;
    public static String CustInheritedWithCatCatDelegatedToCustUserId =null;
    public static String CustInheritedWithCatCatDelegatedToCustId =null;
    public static String CustInheritedWithCatCatDelegatedToDealerId =null; 
   public static String DealerInheritedWithCustCustDelegatedToCustId =null;
   public static String DealerInheritedWithCustCustDelegatedToDealerId =null;
   public static String DealerInheritedWithCustCustDelegatedToCustUserId =null;
   public static String DealerInheritedWithCustCustDelegatedToDealerUserId =null;
   public static String DealerInheritedWithCustDealerDelegatedToCustId =null;
   public static String DealerInheritedWithCustDealerDelegatedToDealerId =null;
   public static String DealerInheritedWithCustDealerDelegatedToCustUserId =null;
   public static String DealerInheritedWithCustDealerDelegatedToDealerUserId =null;
   public static String DealerInheritedWithCustCatDelegatedToCustId =null;
   public static String DealerInheritedWithCustCatDelegatedToDealerId=null;
   public static String DealerInheritedWithCustCatDelegatedToCustUserId=null;
   public static String DealerInheritedWithCustCatDelegatedToDealerUserId=null;
   public static String NonInheritedCustDelegatedToCustId=null;
   public static String NonInheritedCustDelegatedToDealerId=null;
   public static String NonInheritedCustDelegatedToCustUserId=null;
   public static String NonInheritedCustDelegatedToDealerUserId=null;
   public static String NonInheritedDealerDelegatedToCustId=null;
   public static String NonInheritedDealerDelegatedToDealerId=null;
   public static String NonInheritedDealerDelegatedToCustUserId=null;
   public static String NonInheritedDealerDelegatedToDealerUserId=null;
   public static String NonInheritedCatDelegatedToCustId=null;
   public static String NonInheritedCatDelegatedToDealerId=null;
   public static String NonInheritedCatDelegatedToCustUserId=null;
   public static String NonInheritedCatDelegatedToDealerUserId=null;
    
	
	public static void CreateDelegatedSubscription(String parentId,String make, String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId,String DelegatedFrom, String DelegatedTo , String Inheritance, String ExpectedResponse) throws IOException, CustomisedException
	{
		Integer DelegationSubscriptionStatusCode =null;
		
		if (Inheritance.equals("CatLevel"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
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
				
				creatsub.setParentId(CreateAllSubscription.CATLevelCATId);
				
				Gson gson = new Gson();
				String CreateDelegationRequest = gson.toJson(creatsub);
				System.out.println("CreateDelegationRequest:" +Inheritance+DelegatedFrom+"to"+DelegatedTo +":"  +CreateDelegationRequest);
				String requestBody  = CreateDelegationRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";
				 
				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				DelegatedSubscriptionResponse = APIObj.getResponse();
				
				DelegationSubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(DelegationSubscriptionStatusCode);
				String SubscriptionDelegationFailurereason =APIObj.getFailureReason();
					
				
				if(StatusCode.equals(ExpectedResponse) && DelegatedTo.equals("CAT"))
				{
					System.out.println("Subscription DelegationTo CAT is not Possible:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					
				}
				else if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
				}
				else if(!StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Not Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCode with FailureReason is:"+DelegationSubscriptionStatusCode +":"+SubscriptionDelegationFailurereason);
				}
						
				if (DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCustId:" +CATLevelCATDelegatedToCustId);
				}
				else if (DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToDealerId:" +CATLevelCATDelegatedToDealerId);
					
				}
				/*else if (DelegatedTo.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCATId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCATId:" +CATLevelCATDelegatedToCATId);
					
				}*/
				else if (DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCustUserId:" +CATLevelCATDelegatedToCustUserId);
					
				}
				else if (DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToDealerUserId:" +CATLevelCATDelegatedToDealerUserId);
					
				}
			
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				throw new CustomisedException("Check SubscriptionCreateMethod for CatLevelSubscription:", e.getMessage().toString());
				
		   }
	
      }
		if (Inheritance.equals("CustInherited"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
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
				
				if(DelegatedFrom.equals("Customer"))
				{
					creatsub.setParentId(CreateAllSubscription.CustinheritedcustParentId);

				}
				else if(DelegatedFrom.equals("Dealer"))
				{
					creatsub.setParentId(CreateAllSubscription.CustInheritedDealerId);
				}
				else if (DelegatedFrom.equals("CAT"))
				{
					creatsub.setParentId(CreateAllSubscription.CustInheritedCATId);
				}
								
				Gson gson = new Gson();
				String CreateDelegationRequest = gson.toJson(creatsub);
				System.out.println("CreateDelegationRequest:" +Inheritance+DelegatedFrom+"to"+DelegatedTo +":"  +CreateDelegationRequest);
				String requestBody  = CreateDelegationRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";
				 
				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				DelegatedSubscriptionResponse = APIObj.getResponse();
				
				DelegationSubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(DelegationSubscriptionStatusCode);
				String SubscriptionDelegationFailurereason =APIObj.getFailureReason();
								
				if(StatusCode.equals(ExpectedResponse) && DelegatedTo.equals("CAT"))
				{
					System.out.println("Subscription DelegationTo CAT is not Possible:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					
				}
				else if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
				}
				else if(!StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Not Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCode with FailureReason is:"+DelegationSubscriptionStatusCode +":"+SubscriptionDelegationFailurereason);
				}
				
				if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCustDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CustInheritedCustDelegatedToCustId:" +CustInheritedCustDelegatedToCustId);
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCustDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CustInheritedCustDelegatedToDealerId:" +CustInheritedCustDelegatedToDealerId);
					
				}
				/*else if (DelegatedTo.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCATId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCATId:" +CATLevelCATDelegatedToCATId);
					
				}*/
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCustDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CustInheritedCustDelegatedToCustUserId:" +CustInheritedCustDelegatedToCustUserId);
					
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCustDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CustInheritedCustDelegatedToDealerUserId:" +CustInheritedCustDelegatedToDealerUserId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedDealerDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CustInheritedDealerDelegatedToCustId:" +CustInheritedDealerDelegatedToCustId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedDealerDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CustInheritedDealerDelegatedToDealerId:" +CustInheritedDealerDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedDealerDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CustInheritedDealerDelegatedToCustUserId:" +CustInheritedDealerDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedDealerDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CustInheritedDealerDelegatedToDealerUserId:" +CustInheritedDealerDelegatedToDealerUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCATDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CustInheritedCATDelegatedToCustId:" +CustInheritedCATDelegatedToCustId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCATDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CustInheritedCATDelegatedToDealerId:" +CustInheritedCATDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCATDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CustInheritedCATDelegatedToCustUserId:" +CustInheritedCATDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedCATDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CustInheritedCATDelegatedToDealerUserId:" +CustInheritedCATDelegatedToDealerUserId);
										
				}
			
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				throw new CustomisedException("Check SubscriptionCreateMethod for CustInheritedSubscription:", e.getMessage().toString());
				
		   }
	
      }
		if (Inheritance.equals("DealerInherited"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
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
				
				/*if(DelegatedFrom.equals("Customer"))
				{
					creatsub.setParentId(CreateAllSubscription.CustinheritedcustParentId);

				}*/
				if(DelegatedFrom.equals("Dealer"))
				{
					creatsub.setParentId(CreateAllSubscription.DealerInheritedDealerParentId);
				}
				else if (DelegatedFrom.equals("CAT"))
				{
					creatsub.setParentId(CreateAllSubscription.DealerInheritedCATId);
				}
								
				Gson gson = new Gson();
				String CreateDelegationRequest = gson.toJson(creatsub);
				System.out.println("CreateDelegationRequest:" +Inheritance+DelegatedFrom+"to"+DelegatedTo  +":"  +CreateDelegationRequest);
				String requestBody  = CreateDelegationRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";
				 
				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				DelegatedSubscriptionResponse = APIObj.getResponse();
				
				DelegationSubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(DelegationSubscriptionStatusCode);
				String SubscriptionDelegationFailurereason =APIObj.getFailureReason();
								
				if(StatusCode.equals(ExpectedResponse) && DelegatedTo.equals("CAT"))
				{
					System.out.println("Subscription DelegationTo CAT is not Possible:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					
				}
				else if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
				}
				else if(!StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Not Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCode with FailureReason is:"+DelegationSubscriptionStatusCode +":"+SubscriptionDelegationFailurereason);
				}
				                				
				if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedDealerDelegatedToCustId = jsonobj.getString("id");
					System.out.println("DealerInheritedDealerDelegatedToCustId:" +DealerInheritedDealerDelegatedToCustId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedDealerDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("DealerInheritedDealerDelegatedToDealerId:" +DealerInheritedDealerDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedDealerDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedDealerDelegatedToCustUserId:" +DealerInheritedDealerDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedDealerDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedDealerDelegatedToDealerUserId:" +DealerInheritedDealerDelegatedToDealerUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedCATDelegatedToCustId = jsonobj.getString("id");
					System.out.println("DealerInheritedCATDelegatedToCustId:" +DealerInheritedCATDelegatedToCustId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedCATDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("DealerInheritedCATDelegatedToDealerId:" +DealerInheritedCATDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedCATDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedCATDelegatedToCustUserId:" +DealerInheritedCATDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedCATDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedCATDelegatedToDealerUserId:" +DealerInheritedCATDelegatedToDealerUserId);
				}
			
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				throw new CustomisedException("Check SubscriptionCreateMethod for DealerInheritedSubscription:", e.getMessage().toString());
				
		   }
	
      }
		if (Inheritance.equals("CustInheritedWithCat"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
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
				
				if(DelegatedFrom.equals("Customer"))
				{
					creatsub.setParentId(CreateAllSubscription.CustinheritedWithCatcustParentId);

				}
				else if(DelegatedFrom.equals("Dealer"))
				{
					creatsub.setParentId(CreateAllSubscription.CustInheritedWithCatDealerId);
				}
				else if (DelegatedFrom.equals("CAT"))
				{
					creatsub.setParentId(CreateAllSubscription.CustInheritedWithCatCATId);
				}
								
				Gson gson = new Gson();
				String CreateDelegationRequest = gson.toJson(creatsub);
				System.out.println("CreateDelegationRequest:" +Inheritance+DelegatedFrom+"to"+DelegatedTo +":"  +CreateDelegationRequest);
				String requestBody  = CreateDelegationRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";
				 
				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				DelegatedSubscriptionResponse = APIObj.getResponse();
				
				DelegationSubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(DelegationSubscriptionStatusCode);
				String SubscriptionDelegationFailurereason =APIObj.getFailureReason();
								
				if(StatusCode.equals(ExpectedResponse) && DelegatedTo.equals("CAT"))
				{
					System.out.println("Subscription DelegationTo CAT is not Possible:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					
				}
				else if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
				}
				else if(!StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Not Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCode with FailureReason is:"+DelegationSubscriptionStatusCode +":"+SubscriptionDelegationFailurereason);
				}
				
				if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCustDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCustDelegatedToCustId:" +CustInheritedWithCatCustDelegatedToCustId);
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCustDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCustDelegatedToDealerId:" +CustInheritedWithCatCustDelegatedToDealerId);
					
				}
				/*else if (DelegatedTo.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCATId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCATId:" +CATLevelCATDelegatedToCATId);
					
				}*/
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCustDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCustDelegatedToCustUserId:" +CustInheritedWithCatCustDelegatedToCustUserId);
					
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCustDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCustDelegatedToDealerUserId:" +CustInheritedWithCatCustDelegatedToDealerUserId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatDealerDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatDealerDelegatedToCustId:" +CustInheritedWithCatDealerDelegatedToCustId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatDealerDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatDealerDelegatedToDealerId:" +CustInheritedWithCatDealerDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatDealerDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatDealerDelegatedToCustUserId:" +CustInheritedWithCatDealerDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatDealerDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatDealerDelegatedToDealerUserId:" +CustInheritedWithCatDealerDelegatedToDealerUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCatDelegatedToCustId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCatDelegatedToCustId:" +CustInheritedWithCatCatDelegatedToCustId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCatDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCatDelegatedToDealerId:" +CustInheritedWithCatCatDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCatDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCatDelegatedToCustUserId:" +CustInheritedWithCatCatDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CustInheritedWithCatCatDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("CustInheritedWithCatCatDelegatedToDealerUserId:" +CustInheritedWithCatCatDelegatedToDealerUserId);
										
				}
			
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				throw new CustomisedException("Check SubscriptionCreateMethod for CustInheritedWithCatSubscription:", e.getMessage().toString());
				
		   }
	
      }	
		if (Inheritance.equals("DealerInheritedWithCust"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
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
				
				if(DelegatedFrom.equals("Customer"))
				{
					creatsub.setParentId(CreateAllSubscription.DealerInheritedWithCustCustId);

				}
				else if(DelegatedFrom.equals("Dealer"))
				{
					creatsub.setParentId(CreateAllSubscription.DealerInheritedWithCustDealerParentId);
				}
				else if (DelegatedFrom.equals("CAT"))
				{
					creatsub.setParentId(CreateAllSubscription.DealerInheritedWithCustCATId);
				}
								
				Gson gson = new Gson();
				String CreateDelegationRequest = gson.toJson(creatsub);
				System.out.println("CreateDelegationRequest:" +Inheritance+DelegatedFrom+"to"+DelegatedTo  +":"  +CreateDelegationRequest);
				String requestBody  = CreateDelegationRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";
				 
				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				DelegatedSubscriptionResponse = APIObj.getResponse();
				
				DelegationSubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(DelegationSubscriptionStatusCode);
				String SubscriptionDelegationFailurereason =APIObj.getFailureReason();
								
				if(StatusCode.equals(ExpectedResponse) && DelegatedTo.equals("CAT"))
				{
					System.out.println("Subscription DelegationTo CAT is not Possible:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					
				}
				else if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
				}
				else if(!StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Not Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCode with FailureReason is:"+DelegationSubscriptionStatusCode +":"+SubscriptionDelegationFailurereason);
				}
                				
				if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCustDelegatedToCustId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCustDelegatedToCustId:" +DealerInheritedWithCustCustDelegatedToCustId);
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCustDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCustDelegatedToDealerId:" +DealerInheritedWithCustCustDelegatedToDealerId);
					
				}
				/*else if (DelegatedTo.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCATId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCATId:" +CATLevelCATDelegatedToCATId);
					
				}*/
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCustDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCustDelegatedToCustUserId:" +DealerInheritedWithCustCustDelegatedToCustUserId);
					
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCustDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCustDelegatedToDealerUserId:" +DealerInheritedWithCustCustDelegatedToDealerUserId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustDealerDelegatedToCustId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustDealerDelegatedToCustId:" +DealerInheritedWithCustDealerDelegatedToCustId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustDealerDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustDealerDelegatedToDealerId:" +DealerInheritedWithCustDealerDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustDealerDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustDealerDelegatedToCustUserId:" +DealerInheritedWithCustDealerDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustDealerDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustDealerDelegatedToDealerUserId:" +DealerInheritedWithCustDealerDelegatedToDealerUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCatDelegatedToCustId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCatDelegatedToCustId:" +DealerInheritedWithCustCatDelegatedToCustId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCatDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCatDelegatedToDealerId:" +DealerInheritedWithCustCatDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCatDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCatDelegatedToCustUserId:" +DealerInheritedWithCustCatDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					DealerInheritedWithCustCatDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("DealerInheritedWithCustCatDelegatedToDealerUserId:" +DealerInheritedWithCustCatDelegatedToDealerUserId);
										
				}
			
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				throw new CustomisedException("Check SubscriptionCreateMethod for DealerInheritedWithCustSubscription:", e.getMessage().toString());
				
		   }
	
      }	
		if (Inheritance.equals("NonInherited"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
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
				
				if(DelegatedFrom.equals("Customer"))
				{
					creatsub.setParentId(CreateAllSubscription.NonInheritedcustId);

				}
				else if(DelegatedFrom.equals("Dealer"))
				{
					creatsub.setParentId(CreateAllSubscription.NonInheritedDealerId);
				}
				else if (DelegatedFrom.equals("CAT"))
				{
					creatsub.setParentId(CreateAllSubscription.NonInheritedCATId);
				}
								
				Gson gson = new Gson();
				String CreateDelegationRequest = gson.toJson(creatsub);
				System.out.println("CreateDelegationRequest:" +Inheritance+DelegatedFrom+"to"+DelegatedTo +":"  +CreateDelegationRequest);
				String requestBody  = CreateDelegationRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";
				 
				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				DelegatedSubscriptionResponse = APIObj.getResponse();
				
				DelegationSubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(DelegationSubscriptionStatusCode);
				String SubscriptionDelegationFailurereason =APIObj.getFailureReason();
								
				if(StatusCode.equals(ExpectedResponse) && DelegatedTo.equals("CAT"))
				{
					System.out.println("Subscription DelegationTo CAT is not Possible:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					
				}
				else if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
				}
				else if(!StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Delegation Not Created for:" +Inheritance+DelegatedFrom+"to"+DelegatedTo );
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCode with FailureReason is:"+DelegationSubscriptionStatusCode +":"+SubscriptionDelegationFailurereason);
				}
				                				
				if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCustDelegatedToCustId = jsonobj.getString("id");
					System.out.println("NonInheritedCustDelegatedToCustId:" +NonInheritedCustDelegatedToCustId);
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCustDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("NonInheritedCustDelegatedToDealerId:" +NonInheritedCustDelegatedToDealerId);
					
				}
				/*else if (DelegatedTo.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					CATLevelCATDelegatedToCATId = jsonobj.getString("id");
					System.out.println("CATLevelCATDelegatedToCATId:" +CATLevelCATDelegatedToCATId);
					
				}*/
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCustDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("NonInheritedCustDelegatedToCustUserId:" +NonInheritedCustDelegatedToCustUserId);
					
				}
				else if (DelegatedFrom.equals("Customer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCustDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("NonInheritedCustDelegatedToDealerUserId:" +NonInheritedCustDelegatedToDealerUserId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedDealerDelegatedToCustId = jsonobj.getString("id");
					System.out.println("NonInheritedDealerDelegatedToCustId:" +NonInheritedDealerDelegatedToCustId);
					
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedDealerDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("NonInheritedDealerDelegatedToDealerId:" +NonInheritedDealerDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedDealerDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("NonInheritedDealerDelegatedToCustUserId:" +NonInheritedDealerDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("Dealer") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedDealerDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("NonInheritedDealerDelegatedToDealerUserId:" +NonInheritedDealerDelegatedToDealerUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCatDelegatedToCustId = jsonobj.getString("id");
					System.out.println("NonInheritedCatDelegatedToCustId:" +NonInheritedCatDelegatedToCustId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCatDelegatedToDealerId = jsonobj.getString("id");
					System.out.println("NonInheritedCatDelegatedToDealerId:" +NonInheritedCatDelegatedToDealerId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("CustUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCatDelegatedToCustUserId = jsonobj.getString("id");
					System.out.println("NonInheritedCatDelegatedToCustUserId:" +NonInheritedCatDelegatedToCustUserId);
										
				}
				else if (DelegatedFrom.equals("CAT") && DelegatedTo.equals("DealerUser"))
				{
					JSONObject jsonobj = new JSONObject(DelegatedSubscriptionResponse);
					NonInheritedCatDelegatedToDealerUserId = jsonobj.getString("id");
					System.out.println("NonInheritedCatDelegatedToDealerUserId:" +NonInheritedCatDelegatedToDealerUserId);
										
				}
			
			}
			catch(Exception e)
			{
				//e.printStackTrace();
				throw new CustomisedException("Check SubscriptionCreateMethod for CatLevelSubscription:", e.getMessage().toString());
				
		   }
	
		}	

  }
}	