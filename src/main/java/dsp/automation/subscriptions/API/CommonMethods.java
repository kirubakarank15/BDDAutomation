package dsp.automation.subscriptions.API;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.TreeMap;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.google.gson.JsonParser;

//import APIAutomation.APIReponse;
//import APIAutomation.AttachedDevices;
//import APIAutomation.AttachedEcms;
//import APIAutomation.AttachedRadios;
//import APIAutomation.Components;
//import DSPSubscriptions.CreateCustomerSubscription;
//import DSPSubscriptions.CreateDealerSubscription;
//import TestPack.OnboardTemplate;
import dsp.automation.AssetStructures.API.*;
import dsp.automation.subscriptions.API.*;
import dsp.automation.utilities.APIReponse;
import dsp.automation.utilities.DBconnection_API;
import dsp.automation.utilities.ExcelReadWrite_API;

public class CommonMethods {
	/**
	 * Following function will create instance all the dependent classes. We are
	 * creating List for the instances
	 **/
	public static String AssetSno = null;
	public static String Oauthkey = null;
	//public static String StarttimeStamp = getCurrenttime();
	//public static String EndtimeStamp = getCurrenttime();

	public void assetOnboardTemplate(String commercialType) throws Exception {
		StringEntity input = null;
		Properties properties = new Properties();

		/*
		 * properties.load(new FileInputStream(
		 * "C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\Keyvalues.properties"
		 * )); String SN = properties.getProperty("Asset.SerialNumber"); String
		 * ECM = properties.getProperty("Asset.EcmsSerialNumber"); String RN =
		 * properties.getProperty("Asset.RadioNumber"); String CSN =
		 * properties.getProperty("Asset.ComponentSerialNumber"); String DSN =
		 * properties.getProperty("Asset.deviceId"); int Serial =
		 * Integer.parseInt(SN); int ECMSerial =Integer.parseInt(ECM); int
		 * RadioSerial =Integer.parseInt(RN); int CSerial =
		 * Integer.parseInt(CSN); int DSerial = Integer.parseInt(DSN); Serial =
		 * Serial + 1; ECMSerial = ECMSerial + 1; RadioSerial = RadioSerial + 1;
		 * CSerial= CSerial + 1; DSerial = DSerial + 1; String Snumber =
		 * Integer.toString(Serial); String Enumber =
		 * Integer.toString(ECMSerial); String RSnumber =
		 * Integer.toString(RadioSerial); String Cnumber =
		 * Integer.toString(CSerial); String Dnumber =
		 * Integer.toString(DSerial); File file=new File(
		 * "C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\Keyvalues.properties"
		 * ); DataOutputStream outstream= new DataOutputStream(new
		 * FileOutputStream(file,false));
		 * outstream.writeBytes("Asset.SerialNumber :" +Snumber +"\n");
		 * outstream.writeBytes("Asset.EcmsSerialNumber :" +Enumber +"\n");
		 * outstream.writeBytes("Asset.RadioNumber :" +RSnumber +"\n");
		 * outstream.writeBytes("Asset.ComponentSerialNumber :" +Cnumber+"\n");
		 * outstream.writeBytes("Asset.deviceId :" +Dnumber+"\n");
		 * outstream.close(); String AssetSerial = "SUM" +Snumber; String
		 * EcmSerial ="SUM" +Enumber; String RSerial ="SUM" +RSnumber +"CR";
		 * String compSerial ="SUM" +Enumber +"AR"; String DevicenoSerial =
		 * "REG" +Dnumber;
		 * 
		 * List<String> list = new ArrayList<String>(); list.add(AssetSerial);
		 * list.add(EcmSerial); list.add(RSerial); list.add(compSerial);
		 * list.add(DevicenoSerial);
		 * 
		 * //return list;
		 */
		
		
		//CommonMethods t1 = new CommonMethods();
		//HashMap<String, String> rawdata = t1.excelReadWrite();
		
		ExcelReadWrite_API ExcelReadWrite = new ExcelReadWrite_API();
		HashMap<String, String> rawdata = ExcelReadWrite.excelReadWrite();
		
		SampleModel samp = new SampleModel();
		properties.load(new FileInputStream(
				"Resources\\application.properties"));
		String make = properties.getProperty("Asset.make");
		samp.setMake(make);
		AssetSno = rawdata.get("SerialNumber");
		samp.setSerialNumber(AssetSno);

		AttachedDevices attachedDevices = new AttachedDevices();
		// String CommercialType = properties.getProperty("Asset.ComType");
		String Type = properties.getProperty("Asset.type");
		if (commercialType != null) {
			attachedDevices.setCommercialType(commercialType);
		}
		attachedDevices.setType(Type);
		attachedDevices.setDeviceId(rawdata.get("DeviceId"));

		AttachedEcms attachedEcms = new AttachedEcms();
		attachedEcms.setSerialNumber(rawdata.get("EcmsSerialNumber"));

		AttachedRadios attachedRadios = new AttachedRadios();
		attachedRadios.setSerialNumber(rawdata.get("RadioNumber"));
		Components devicecomponents = new Components();
		devicecomponents.setSerialNumber(rawdata.get("ComponentSerialNumber"));
		String compMake = properties.getProperty("Asset.make");
		devicecomponents.setMake(compMake);

		List<AttachedDevices> attachedDevicesList = new ArrayList<AttachedDevices>();

		List<AttachedEcms> attachedEcmsList = new ArrayList<AttachedEcms>();
		List<AttachedRadios> attachedRadiosList = new ArrayList<AttachedRadios>();
		List<Components> attachedcomponentList = new ArrayList<Components>();

		attachedEcmsList.add(attachedEcms);

		attachedDevices.setAttachedEcms(attachedEcmsList);

		attachedRadiosList.add(attachedRadios);
		attachedDevices.setAttachedRadios(attachedRadiosList);

		attachedcomponentList.add(devicecomponents);
		attachedDevicesList.add(attachedDevices);

		samp.setAttachedDevices(attachedDevicesList);
		samp.setComponents(attachedcomponentList);
		Gson gson = new Gson();
		String jsonInString = gson.toJson(samp);
		System.out.println("Request Body:" + jsonInString);
		try {
			PrintWriter writer = new PrintWriter(
					"Resources\\Jsonrequest.properties",
					"UTF-8");
			writer.println(jsonInString);
			writer.close();
		} catch (IOException e) {

		}
		// return jsonInString;

		// Adding required Headers for the AssetStructures API
		/*
		 * Common_methods reusemethods = new Common_methods(); String FetchOath
		 * = reusemethods.GetOAuth(); //To get the OAuth from GetOAuth method
		 * URI uri = reusemethods.buildingurl(); String Oauthkey = "Bearer "
		 * +FetchOath; HttpPost request = new HttpPost(uri);
		 * request.addHeader("Authorization", Oauthkey);
		 * request.addHeader("Ocp-Apim-Subscription-Key",
		 * "ec53923cc0e5447bb0110812925f9ce2"); //String jsonInString =
		 * reusemethods.AssetTemplate(); input = new StringEntity(jsonInString);
		 * input.setContentType("application/asset-structures-v1+json");
		 * request.addHeader("accept",
		 * "application/asset-structures-verbose-v1+json");
		 * request.setEntity(input); return request;
		 */
	}

