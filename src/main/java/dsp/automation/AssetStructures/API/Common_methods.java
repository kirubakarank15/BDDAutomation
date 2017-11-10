package dsp.automation.AssetStructures.API;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.google.gson.JsonParser;

import dsp.automation.utilities.DBMapValues;
import dsp.automation.utilities.ExcelReadWrite_API;
import dsp.automation.utilities.ReusableMethodsAPI;

public class Common_methods {
	// Following function will create instance all the dependent classes.
	// We are creating List for the instances
	public static String SerialNumber = null;
	public static String Radio_1_SerialNumber = null;
	public static String Radio_2_SerialNumber = null;
	public static String Device_id = null;
	public static String Device_component = null;

	public static List<String> SerialNumbers = new ArrayList<String>();
	static Properties properties = new Properties();
	static Properties properties1 = new Properties();
	ExcelReadWrite_API ExcelReadWrite = new ExcelReadWrite_API();
	StringEntity input = null;
	private final static Logger LOGGER = Logger.getLogger(Common_methods.class.getName());

	public void AssetTemplate(String commercialType) throws Exception {
		File fileObj1 = new File("Resources\\application.properties");
		File fileObj2 = new File("Resources\\config.properties");
		properties.load(new FileInputStream(fileObj1));
		properties1.load(new FileInputStream(fileObj2));
		SerialNumber = ReusableMethodsAPI
				.valueIncrementor(DBMapValues.dbValue("Serial_Number", properties.getProperty("db_asset")));
		while (properties1.getProperty("Asset.SerialNumber").equalsIgnoreCase(SerialNumber)) {
			Thread.sleep(1000);
			SerialNumber = ReusableMethodsAPI
					.valueIncrementor(DBMapValues.dbValue("Serial_Number", properties.getProperty("db_asset")));
			LOGGER.info("DB is not updated with latest Serial NO");
		}
		LOGGER.info("DB is updated with latest Serial NO");
		properties1.setProperty("Asset.SerialNumber", SerialNumber);

		Radio_1_SerialNumber = ReusableMethodsAPI.valueIncrementor(
				DBMapValues.dbValue("radio_1_serial_number", properties.getProperty("db_radio_1_serial_number")));
		Radio_2_SerialNumber = ReusableMethodsAPI.valueIncrementor(
				DBMapValues.dbValue("radio_2_serial_number", properties.getProperty("db_radio_2_serial_number")));
		Device_id = ReusableMethodsAPI
				.valueIncrementor(DBMapValues.dbValue("device_id", properties.getProperty("db_deviceid")));
		Device_component = ReusableMethodsAPI.valueIncrementor(
				DBMapValues.dbValue("engine_serial_no", properties.getProperty("db_devicecomponent")));
		// HashMap<String, String> attributes = ExcelReadWrite.excelReadWrite();
		SampleModel samp = new SampleModel();
		String make = properties.getProperty("Asset.make");
		samp.setMake(make);
		SerialNumbers.add(SerialNumber);
		System.out.println("List of SerialNumbers:" + SerialNumbers);
		samp.setSerialNumber(SerialNumber);

		AttachedDevices attachedDevices = new AttachedDevices();

		String Type = properties.getProperty("Asset.type");
		if (commercialType != null) {
			attachedDevices.setCommercialType(commercialType);

			List<AttachedRadios> attachedRadioslst = new ArrayList<AttachedRadios>();
			if (commercialType.contains("+")) {
				AttachedRadios attachedRadios_1 = new AttachedRadios();
				AttachedRadios attachedRadios_2 = new AttachedRadios();
				attachedRadios_1.setSerialNumber(Radio_1_SerialNumber);
				attachedRadioslst.add(attachedRadios_1);

				attachedRadios_2.setSerialNumber(Radio_2_SerialNumber);
				attachedRadioslst.add(attachedRadios_2);
				attachedDevices.setAttachedRadios(attachedRadioslst);
			}

			else {
				AttachedRadios attachedRadios = new AttachedRadios();
				attachedRadios.setSerialNumber(Radio_1_SerialNumber);
				// attachedRadios.setSerialNumber(attributes.get("RadioNumber").split(",")[0]);
				attachedRadioslst.add(attachedRadios);
				attachedDevices.setAttachedRadios(attachedRadioslst);
			}

			attachedDevices.setType(Type);
			attachedDevices.setDeviceId(Device_id);

			AttachedEcms attachedEcms = new AttachedEcms();
			attachedEcms.setSerialNumber(SerialNumber);

			Components devicecomponents = new Components();
			devicecomponents.setSerialNumber(Device_component);
			String compMake = properties.getProperty("Asset.make");
			devicecomponents.setMake(compMake);

			List<AttachedDevices> attachedDevicesList = new ArrayList<AttachedDevices>();
			List<AttachedEcms> attachedEcmsList = new ArrayList<AttachedEcms>();
			List<Components> attachedcomponentList = new ArrayList<Components>();
			attachedEcmsList.add(attachedEcms);
			attachedDevices.setAttachedEcms(attachedEcmsList);
			attachedcomponentList.add(devicecomponents);
			attachedDevicesList.add(attachedDevices);

			samp.setAttachedDevices(attachedDevicesList);
			samp.setComponents(attachedcomponentList);

			String jsonInString = new Gson().toJson(samp, SampleModel.class);

			System.out.println("Request Body:" + new JSONObject(jsonInString));

			FileOutputStream fr = new FileOutputStream(fileObj2);
			properties1.store(fr, "File has been updated at :" + System.currentTimeMillis());
			fr.close();
			try {
				PrintWriter writer = new PrintWriter("AssetStructurejson.txt", "UTF-8");
				writer.println(jsonInString);
				writer.close();
			} catch (IOException e) {

			}
		}
		// return jsonInString;

	}

