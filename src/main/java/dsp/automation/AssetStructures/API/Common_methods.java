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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.TreeMap;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import dsp.automation.utilities.ExcelReadWrite_API;
import dsp.automation.utilities.DBconnection_API;


public class Common_methods {
	// Following function will create instance all the dependent classes.
	// We are creating List for the instances
	public static String SerialNumber = null;
	public static String value = null;

	public void AssetTemplate(String commercialType) throws Exception {
		StringEntity input = null;
		Properties properties = new Properties();
		//Common_methods reusemethods = new Common_methods();
		//HashMap<String, String> attributes = reusemethods.excelReadWrite();
		ExcelReadWrite_API ExcelReadWrite = new ExcelReadWrite_API();
		HashMap<String, String> attributes = ExcelReadWrite.excelReadWrite();

		SampleModel samp = new SampleModel();
		properties.load(new FileInputStream("C:\\Users\\dariss\\Downloads\\Workpaces\\Automation\\Resources\\application.properties"));
		String make = properties.getProperty("Asset.make");
		samp.setMake(make);
		SerialNumber = attributes.get("SerialNumber");
		samp.setSerialNumber(SerialNumber);

		AttachedDevices attachedDevices = new AttachedDevices();
		// String CommercialType = properties.getProperty("Asset.ComType");
		String Type = properties.getProperty("Asset.type");
		if (commercialType != null) {
			attachedDevices.setCommercialType(commercialType);
			
			List<AttachedRadios> attachedRadioslst = new ArrayList<AttachedRadios>();

			if (commercialType.contains("+")) {

				if (attributes.get("RadioNumber").contains(",")) {
					String[] radioNumbers = attributes.get("RadioNumber").split(",");
					
					for(int k=1;k<radioNumbers.length;k++){
						
						String eachSerialNumber=radioNumbers[g];
						AttachedRadios attachedRadios = new AttachedRadios();
						attachedRadios.setSerialNumber(eachSerialNumber);
						attachedRadioslst.add(attachedRadios);
						
					}
					attachedDevices.setAttachedRadios(attachedRadioslst);
				} else {
					throw new Exception("Radionumber has only one radio number in excel sheet for "
									+ commercialType);
				}

			} else {
				/*AttachedRadios attachedRadios = new AttachedRadios();
				 attachedRadios.setSerialNumber(attributes.get("RadioNumber").split(",")[0]);
				 String attachedRadios_1 = attachedRadios.getSerialNumber();
				 attachedDevices.setAttachedRadios_1(attachedRadios_1);
				 System.out.println("RadioNumber:" +attributes.get("RadioNumber"));*/
				
				AttachedRadios attachedRadios = new AttachedRadios();
				attachedRadios.setSerialNumber(attributes.get("RadioNumber").split(",")[0]);
				attachedRadioslst.add(attachedRadios);
				attachedDevices.setAttachedRadios(attachedRadioslst);
				}
		attachedDevices.setType(Type);
		attachedDevices.setDeviceId(attributes.get("DeviceId"));

		AttachedEcms attachedEcms = new AttachedEcms();
		attachedEcms.setSerialNumber(attributes.get("EcmsSerialNumber"));

		
		Components devicecomponents = new Components();
		devicecomponents.setSerialNumber(attributes.get("ComponentSerialNumber"));
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
		try {
			PrintWriter writer = new PrintWriter("AssetStructurejson.txt","UTF-8");
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
		properties.load(new FileInputStream("C:\\Users\\dariss\\Downloads\\Workpaces\\Automation\\Resources\\application.properties"));
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
	public HttpPost addingheaderstourl() throws FileNotFoundException,
			NullPointerException, IOException, JSONException {
		StringEntity input = null;

		Common_methods reusemethods = new Common_methods();
		String FetchOath = reusemethods.GetOAuth(); // to get the OAuth from
													// common_methods class
		URI uri = reusemethods.buildingurl();
		String Oauthkey = "Bearer " + FetchOath;
		HttpPost request = new HttpPost(uri);
		request.addHeader("Authorization", Oauthkey);
		request.addHeader("Ocp-Apim-Subscription-Key","ec53923cc0e5447bb0110812925f9ce2");
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
			throws FileNotFoundException, NullPointerException, IOException,
			JSONException {
		// Common_methods reusemethods = new Common_methods();
		DefaultHttpClient client = new DefaultHttpClient();
		HttpResponse httpResponse = client.execute(request);
		String response = EntityUtils.toString(httpResponse.getEntity());
		String message = httpResponse.getStatusLine().getReasonPhrase();
		Integer statusCode = httpResponse.getStatusLine().getStatusCode();
		System.out.println("Response of the API :" + "\t" + response + "\t"
				+ "status:" + "\t" + statusCode + "\t" + "Status:" + message);
		return httpResponse;
	}

	// Following function will generate OAuth
	public String GetOAuth() throws FileNotFoundException, IOException,
			NullPointerException, JSONException, org.json.JSONException {

		DefaultHttpClient client = new DefaultHttpClient();

		Properties properties = new Properties();
		properties.load(new FileInputStream("C:\\Users\\dariss\\Downloads\\Workpaces\\Automation\\Resources\\application.properties"));
		String decrypPwd = properties.getProperty("Password");
		String ldapUserName = properties.getProperty("UserName");
		String ucidSearchURL = properties.getProperty("SearchURL");
		//System.out.println("ucidurl:" + ucidSearchURL);

		HttpResponse httpResponse = null;
		URI uri = null;
		StringEntity input = null;

		byte[] encodedAuth = org.apache.commons.codec.binary.Base64
				.encodeBase64((ldapUserName + ":" + decrypPwd).getBytes());
		String authorization = "Basic " + new String(encodedAuth);
		//System.out.println("Authorization:" + authorization);
		URIBuilder builder = new URIBuilder();
		builder = builder.setScheme("https").setHost(ucidSearchURL);
		//System.out.println("builder:" + builder);
		try {
			uri = builder.build();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

		HttpPost request = new HttpPost(uri);
		request.addHeader("Authorization", authorization);
		String result = null;

		try {
			input = new StringEntity("grant_type=client_credentials");
			input.setContentType("application/x-www-form-urlencoded");
			request.setEntity(input);
			System.out.println("Request:" + request);
			httpResponse = client.execute(request);
			result = EntityUtils.toString(httpResponse.getEntity());
			//System.out.println("Http Status :" + "\n" + httpResponse);
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

/*	public Connection checkConnection() throws SQLException {
		System.out.println("-------- SQL JDBC Connection Testing ------");

		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your SQL JDBC Driver?");
			e.printStackTrace();

		}

		System.out.println("SQL JDBC Driver Registered!");

		Connection connection = null;

		try {
			connection = DriverManager
					.getConnection("jdbc:sqlserver://dealerserviceportal-dev.database.windows.net:1433;database=DEALERSERVICEPORTAL-INT;user=dspapp;password=dspn0access@123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");

			// Properties DB_info = connection.getClientInfo();
			// System.out.println("clientinfo:" +DB_info);
			if (connection != null) {
				System.out
						.println("You made it, take control your database now!");
				System.out.println("Doneee !");
			} else {
				System.out.println("Failed to make connection!");
			}
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}

		return connection;

	}*/

	public TreeMap<String, List<String>> getassetDetails(String query)
			throws SQLException {
		// String sNumber=(String) htable.get("serialNumber");
		// String makeNum=(String) htable.get("make");
		DBconnection_API dbConnection = new DBconnection_API();
		Statement st = dbConnection.checkConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

		String sql = (query);
		ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		/*
		 * int noOfRows=0; int k=0; rs.last(); noOfRows = rs.getRow(); // Move
		 * to beginning rs.beforeFirst(); System.out.println(noOfRows);
		 */
		int columnsNumber = rsmd.getColumnCount();
		List<String> querylist = new ArrayList<>();
		TreeMap<String, List<String>> dbValues = new TreeMap<>();

		for (int i = 1; i <= columnsNumber; i++) {
			querylist.add(rsmd.getColumnLabel(i));
		}
		// System.out.println(querylist);

		for (String St : querylist) {
			rs.beforeFirst();
			// System.out.println(St);
			List<String> colValues = new ArrayList<>();
			while (rs.next()) {
				String columnValue = rs.getString(St);
				// System.out.println(columnValue);
				colValues.add(columnValue);

				if (!rs.next()) {
					dbValues.put(St, colValues);

					break;
				}
				rs.previous();

			}
			// System.out.println(colValues);

		}
		System.out.println(dbValues);
		return dbValues;
	}

	public String dbValue(String columName, String Query) throws SQLException {

		TreeMap<String, List<String>> map = this.getassetDetails(Query);

		value = map.get(columName).get(0);
		if(value==null)
		{
			System.out.println("No Value is Present in DB");
		}
		return value;

	}

	public static void json() throws ClientProtocolException,
			FileNotFoundException, NullPointerException, IOException,
			JSONException {
		DefaultHttpClient client = new DefaultHttpClient();
		Common_methods reusemethods = new Common_methods();
		HttpResponse httpResponse = client.execute(reusemethods
				.addingheaderstourl());
		// String response = EntityUtils.toString(httpResponse.getEntity());
		JSONObject jObject = new JSONObject(EntityUtils.toString(httpResponse
				.getEntity()));
		JSONObject menu = jObject.getJSONObject("Serialnumber");

		Iterator iter = menu.keys();
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

	/*public HashMap<String, String> excelReadWrite() throws Exception {
		HashMap<String, String> requestMap = new HashMap<>();
		try {
			File fileObj = new File("C:\\Users\\dariss\\Documents\\Book1.xls");
			FileInputStream fsIP = new FileInputStream(fileObj);
			HSSFWorkbook wb = new HSSFWorkbook(fsIP);
			Sheet s = wb.getSheet("Sheet1");
			int rowcount = s.getLastRowNum();

			String key = null;
			String valueConcat = "";

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
						String[] var = Value
								.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");

						long h;
						char[] zero = null;
						String zeroString = "";
						for (String k : var) {

							if (k.matches("[0-9]+")) {

								h = Long.parseLong(k) + 1;
								// System.out.println("h is "+h);
								if (k.startsWith("0")) {
									zero = k.toCharArray();
									for (char zeroLoop : zero) {
										if (zeroLoop != '0') {
											break;
										}

										zeroString = zeroString + zeroLoop;

									}
									valueConcat = valueConcat + zeroString + h;

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

				requestMap.put(key, valueConcat);
				valueConcat = "";
			}

			System.out.println(requestMap);
			FileOutputStream outputStream = new FileOutputStream(fileObj);
			wb.write(outputStream);
			wb.close();
		} catch (NullPointerException e) {
			throw new Exception(e);
		}
		return requestMap;
	}*/

	public String getSerialNumber() throws FileNotFoundException, IOException,
			ParseException {
		String Serialnumber = null;
		// Properties properties = new Properties();
		// properties.load(new
		// FileInputStream("C:\\Users\\dariss\\workspace1\\apitest_cucumber\\application.properties"));
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

	
	/*public static void main(String args[]){
		
		JSONObject jsonObject=new JSONObject();
		
		DummyJsonObj dummyJsonObj=new DummyJsonObj();
		
		JSONArray components=new JSONArray();
		
		List<ComponentClass> componentsList=new ArrayList<>();
		
		ComponentClass componentClass=new ComponentClass();
		componentClass.setSerialNumber("a");
		ComponentClass componentClass1=new ComponentClass();
		componentClass1.setSerialNumber("b");
		
		componentsList.add(componentClass1);
		componentsList.add(componentClass);
		
		JSONObject component1JsonObject=new JSONObject();
		JSONObject component2JsonObject=new JSONObject();
		
		try {
			component1JsonObject.put("serialNumber", "12");
			component2JsonObject.put("serialNumber", "12");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		components.put(component1JsonObject);
		components.put(component2JsonObject);
		
		try {
			jsonObject.put("components", components);
			
			dummyJsonObj.setComponents(componentsList);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.print(jsonObject);
		
		
		System.out.println(new Gson().toJson(dummyJsonObj,DummyJsonObj.class));
	}*/
}