	/*
	 * public String creatinglists() { Passing values to samplemodel class
	 * SampleModel samp=new SampleModel(); samp.setMake("CAT");
	 * samp.setSerialNumber("SUM00567");
	 * 
	 * AttachedDevices attachedDevices=new AttachedDevices();
	 * attachedDevices.setCommercialType("PL161");
	 * attachedDevices.setType("A5:N2");
	 * attachedDevices.setDeviceId("virtsum00567");
	 * 
	 * AttachedEcms attachedEcms=new AttachedEcms();
	 * attachedEcms.setSerialNumber("SUM00567ass");
	 * 
	 * AttachedRadios attachedRadios = new AttachedRadios();
	 * attachedRadios.setSerialNumber("SUM00567radio");
	 * 
	 * Components devicecomponents = new Components();
	 * devicecomponents.setSerialNumber("SUM00567comp");
	 * devicecomponents.setMake("CAT");
	 * 
	 * Creating List for all the classes List<AttachedDevices>
	 * attachedDevicesList=new ArrayList<AttachedDevices>(); List<AttachedEcms>
	 * attachedEcmsList=new ArrayList<AttachedEcms>(); List<AttachedRadios>
	 * attachedRadiosList=new ArrayList<AttachedRadios>(); List<Components>
	 * attachedcomponentList=new ArrayList<Components>();
	 * 
	 * attachedEcmsList.add(attachedEcms);
	 * 
	 * attachedDevices.setAttachedEcms(attachedEcmsList);
	 * 
	 * attachedRadiosList.add(attachedRadios);
	 * attachedDevices.setAttachedRadios(attachedRadiosList);
	 * 
	 * attachedcomponentList.add(devicecomponents);
	 * attachedDevicesList.add(attachedDevices);
	 * 
	 * samp.setAttachedDevices(attachedDevicesList);
	 * samp.setComponents(attachedcomponentList); Gson gson = new Gson(); String
	 * jsonInString = gson.toJson(samp);
	 * System.out.println("JSON Structure"+jsonInString); return jsonInString;
	 * 
	 * }
	 */