	// Following function will build a URL
	public URI buildingurl() throws FileNotFoundException, IOException {
		Properties properties = new Properties();
		properties.load(new FileInputStream("Resources\\application.properties"));
		DefaultHttpClient client = new DefaultHttpClient();
		String Requesturl = properties.getProperty("assetstrcuturecreate.int");
		URI uri = null;
		URIBuilder builder = new URIBuilder();
		builder = builder.setScheme("https").setHost(Requesturl);
		System.out.println("builder:" + builder);
		try {
			uri = builder.build();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}
		return uri; // It will return the formed uri (URL of AssetStrcuture)
	}

	// Following function will add required headers and fetch OAuth
	public HttpPost addingheaderstourl()
			throws FileNotFoundException, NullPointerException, IOException, JSONException {
		StringEntity input = null;

		Common_methods reusemethods = new Common_methods();
		String FetchOath = reusemethods.GetOAuth(); // to get the OAuth from
													// common_methods class
		URI uri = reusemethods.buildingurl();
		String Oauthkey = "Bearer " + FetchOath;
		HttpPost request = new HttpPost(uri);
		request.addHeader("Authorization", Oauthkey);
		request.addHeader("Ocp-Apim-Subscription-Key", "ec53923cc0e5447bb0110812925f9ce2");
		// String jsonInString = reusemethods.AssetTemplate(commercialType);
		JsonParser parser = new JsonParser();

		Object obj = parser.parse(new FileReader("AssetStructurejson.txt"));
		// String jsonInString = obj.toString();
		input = new StringEntity(obj.toString(), "UTF-8");

		input.setContentType("application/asset-structures-v1+json");
		request.addHeader("accept", "application/asset-structures-verbose-v1+json");
		System.out.println("Asset Structure RequestBody " + input);
		request.setEntity(input);
		return request;
	}

	// Following function will execute the api
	public HttpResponse apiexecutuion(HttpPost request)
			throws FileNotFoundException, NullPointerException, IOException, JSONException {
		// Common_methods reusemethods = new Common_methods();
		DefaultHttpClient client = new DefaultHttpClient();
		HttpResponse httpResponse = client.execute(request);
		String response = EntityUtils.toString(httpResponse.getEntity());
		String message = httpResponse.getStatusLine().getReasonPhrase();
		Integer statusCode = httpResponse.getStatusLine().getStatusCode();
		System.out.println("Response of the API :" + "\t" + response + "\t" + "status:" + "\t" + statusCode + "\t"
				+ "Status:" + message);
		return httpResponse;
	}

