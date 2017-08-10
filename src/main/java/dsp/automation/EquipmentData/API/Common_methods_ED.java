package dsp.automation.EquipmentData.API;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.DefaultHttpClient;

import com.cat.manager.tufcrypto.DecryptPropertiesParameters;
import com.google.gson.Gson;

import dsp.automation.AssetStructures.API.Common_methods;

public class Common_methods_ED 
{
	String assetSno;
public void AssetTemplate(String manufacturerCode, String productWorkCode, String Model, String ManufacturingYear, String OnwerType, String DealerCustomerNumber, String EquipmentID, String VinNumber, String DealerCode)
{
	assetSno = Common_methods.SerialNumber;
	System.out.println("AssetSNO:" +assetSno);
	AssetRegisterED assetregister = new AssetRegisterED();
	assetregister.setSerialNumber(assetSno);
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
	
	}
public URI buildingurl() throws FileNotFoundException, IOException {
	Properties properties = new Properties();
	properties.load(new FileInputStream("C:\\Users\\dariss\\Downloads\\Workpaces\\Automation\\Resources\\application.properties"));
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
public void addingHeaderstourl() throws FileNotFoundException, IOException
{
URI uri = buildingurl();
HttpPost request = new HttpPost(uri);
//request.addHeader(name, value);
}

public void getAuthorizationToken() throws Exception
{
	String decrypPwd=null;
	Properties properties = new Properties();
	properties.load(new FileInputStream("C:\\Users\\dariss\\Downloads\\Workpaces\\Automation\\Resources\\application.properties"));
	String encrypPwd = properties.getProperty("ed.Password");
	decrypPwd=DecryptPropertiesParameters.decryptProperties(encrypPwd);
	System.out.println(decrypPwd);
	
	
}

}