	// Following function will build a URL
	public URI buildingurl() throws FileNotFoundException, IOException {
		Properties properties = new Properties();
		properties.load(new FileInputStream(
				"Resources\\application.properties"));
		DefaultHttpClient client = new DefaultHttpClient();
		String Requesturl = properties.getProperty("assetstructurecreate.int");
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
		CommonMethods reusemethods = new CommonMethods();
		String FetchOath = reusemethods.GetOAuth(); // to get the OAuth from
													// common_methods class
		URI uri = reusemethods.buildingurl();
		Oauthkey = "Bearer " + FetchOath;
		HttpPost request = new HttpPost(uri);
		request.addHeader("Authorization", Oauthkey);
		request.addHeader("Ocp-Apim-Subscription-Key", "ec53923cc0e5447bb0110812925f9ce2");
		request.addHeader("cwsId" , "ramaia1");
		// String jsonInString = reusemethods.AssetTemplate(commercialType);
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(new FileReader(
				"Resources\\Jsonrequest.properties"));
		
		input = new StringEntity(obj.toString(), "UTF-8");

		input.setContentType("application/asset-structures-v1+json");
		request.addHeader("accept",
				"application/asset-structures-verbose-v1+json");
		/*String custlevelsub = obj.toString();
		input = new StringEntity(obj.toString(), "UTF-8");
		input.setContentType("application/subscriptions-v1+json");
		request.addHeader("accept", "application/subscriptions-v1+json");*/
		System.out.println("request body " + input);
		request.setEntity(input);
		return request;
	}

	// Following function will execute the api
	public HttpResponse apiexecutuion(HttpPost request)
			throws FileNotFoundException, NullPointerException, IOException, JSONException {

		DefaultHttpClient client = new DefaultHttpClient();
		HttpResponse httpResponse = client.execute(request);
		String response = EntityUtils.toString(httpResponse.getEntity());
		String message = httpResponse.getStatusLine().getReasonPhrase();
		Integer statusCode = httpResponse.getStatusLine().getStatusCode();
		System.out.println("Response of the API :" + "\n" + response + "\n" + "status:" + "\n" + statusCode + "\n"
				+ "Status:" + message);
		return httpResponse;
	}