	// Following function will generate OAuth
	public String GetOAuth()
			throws FileNotFoundException, IOException, NullPointerException, JSONException, org.json.JSONException {

		DefaultHttpClient client = new DefaultHttpClient();

		Properties properties = new Properties();
		properties.load(new FileInputStream("Resources\\application.properties"));
		String decrypPwd = properties.getProperty("ClientSecret");
		String ldapUserName = properties.getProperty("ClientId");
		String UserName = properties.getProperty("UserName");
		String Password = properties.getProperty("Password");
		String ucidSearchURL = properties.getProperty("SearchURL");
		// System.out.println("ucidurl:" + ucidSearchURL);

		HttpResponse httpResponse = null;
		URI uri = null;
		StringEntity input = null;

		byte[] encodedAuth = org.apache.commons.codec.binary.Base64
				.encodeBase64((ldapUserName + ":" + decrypPwd).getBytes());
		String authorization = "Basic " + new String(encodedAuth);
		// System.out.println("Authorization:" + authorization);
		URIBuilder builder = new URIBuilder();
		builder = builder.setScheme("https").setHost(ucidSearchURL);
		// System.out.println("builder:" + builder);
		try {
			uri = builder.build();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

		HttpPost request = new HttpPost(uri);
		request.addHeader("Authorization", authorization);
		String result = null;

		try {
			input = new StringEntity("grant_type=client_credentials&username=" + UserName + "&password=" + Password);
			input.setContentType("application/x-www-form-urlencoded");
			request.setEntity(input);
			System.out.println("Request:" + request);
			httpResponse = client.execute(request);
			result = EntityUtils.toString(httpResponse.getEntity());
			// System.out.println("Http Status :" + "\n" + httpResponse);
			// System.out.println("OAuth Token:" +"\n" +result );
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject jsonobj = new JSONObject(result);
		String access_token = jsonobj.getString("access_token");
		System.out.println("OAuth Token:" + "\n" + access_token);
		return access_token;
	}

	public static void json()
			throws ClientProtocolException, FileNotFoundException, NullPointerException, IOException, JSONException {
		DefaultHttpClient client = new DefaultHttpClient();
		Common_methods reusemethods = new Common_methods();
		HttpResponse httpResponse = client.execute(reusemethods.addingheaderstourl());
		// String response = EntityUtils.toString(httpResponse.getEntity());
		JSONObject jObject = new JSONObject(EntityUtils.toString(httpResponse.getEntity()));
		JSONObject menu = jObject.getJSONObject("Serialnumber");

		Iterator<String> iter = menu.keys();
		String[] keyArr = new String[150];
		String[] valArr = new String[150];
		int count = 0;
		while (iter.hasNext()) {
			keyArr[count] = (String) iter.next();

			valArr[count] = menu.getString(keyArr[count]);
			count += 1;

		}
		System.out.println(valArr[count]);
		System.out.println(valArr[count]);
	}

	public String getSerialNumber() throws FileNotFoundException, IOException, ParseException {
		String Serialnumber = null;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(new FileReader("AssetStructurejson.txt"));
		JSONObject json_obj = (JSONObject) obj;
		try {
			Serialnumber = (String) json_obj.get("serialNumber");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Serialnumber;
	}

	/*
	 * public static void main(String args[]){
	 * 
	 * JSONObject jsonObject=new JSONObject();
	 * 
	 * DummyJsonObj dummyJsonObj=new DummyJsonObj();
	 * 
	 * JSONArray components=new JSONArray();
	 * 
	 * List<ComponentClass> componentsList=new ArrayList<>();
	 * 
	 * ComponentClass componentClass=new ComponentClass();
	 * componentClass.setSerialNumber("a"); ComponentClass componentClass1=new
	 * ComponentClass(); componentClass1.setSerialNumber("b");
	 * 
	 * componentsList.add(componentClass1); componentsList.add(componentClass);
	 * 
	 * JSONObject component1JsonObject=new JSONObject(); JSONObject
	 * component2JsonObject=new JSONObject();
	 * 
	 * try { component1JsonObject.put("serialNumber", "12");
	 * component2JsonObject.put("serialNumber", "12"); } catch (JSONException
	 * e1) { // TODO Auto-generated catch block e1.printStackTrace(); }
	 * 
	 * components.put(component1JsonObject);
	 * components.put(component2JsonObject);
	 * 
	 * try { jsonObject.put("components", components);
	 * 
	 * dummyJsonObj.setComponents(componentsList); } catch (JSONException e) {
	 * // TODO Auto-generated catch block e.printStackTrace(); }
	 * 
	 * //System.out.print(jsonObject);
	 * 
	 * 
	 * System.out.println(new Gson().toJson(dummyJsonObj,DummyJsonObj.class)); }
	 */
}
