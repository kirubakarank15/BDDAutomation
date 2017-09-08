package stepDefenition;

import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import dsp.automation.EquipmentData.API.AssetRegisterED;
import dsp.automation.EquipmentData.API.Common_methods_ED;
import dsp.automation.AssetStructures.API.Common_methods;

public class EquipmentData_API {
	 Common_methods_ED reusemethods = new Common_methods_ED();
	//static String AssetSNo;
	static HttpPost request;
	static int StatusCode;
	static int counter=0;
	static List<String> AssetSerialNumbers= Common_methods.SerialNumbers;
	@Given("^Construct EquipmentData Request API with SerialNumber and \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\"$")
	public void construct_EquipmentData_Request_API_with_SerialNumber_and(String ManufacturerCode, String ProductWorkCode, String Model, String ManufacturingYear, String OnwerType, String DealerCustomerNumber, String EquipmentID, String VinNumber, String DealerCode) throws Throwable {
		 //AssetSNo = Common_methods.SerialNumber;
	reusemethods.AssetTemplate(ManufacturerCode, ProductWorkCode, Model, ManufacturingYear, OnwerType, DealerCustomerNumber, EquipmentID, VinNumber, DealerCode);
	}
	
	@And("^Execute the API$")
	public void execute_the_API() throws Throwable {
		 HttpPost request = reusemethods.addingHeaderstourl();
		 HttpResponse httpResponse =  reusemethods.apiExecution(request);
		 StatusCode = httpResponse.getStatusLine().getStatusCode();
		 
	}

	@Then("^Validate Successful API Response and \"([^\"]*)\" of the EquipmentData Request API$")
	public void validate_Successful_API_Response_and_of_the_EquipmentData_Request_API(int APIResponsecode) throws Throwable {
	
	    if(StatusCode==APIResponsecode)
	    {
	    	System.out.println("ED Customer Record is created for:" +"\t" +AssetSerialNumbers.get(counter));
	    }
	    
	    else
	    {
	    	System.out.println("ED Customer Record is not created for:" +"\t" +AssetSerialNumbers.get(counter));
	    }
		counter++;
	}
}