	// Following function will generate OAuth
	public String GetOAuth()
			throws FileNotFoundException, IOException, NullPointerException, JSONException, org.json.JSONException {

		DefaultHttpClient client = new DefaultHttpClient();

		Properties properties = new Properties();
		properties.load(new FileInputStream(
				"Resources\\application.properties"));
		/*String decrypPwd = properties.getProperty("Password");
		String ldapUserName = properties.getProperty("UserName");
		String ucidSearchURL = properties.getProperty("SearchURL");*/
		String decrypPwd = properties.getProperty("ClientSecret");
		String ldapUserName = properties.getProperty("ClientId");
		String ucidSearchURL = properties.getProperty("SearchURL");
		String UserName = properties.getProperty("UserName");
		String Password = properties.getProperty("Password");
		System.out.println("ucidurl:" + ucidSearchURL);

		HttpResponse httpResponse = null;
		URI uri = null;
		StringEntity input = null;

		byte[] encodedAuth = org.apache.commons.codec.binary.Base64
				.encodeBase64((ldapUserName + ":" + decrypPwd).getBytes());
		String authorization = "Basic " + new String(encodedAuth);
		System.out.println("Authorization:" + authorization);
		URIBuilder builder = new URIBuilder();
		builder = builder.setScheme("https").setHost(ucidSearchURL);
		System.out.println("builder:" + builder);
		try {
			uri = builder.build();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

		HttpPost request = new HttpPost(uri);
		request.addHeader("Authorization", authorization);
		String result = null;

		try {
			input = new StringEntity("grant_type=client_credentials&username="+UserName+"&password="+Password);
			input.setContentType("application/x-www-form-urlencoded");
			request.setEntity(input);
			System.out.println("Request:" + request);
			httpResponse = client.execute(request);
			result = EntityUtils.toString(httpResponse.getEntity());
			System.out.println("Http Status :" + "\n" + httpResponse);
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
	/*
	 * public List<String> GetAttribute() throws FileNotFoundException,
	 * IOException { Properties properties = new Properties();
	 * properties.load(new FileInputStream(
	 * "C:\\Users\\dariss\\workspace1\\apitest_cucumber\\Keyvalues.properties"))
	 * ; String SN = properties.getProperty("Asset.SerialNumber"); String ECM =
	 * properties.getProperty("Asset.EcmsSerialNumber"); String RN =
	 * properties.getProperty("Asset.RadioNumber"); String CSN =
	 * properties.getProperty("Asset.ComponentSerialNumber"); String Did =
	 * properties.getProperty("Asset.deviceId"); int SerialNo =
	 * Integer.parseInt(SN); int ECMSerial =Integer.parseInt(ECM); int
	 * RadioSerial =Integer.parseInt(RN); int CSerial = Integer.parseInt(CSN);
	 * int DSerial = Integer.parseInt(Did); SerialNo = SerialNo + 1; ECMSerial =
	 * ECMSerial + 1; RadioSerial = RadioSerial + 1; CSerial= CSerial + 1;
	 * DSerial = DSerial + 1; System.out.println("AssetSerial :" +Serial);
	 * System.out.println("ECMSerial :" +ECMSerial );
	 * System.out.println("RadioSerial :" +RadioSerial );
	 * System.out.println("CSerial :" +CSerial ); String Snumber =
	 * Integer.toString(SerialNo); String Enumber = Integer.toString(ECMSerial);
	 * String RSnumber = Integer.toString(RadioSerial); String Cnumber =
	 * Integer.toString(CSerial); String Dnumber = Integer.toString(DSerial);
	 * File file=new File(
	 * "C:\\Users\\dariss\\workspace1\\apitest_cucumber\\Keyvalues.properties");
	 * DataOutputStream outstream= new DataOutputStream(new
	 * FileOutputStream(file,false));
	 * outstream.writeBytes("Asset.SerialNumber :" +Snumber +"\n");
	 * outstream.writeBytes("Asset.EcmsSerialNumber :" +Enumber +"\n");
	 * outstream.writeBytes("Asset.RadioNumber :" +RSnumber +"\n");
	 * outstream.writeBytes("Asset.ComponentSerialNumber :" +Cnumber);
	 * outstream.writeBytes("Asset.deviceId :" +Dnumber); outstream.close();
	 * String AssetSerial = "SUM" +Snumber; String EcmSerial ="SUM" +Enumber;
	 * String RSerial ="SUM" +RSnumber; String compSerial ="SUM" +Enumber;
	 * String DevicenoSerial = "REG" +Dnumber;
	 * 
	 * List<String> list = new ArrayList<String>(); list.add(AssetSerial);
	 * list.add(EcmSerial); list.add(RSerial); list.add(compSerial);
	 * list.add(DevicenoSerial); return list;
	 * 
	 * }
	 */

	/**
	 * Following function is commented here and new file is in utilities folder
	 **/
	
	// Excel Read and Write Asset Structure Values

	/*public HashMap<String, String> excelReadWrite() throws IOException {

		HashMap<String, String> requestMap = new HashMap<>();
		String key = null;
		String valueConcat = "";

		try {
			File fileObj = new File(
					"C:\\Users\\ramaia1\\Desktop\\Anandhi_Desktop\\Automation\\Keplar_Space\\CAT\\Utils\\KeyAsset.xls");
			FileInputStream fsIP;
			fsIP = new FileInputStream(fileObj);

			HSSFWorkbook wb = new HSSFWorkbook(fsIP);
			Sheet s = wb.getSheet("Sheet1");
			int rowcount = s.getLastRowNum();

			for (int i = 1; i <= rowcount; i++)

			{

				for (int j = 0; j < s.getRow(i).getLastCellNum(); j++) {
					if (j == 0) {
						key = s.getRow(i).getCell(j).toString();
						System.out.println("key:" + key);

					}
					if (j == 1) {

						String Value = s.getRow(i).getCell(j).toString();
						System.out.println(Value);
						String[] var = Value.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");

						int h;
						for (String k : var) {
							System.out.println(k);

							if (k.matches("[0-9]+")) {

								h = Integer.parseInt(k) + 1;
								System.out.println("h is:" + h);
								if (k.startsWith("0")) {
									valueConcat = valueConcat + "0" + h;
								} else {
									valueConcat = valueConcat + h;
								}

							} else {
								valueConcat = valueConcat + k;
							}
							s.getRow(i).getCell(j).setCellValue(valueConcat);
						}

					}
				}

				requestMap.put(key.split("\\.")[1], valueConcat);
				valueConcat = "";
			}
			System.out.println(requestMap);
			FileOutputStream outputStream = new FileOutputStream(fileObj);
			wb.write(outputStream);
			wb.close();

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		}
		return requestMap;
	}
*/
	
	// Following function will execute the api
	public static APIReponse apiexecutuion(String requestBody,String contentType,String acceptType,String requestType)
			throws FileNotFoundException, NullPointerException, IOException, JSONException {

		StringEntity input = null;
		CommonMethods reusemethods = new CommonMethods();
		String FetchOath = reusemethods.GetOAuth(); // to get the OAuth from
													// common_methods class
		URI uri = reusemethods.buildingurl();
		Oauthkey = "Bearer " + FetchOath;
		
		HttpUriRequest request =null;
		
		if(requestType!=null && requestType.equalsIgnoreCase("POST")){
			request = new HttpPost(uri);
			input = new StringEntity(requestBody, "UTF-8");
			((HttpPost) request).setEntity(input);
			input.setContentType(contentType);
		}else if(requestType!=null && requestType.equalsIgnoreCase("GET")){
			request = new HttpGet(uri);
		}else if(requestType!=null && requestType.equalsIgnoreCase("PUT")){
			request = new HttpPut(uri);
			((HttpPut) request).setEntity(input);
		}else if(requestType!=null && requestType.equalsIgnoreCase("DELETE")){
			request = new HttpDelete(uri);
		}
		request.addHeader("Authorization", Oauthkey);
		request.addHeader("Ocp-Apim-Subscription-Key", "ec53923cc0e5447bb0110812925f9ce2");
		request.addHeader("accept", acceptType);
		System.out.println("request body " + input);
		
		APIReponse apiReponse = new APIReponse();
		DefaultHttpClient client = new DefaultHttpClient();
		HttpResponse httpResponse = client.execute(request);
		String response = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");

		Integer statusCode = httpResponse.getStatusLine().getStatusCode();
		if (statusCode == 200 || statusCode == 202 || statusCode == 201) {
			apiReponse.setResponse(response);
		} else {
			String message = httpResponse.getStatusLine().getReasonPhrase();
			apiReponse.setFailureReason(response);
		}
		apiReponse.setStatusCode(statusCode);
		System.out.println("Response of the API :" + "\n" + response + "\n" + "status:" + "\n" + statusCode);
		return apiReponse;
	}
	
	public static String getCurrenttime()
	{
		Instant instant = Instant.now(); // Current date-time in UTC.
		String output = instant.toString();
		return output;
	}


	public  TreeMap<String, List<String>> getassetDetails(String Query) throws SQLException
	{
		//String sNumber=(String) htable.get("serialNumber");
		//String makeNum=(String) htable.get("make");
		DBconnection_API dbConnection = new DBconnection_API();
		Statement st = dbConnection.checkConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
				ResultSet.CONCUR_READ_ONLY);

		String DBQuery = (Query);
		System.out.println("QUERY:" +DBQuery);
		ResultSet rs = st.executeQuery(DBQuery);
		ResultSetMetaData rsmd = rs.getMetaData();
		/*int noOfRows=0;
		int k=0;
		rs.last();
		noOfRows = rs.getRow();
		// Move to beginning
		rs.beforeFirst();
		System.out.println(noOfRows);*/
		int columnsNumber = rsmd.getColumnCount();
		List<String> querylist =new ArrayList<>();
		TreeMap<String, List<String>> dbValues=new TreeMap<>();


		for(int i=1;i<=columnsNumber;i++){
			querylist.add(rsmd.getColumnLabel(i));
			//System.out.println("Querylist:" +querylist);
		}
		

		for  (String St :querylist){
			rs.beforeFirst();
			//System.out.println(St);
			List<String> colValues =new ArrayList<>();
			while (rs.next()) {
				String columnValue = rs.getString(St);
				//System.out.println(columnValue);
				colValues.add(columnValue);

				if(!rs.next()){
					dbValues.put(St, colValues);

					break;
				}
				rs.previous();

			}
			//			System.out.println(colValues);

		}
		System.out.println(dbValues);
		return dbValues;
	}
	
	public String SkippedQuery(String columName,String Query) throws SQLException
	{

		TreeMap<String, List<String>> map=this.getassetDetails(Query);
		String value=map.get(columName).get(0);
		return value;
	}

}
