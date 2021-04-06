package Practice;

import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;

import org.apache.poi.hssf.record.cf.DataBarFormatting;

public class App{
	
	  public static void main(String args[]) throws ParseException {
		  Date current=new Date(); 
		  Date givenDate=new SimpleDateFormat("dd-MM-yyyy").parse("15-5-2021"); 
		// String month= new DateFormatSymbols().getMonths()[givenDate.getMonth()-1];
		
	 System.out.println(givenDate.getYear());
	  }
	
}
/*package toolsQA.automation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.Parameters;

import toolsQA.automation.toolsQA.menuNavigationToolsQA;
import toolsQA.automation.utilities.TestFunctionsFactory;

*//**
 * Hello world!
 *
 *//*
public class App {
	private final static Logger LOGGER = Logger.getLogger(App.class.getName());
	@Parameters("environment")
	public  String getParameter() throws SecurityException, IOException {

		FileHandler fh=new FileHandler(System.getProperty("user.dir") + "/logs/AlertsAndContacts.txt" , true);
	
		  
		LOGGER.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
	        fh.setFormatter(formatter);
	   
		//System.out.println(FileHandling.getProperty(enviro));
		return null;

	}

	public HashMap<String, String> excelReadWrite() throws Exception {
		HashMap<String, String> requestMap = new HashMap<>();
		LinkedHashMap<String, List<String>> additionalInfo = new LinkedHashMap<>();
		try {
			File fileObj = new File("Resources\\SubscriptionsCatalog.xls");
			FileInputStream fsIP = new FileInputStream(fileObj);
			HSSFWorkbook wb = new HSSFWorkbook(fsIP);
			Sheet s = wb.getSheet("Subscriptions");
			int rowcount = s.getLastRowNum();
			String roles = "Services";
			String subscriptions = "VISION_LINK";
			// String key = null;
			String deviceType = "PLE742";
			int cellNoOfDeviceTypeColumn = 0;
			int cellNoOfSubscriptions = 0;
			int cellNoOfRoles = 0;
			String service = null;
			String[] subsArray = null;
			List<String> servicesList = new ArrayList<>();
			List<String> subscriptionsList = new ArrayList<>();

			List<String> eachAdditionalInfo = new ArrayList<>();

			for (int rowIncrementor = 0; rowIncrementor <= rowcount; rowIncrementor++)

			{
				Row rowObj = s.getRow(rowIncrementor);

				for (int cellIncrementor = 0; cellIncrementor <= s.getRow(0)
						.getPhysicalNumberOfCells(); cellIncrementor++) {

					if (!(rowObj.getCell(cellIncrementor) == null)) {
						if (rowObj.getCell(cellIncrementor).toString().trim().equalsIgnoreCase(deviceType)) {

							cellNoOfDeviceTypeColumn = rowObj.getCell(cellIncrementor).getColumnIndex();
							System.out.println("Cell Value found" + rowObj.getCell(cellIncrementor).toString());
						}
						if (rowObj.getCell(cellIncrementor).toString()
								.equalsIgnoreCase("Concatenated Display Name (DSP)")) {
							cellNoOfSubscriptions = rowObj.getCell(cellIncrementor).getColumnIndex();
							System.out.println("Cell Value found" + rowObj.getCell(cellIncrementor).toString());
						}
						if (rowObj.getCell(cellIncrementor).toString().equalsIgnoreCase("Roles")) {
							cellNoOfRoles = rowObj.getCell(cellIncrementor).getColumnIndex();
							System.out.println("Cell Value found" + rowObj.getCell(cellIncrementor).toString());
						}
					}

				}
				if (rowObj.getCell(cellNoOfDeviceTypeColumn).toString().equalsIgnoreCase("x")) {
					if (roles.equalsIgnoreCase("Services")) {
						if (!(rowObj.getCell(cellNoOfRoles) == null))
							if (!servicesList.contains(rowObj.getCell(cellNoOfRoles).toString())) {
								service = rowObj.getCell(cellNoOfRoles).toString();
								System.out.println("Service" + rowObj.getCell(cellNoOfRoles).toString());
								servicesList.add(service);
							}
					}
					if (rowObj.getCell(cellNoOfRoles).toString().equalsIgnoreCase("VISION_LINK")) {
						if (!(rowObj.getCell(cellNoOfSubscriptions) == null))
							if (!subscriptionsList.contains(rowObj.getCell(cellNoOfSubscriptions).toString())) {
								if (rowObj.getCell(cellNoOfSubscriptions).toString().contains("|")) {
									subsArray = rowObj.getCell(cellNoOfSubscriptions).toString().split("\\|");
									for (String loopAddOn : subsArray) {
										if (!subsArray[0].equals(loopAddOn)) {
											if(!eachAdditionalInfo.contains(loopAddOn)){
											eachAdditionalInfo.add(loopAddOn);
											}

										}
									}

									subscriptionsList.add(subsArray[0]);
									additionalInfo.put(subsArray[0], eachAdditionalInfo);
								} else {
									service = rowObj.getCell(cellNoOfSubscriptions).toString();

									System.out.println("NO PIPE SYMPOL" + service);
									subscriptionsList.add(service);
								}
							}

					}

					// else if(){
					//
					// }

				}

			}
			Set<String> loop = additionalInfo.keySet();

			for (String key : loop) {
				for (String addOn : additionalInfo.get(key)) {
					System.out.println(key + "|" + addOn);
				}

			}
		} catch (NullPointerException e) {
			throw new Exception(e);
		}
		System.out.println("hashmapis" + additionalInfo.keySet());
		return requestMap;
	}

	
	private final String USER_AGENT="Mozilla/5.0";
	public String GetResponse() throws ClientProtocolException, IOException
	{
		String eddecrypPwd=null;
		eddecrypPwd="2sKNsE9RVfCq";
	    String edUsername = "PLWeb-QA";
		//System.out.println(decrypPwd);
		byte[] encodedAuth = org.apache.commons.codec.binary.Base64.encodeBase64((edUsername + ":" + eddecrypPwd).getBytes());
		String authorization = "Basic " + new String(encodedAuth);
	
		
		
		StringBuffer result=new StringBuffer();
		HttpClient client=new DefaultHttpClient();
		String url="https://qa-api.telematics-managed.com/CAT_GATEWAY/services/subscriptions/catalog/subscriptions";
		HttpGet request=new HttpGet(url);
		request.addHeader("Authorization", authorization);
		request.addHeader("Accept", "application/json");
		request.addHeader("Content-Type", "application/json");
	
		System.out.println(request.toString());
		HttpResponse response=client.execute(request);
		String responseobj=EntityUtils.toString(response.getEntity());
		int responseCode=response.getStatusLine().getStatusCode();
	System.out.println(responseobj);
		System.out.println("Response Code: " + responseCode);
		try{
		if(responseCode==200)
			
		{
			System.out.println("Get Response is Successfull");
			BufferedReader reader=new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			String line="";
			while((line=reader.readLine())!=null)
			{
				result.append(line);
				//System.out.println(result.toString());
			}
			
			for(int i = 0; i < jArr.length();i++) {
	 
	            JSONObject innerObj = jArr.getJSONObject(i);
	            for(Iterator it = innerObj.keys(); it.hasNext(); ) {
	                String key = (String)it.next();
	                System.out.println(key + ":" + innerObj.get(key));
	            }
	        }
		}

		
			return result.toString();}
		catch(Exception ex)
	{
		result.append("Get Response Failed");
		return result.toString();
	}

}
	public static void main(String[] args) throws Exception

	{
	App obj=new App();
		obj.GetResponse();
	   Enumeration names;
		Hashtable<String, String> ht=new Hashtable<>();
		ht.put("1", "d");
		ht.put("3", "dd");
		ht.put("2", "ddd");
		 names = ht.keys();
		   while(names.hasMoreElements()) {
		     if(names.nextElement().toString().equalsIgnoreCase("dd")){
		    	ht.remove(names);
		     }
		   }
		  // System.out.println(ht);
		
		   //Enumeration keys = ht.keys();  //siCache is Hashtable

		   Iterator<Entry<String, String>> it = ht.entrySet().iterator();

		   while (it.hasNext()) {
		     Entry<String, String> entry = it.next();

		     // Remove entry if key is null or equals 0.
		     if (entry.getKey().equalsIgnoreCase("1")) {
		       it.remove();
		     }
		   }

		   Iterator<String> it = ht.keySet().iterator();

		   while (it.hasNext()) {
		    // Entry<String, String> entry = it.next();
			   String entry = it.next();

		     // Remove entry if key is null or equals 0.
		     if (entry.equalsIgnoreCase("1")) {
		       it.remove();
		     }
		   //}
		//   System.out.println(ht);
		    //iterate through Hashtable values Enumeration
		 

		
		System.setProperty("webdriver.chrome.driver","Resources\\chromedriver.exe");
        //String userProfile= "C:\\Users\\kk.AP.000\\AppData\\Roaming\\Microsoft\\Internet Explorer\\UserData";
        ChromeOptions options = new ChromeOptions();

        //options.addArguments("user-data-dir="+userProfile);
        options.addArguments("--start-maximized"); 
        options.addArguments("--ignore-certificate-errors");
        options.addArguments("--disable-popup-blocking");
//options.addArguments("--headless");
       // options.addArguments("disable-infobars"); 
        //options.setBinary("Resources\\Drivers\\chromedriver.exe");
        //options.addArguments("--incognito");
       // options.addArguments("--disable-extensions");
        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        capabilities.setCapability("chrome.binary", "");
        capabilities.setCapability(ChromeOptions.CAPABILITY, options);
		//return driver;
		DesiredCapabilities capabilities1 = DesiredCapabilities.internetExplorer();
			capabilities1.setCapability(CapabilityType.BROWSER_NAME, "IE");
		capabilities1.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		//RemoteWebDriver driver = new RemoteWebDriver(capabilities1);
		
    	  WebDriver driver = new ChromeDriver(options);
    	  driver.get("http://toolsqa.com");
    		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    		TestFunctionsFactory.launchUrl("chrome", "http://toolsqa.com");
    		menuNavigationToolsQA objMEnu=new menuNavigationToolsQA();
    		objMEnu.menuNavigation("Tools->UI Automation->Selenium Tutorial");
  
		
		 * Date dNow = new Date(); SimpleDateFormat ft = new
		 * SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa"); String timeStamp =
		 * ft.format(dNow).replaceAll(":", "_");
		 * 
		 * 
		 * String screenshotsDir
		 * ="C://Users//kk.AP.000//Documents//DSP-Automation//test-output//ScreenShots//";
		 * 
		 * String filename = "_"+ timeStamp + ".ping"; Path screenshotPath =
		 * Paths.get(screenshotsDir, filename); screenshotPath.toFile();
		 * System.out.println(screenshotPath.toString());
		 

		
		// List<String> obj1=new ArrayList<>(Arrays.asList("sds","dsds"));
		// List<String> obj2=new ArrayList<>(Arrays.asList("sdsdd","dsds"));

		// getParameter( @Parameters("environment"));

		
		 * Properties objProperty=new Properties(); File fileObj = new File(
		 * "Resources\\application.properties");
		 * 
		 * InputStream inputStream = new FileInputStream(fileObj) ;
		 * objProperty.load(inputStream);
		 * 
		 * 
		 * System.out.println(objProperty.keySet().toString());
		 * 
		 
		
		 * System.out.println(EcncryptorDecryptor.encryptor("Myvision@18"));
		 * System.out.println(EcncryptorDecryptor.decryptor("!:_/=/(^9ry"));
		 
		
		 * Common_methods comm = new Common_methods();
		 * comm.AssetTemplate("PLE641+PL631");
		 

	}

}
*/