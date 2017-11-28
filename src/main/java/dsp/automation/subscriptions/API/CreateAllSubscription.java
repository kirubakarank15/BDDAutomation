package dsp.automation.subscriptions.API;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

//import APIAutomation.APIReponse;
//import ReusableUtils.CommonMethods;
//import ReusableUtils.CommonMethods_Subscriptions;
import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;
import dsp.automation.utilities.CustomisedException;
import dsp.automation.utilities.DBMapValues;
import dsp.automation.utilities.DSPAutomationException;

public class CreateAllSubscription 
{


	public static String SubscriptionResponse= null;
	public static String CustinheritedcustParentId =null;
	public static String CustInheritedDealerId =null;
	public static String CustInheritedCATId =null;
	public static String DealerInheritedDealerParentId =null;
	public static String DealerInheritedCATId = null;
	public static String DealerInheritedWithCustDealerParentId = null;
	public static String DealerInheritedWithCustCustId =null;
	public static String DealerInheritedWithCustCATId =null;
	public static String CustinheritedWithCatcustParentId =null;
	public static String CustInheritedWithCatDealerId =null;
	public static String CustInheritedWithCatCATId = null;
	public static String NonInheritedcustId =null;
	public static String NonInheritedDealerId=null;
	public static String NonInheritedCATId=null;
	public static String CATLevelCATId =null;

