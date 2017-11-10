package dsp.automation.EquipmentData.API;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.jsoup.parser.Parser;

import com.cat.manager.tufcrypto.DecryptPropertiesParameters;
import com.google.gson.Gson;
import com.google.gson.JsonParser;

import dsp.automation.AssetStructures.API.Common_methods;

public class Common_methods_ED 
{ 
	public String assetSno;
	 static List<String> SerialNumbers  = Common_methods.SerialNumbers;
	static int counter=0;
public String AssetTemplate(String manufacturerCode, String productWorkCode, String Model, String ManufacturingYear, String OnwerType, String DealerCustomerNumber, String EquipmentID, String VinNumber, String DealerCode)
{
	AssetRegisterED assetregister = new AssetRegisterED();
	assetregister.setSerialNumber(SerialNumbers.get(counter));
	System.out.println("AssetSNO:" +SerialNumbers.get(counter));
	assetregister.setManufacturerCode(manufacturerCode);
	assetregister.setProdWorkCode(productWorkCode);
	assetregister.setModel(Model);
	assetregister.setManufacturingYear(ManufacturingYear);
	assetregister.setOwnerType(OnwerType);
	assetregister.setDealerCustomerNumber(DealerCustomerNumber);
	assetregister.setEquipmentId(EquipmentID);
	assetregister.setVin(VinNumber);
	assetregister.setDealerCode(DealerCode);
	Gson gson = new Gson();
	String JsonInString = gson.toJson(assetregister);
	System.out.println("RequestBodyED:" +JsonInString);
	//JSONObject requestBody = new JSONObject(JsonInString);
	try {
		PrintWriter writer = new PrintWriter("EDRequestBody.txt","UTF-8");
		writer.println(JsonInString);
		writer.close();
	} catch (IOException e) 
	{

	}
	counter++;
	return JsonInString;
	
	}
public URI buildingurl() throws FileNotFoundException, IOException {
	Properties properties = new Properties();
	properties.load(new FileInputStream("Resources\\application.properties"));
	DefaultHttpClient client = new DefaultHttpClient();
	String Requesturl = properties.getProperty("edUpdateEquipment");
	URI uri = null;
	URIBuilder builder = new URIBuilder();
	builder = builder.setScheme("https").setHost(Requesturl);
	System.out.println("builder:" + builder);
	try {
		uri = builder.build();
	} catch (URISyntaxException e1) {
		e1.printStackTrace();
	}
	return uri; // It will return the formed uri (URL of edUpdateEquipment)
}
public HttpPost addingHeaderstourl() throws Exception
{
StringEntity input = null;
String authorization= getAuthorizationToken();

URI uri = buildingurl();
HttpPost request = new HttpPost(uri);
request.addHeader("Authorization", authorization);
JsonParser parser = new JsonParser();
Object obj = parser.parse(new FileReader("EDRequestBody.txt"));
System.out.println();
input = new StringEntity(obj.toString(), "UTF-8");
input.setContentType("application/addUpdateEquipment-v1+json");
request.addHeader("Accept", "application/json");
//System.out.println("Request Body:" +input);
request.setEntity(input);
return request;

}
public HttpResponse apiExecution(HttpPost request) throws ClientProtocolException, IOException
{
	DefaultHttpClient client = new DefaultHttpClient();
	HttpResponse httpResponse = client.execute(request);
	String response = EntityUtils.toString(httpResponse.getEntity());
	String message = httpResponse.getStatusLine().getReasonPhrase();
	int statusCode = httpResponse.getStatusLine().getStatusCode();
	System.out.println("Response of the API :" +response +" \t" + "status:" +statusCode + "\t" +"Status:" + message);
	return httpResponse;
	}

public String getAuthorizationToken() throws Exception
{
	String eddecrypPwd=null;
	Properties properties = new Properties();
	properties.load(new FileInputStream("Resources\\application.properties"));
	String encrypPwd = properties.getProperty("ed.Password");
	eddecrypPwd=DecryptPropertiesParameters.decryptProperties(encrypPwd);
    String edUsername = properties.getProperty("ed.UserName");
	//System.out.println(decrypPwd);
	byte[] encodedAuth = org.apache.commons.codec.binary.Base64.encodeBase64((edUsername + ":" + eddecrypPwd).getBytes());
	String authorization = "Basic " + new String(encodedAuth);
	return authorization;
}

}