	public static void SubscriptionCreate(String parentId, String make,String serialNumber, String siteId, String typeId, String level, String origin, String organization, String organizationType, String associatedOrganization, String associatedOrganizationType, String dcn, String billingtUserAccountId,String RequestLevel,String ExpectedResponse,String Inheritance) throws IOException, CustomisedException 
	{
		Integer SubscriptionStatusCode =null;

		if (Inheritance.equals("CustInherited"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
				//creatsub.setParentId(parentId);
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
				creatsub.setSiteId(siteId);
				creatsub.setTypeId(typeId);

				if(RequestLevel.equals("Customer"))
				{
					creatsub.setParentId(parentId);

				}
				else if(RequestLevel.equals("Dealer"))
				{
					try {

						creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=3"));
					} catch (CustomisedException e) {
						throw new CustomisedException("DB Error in Setting Parent id for DealerLevel for Custinherited:",  e.getMessage().toString());
					}
				}
				else if (RequestLevel.equals("CAT"))
				{
					try{
						creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=3"));
					}catch (CustomisedException e) {
						throw new CustomisedException("DB Error in Setting Parent id for CATLevel for Custinherited:",  e.getMessage().toString());
					}
				}

				Gson gson = new Gson();
				String CreateRequest = gson.toJson(creatsub);
				System.out.println("CreateRequest:" +Inheritance+RequestLevel +":"+ CreateRequest);
				String requestBody  = CreateRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";

				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				SubscriptionResponse = APIObj.getResponse();
				SubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(SubscriptionStatusCode);
				String SubscriptionFailurereason =APIObj.getFailureReason();
				
				if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Created for:"+RequestLevel);
					
				}			
				else
				{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCodewithFailureReason is:"+SubscriptionStatusCode +":"+SubscriptionFailurereason);
				}
				
				if  (RequestLevel.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CustinheritedcustParentId = jsonobj.getString("id");
					System.out.println("CustParentId:" +CustinheritedcustParentId);
				}

				else if (RequestLevel.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CustInheritedDealerId = jsonobj.getString("id");
					System.out.println("DealerId:" +CustInheritedDealerId);
				}
				else if (RequestLevel.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CustInheritedCATId = jsonobj.getString("id");
					System.out.println("CatId:" +CustInheritedCATId);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
				CustomisedException obj = new CustomisedException("Check SubscriptionCreateMethod for CustInherited Subscription:", e.getMessage().toString());
				throw obj;

			}
		}
		else if (Inheritance.equals("DealerInherited"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
				//creatsub.setParentId(parentId);
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
				creatsub.setSiteId(siteId);
				creatsub.setTypeId(typeId);

				if(RequestLevel.equals("Dealer"))
				{
					creatsub.setParentId(parentId);

				}
				else if (RequestLevel.equals("CAT"))
				{
					try{
						creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=2"));
					}catch (CustomisedException e) {
						throw new CustomisedException("DB Error in Setting Parent id for CATLevel for Dealerinherited: ",  e.getMessage().toString());
					}
				}

				Gson gson = new Gson();
				String CreateRequest = gson.toJson(creatsub);
				System.out.println("CreateRequest:" +Inheritance+RequestLevel +":"+ CreateRequest);
				String requestBody  = CreateRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";

				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				SubscriptionResponse = APIObj.getResponse();
				SubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(SubscriptionStatusCode);
				String SubscriptionFailurereason =APIObj.getFailureReason();


				if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Created for:"+RequestLevel);
					
				}			
				else
				{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCodewithFailureReason is:"+SubscriptionStatusCode +":"+SubscriptionFailurereason);
				}

				if (RequestLevel.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					DealerInheritedDealerParentId = jsonobj.getString("id");
					System.out.println("DealerParentId:" +DealerInheritedDealerParentId);
				}
				else if (RequestLevel.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					DealerInheritedCATId = jsonobj.getString("id");
					System.out.println("CatId:" +DealerInheritedCATId);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
				CustomisedException obj = new CustomisedException("Check SubscriptionCreateMethod for DealerInherited Subscription:", e.getMessage().toString());
				throw obj;


			}
		}
		else if (Inheritance.equals("DealerInheritedWithCust"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
				//creatsub.setParentId(parentId);
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
				creatsub.setSiteId(siteId);
				creatsub.setTypeId(typeId);

				if(RequestLevel.equals("Customer"))
				{
					creatsub.setParentId(parentId);

				}
				if(RequestLevel.equals("Dealer"))
				{
					creatsub.setParentId(parentId);

				}

				else if (RequestLevel.equals("CAT"))
				{
					try{
						creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=2"));
					}catch (CustomisedException e) {
						throw new CustomisedException("DB Error in Setting Parent id for CATLevel for DealerinheritedWithCust Subscription:",  e.getMessage().toString());
					}
				}

				Gson gson = new Gson();
				String CreateRequest = gson.toJson(creatsub);
				System.out.println("CreateRequest:" +Inheritance+RequestLevel +":"+ CreateRequest);
				String requestBody  = CreateRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";

				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				SubscriptionResponse = APIObj.getResponse();
				SubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(SubscriptionStatusCode);
				String SubscriptionFailurereason =APIObj.getFailureReason();


				if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Created for:"+RequestLevel);
					
				}			
				else
				{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCodewithFailureReason is:"+SubscriptionStatusCode +":"+SubscriptionFailurereason);
				}
				
				if (RequestLevel.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					DealerInheritedWithCustCustId = jsonobj.getString("id");
					System.out.println("CustId:" +DealerInheritedWithCustCustId);
				}

				else if (RequestLevel.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					DealerInheritedWithCustDealerParentId = jsonobj.getString("id");
					System.out.println("DealerId:" +DealerInheritedWithCustDealerParentId);
				}
				else if (RequestLevel.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					DealerInheritedWithCustCATId = jsonobj.getString("id");
					System.out.println("CatParentId:" +DealerInheritedWithCustCATId);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
				CustomisedException obj = new CustomisedException("Check SubscriptionCreateMethod for DealerinheritedWithCustsubscription:", e.getMessage().toString());
				throw obj;

			}
		}

		else if (Inheritance.equals("CatLevel"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
				//creatsub.setParentId(parentId);
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
				creatsub.setSiteId(siteId);
				creatsub.setTypeId(typeId);

				if(RequestLevel.equals("CAT"))
				{
					creatsub.setParentId(parentId);

				}

				Gson gson = new Gson();
				String CreateRequest = gson.toJson(creatsub);
				System.out.println("CreateRequest:" +Inheritance+RequestLevel +":"+ CreateRequest);
				String requestBody  = CreateRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";

				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				SubscriptionResponse = APIObj.getResponse();
				SubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(SubscriptionStatusCode);
				String SubscriptionFailurereason =APIObj.getFailureReason();
		
				if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Created for:"+RequestLevel);
					
				}			
				else
				{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCodewithFailureReason is:"+SubscriptionStatusCode +":"+SubscriptionFailurereason);
				}

				if (RequestLevel.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CATLevelCATId = jsonobj.getString("id");
					System.out.println("CatParentId:" +CATLevelCATId);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
				CustomisedException obj = new CustomisedException("Check SubscriptionCreateMethod for CatLevelsubscription:", e.getMessage().toString());
				throw obj;
			}
		}
		if (Inheritance.equals("CustInheritedWithCat"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
				//creatsub.setParentId(parentId);
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
				creatsub.setSiteId(siteId);
				creatsub.setTypeId(typeId);

				if(RequestLevel.equals("Customer"))
				{
					creatsub.setParentId(parentId);

				}
				else if(RequestLevel.equals("Dealer"))
				{
					try {

						creatsub.setParentId(DBMapValues.dbValue("GUI_ID", "Select GUI_ID from [dsp].[AssetSubscription] where asset_id in (select asset_id from [dsp].[Asset] where serial_number = '"+serialNumber+"') and User_type_id=3"));
					} catch (CustomisedException e) {
						throw new CustomisedException("DB Error in Setting Parent id for DealerLevel for CustinheritedWithCat:",  e.getMessage().toString());
					}
				}
				else if (RequestLevel.equals("CAT"))
				{
					creatsub.setParentId(parentId);
				}

				Gson gson = new Gson();
				String CreateRequest = gson.toJson(creatsub);
				System.out.println("CreateRequest:" +Inheritance+RequestLevel +":"+ CreateRequest);
				String requestBody  = CreateRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";

				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				SubscriptionResponse = APIObj.getResponse();
				SubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(SubscriptionStatusCode);
				String SubscriptionFailurereason =APIObj.getFailureReason();


				if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Created for:"+RequestLevel);
					
				}			
				else
				{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCodewithFailureReason is:"+SubscriptionStatusCode +":"+SubscriptionFailurereason);
				}
				
				if  (RequestLevel.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CustinheritedWithCatcustParentId = jsonobj.getString("id");
					System.out.println("CustParentId:" +CustinheritedWithCatcustParentId);
				}

				else if (RequestLevel.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CustInheritedWithCatDealerId = jsonobj.getString("id");
					System.out.println("DealerId:" +CustInheritedWithCatDealerId);
				}
				else if (RequestLevel.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					CustInheritedWithCatCATId = jsonobj.getString("id");
					System.out.println("CatParentId:" +CustInheritedWithCatCATId);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
				CustomisedException obj = new CustomisedException("Check SubscriptionCreateMethod for CustInheritedWithCatsubscription:", e.getMessage().toString());
				throw obj;
			}
		}
		if (Inheritance.equals("NonInherited"))
		{
			try
			{
				CreateSubscription creatsub = new CreateSubscription();
				creatsub.setSerialNumber(serialNumber);
				//creatsub.setParentId(parentId);
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
				creatsub.setSiteId(siteId);
				creatsub.setTypeId(typeId);

				if(RequestLevel.equals("Customer"))
				{
					creatsub.setParentId(parentId);

				}
				else if(RequestLevel.equals("Dealer"))
				{
					creatsub.setParentId(parentId);
				}
				else if (RequestLevel.equals("CAT"))
				{
					creatsub.setParentId(parentId);
				}

				Gson gson = new Gson();
				String CreateRequest = gson.toJson(creatsub);
				System.out.println("CreateRequest:" +Inheritance+RequestLevel +":"+ CreateRequest);
				String requestBody  = CreateRequest;
				String postAPIContentType = "application/subscriptions-v1+json";
				String postAPIAcceptType = "application/subscriptions-v1+json";

				APIReponse APIObj = CommonMethods_Subscriptions.apiexecutuion(requestBody, postAPIContentType, postAPIAcceptType,"POST");
				SubscriptionResponse = APIObj.getResponse();
				SubscriptionStatusCode = APIObj.getStatusCode();
				String StatusCode =Integer.toString(SubscriptionStatusCode);
				String SubscriptionFailurereason =APIObj.getFailureReason();


				if(StatusCode.equals(ExpectedResponse))
				{
					System.out.println("Subscription Created for:"+RequestLevel);
					
				}			
				else
				{
					throw new CustomisedException("ExpectedStatusCode is:"+ExpectedResponse, "ActualStatusCodewithFailureReason is:"+SubscriptionStatusCode +":"+SubscriptionFailurereason);
				}
				
				if  (RequestLevel.equals("Customer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					NonInheritedcustId = jsonobj.getString("id");
					System.out.println("CustParentId:" +NonInheritedcustId);
				}

				else if (RequestLevel.equals("Dealer"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					NonInheritedDealerId = jsonobj.getString("id");
					System.out.println("DealerId:" +NonInheritedDealerId);
				}
				else if (RequestLevel.equals("CAT"))
				{
					JSONObject jsonobj = new JSONObject(SubscriptionResponse);
					NonInheritedCATId = jsonobj.getString("id");
					System.out.println("CatParentId:" +NonInheritedCATId);
				}

			}
			catch(Exception e)
			{
				e.printStackTrace();
				CustomisedException obj = new CustomisedException("Check SubscriptionCreateMethod for NonInheritedsubscription:", e.getMessage().toString());
				throw obj;


			}
		}

	}
}
