package dsp.automation;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.testng.annotations.Parameters;

import dsp.automation.AssetStructures.API.Common_methods;
import dsp.automation.utilities.EcncryptorDecryptor;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * Hello world!
 *
 */
public class App {
	@Parameters("environment")
	public static String getParameter(String enviro) {

		System.out.println(FileHandling.getProperty(enviro));
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

	public static void main(String[] args) throws Exception

	{ /*
		 * Date dNow = new Date(); SimpleDateFormat ft = new
		 * SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa"); String timeStamp =
		 * ft.format(dNow).replaceAll(":", "_");
		 * 
		 * 
		 * String screenshotsDir
		 * ="C://Users//krishk10.AP.000//Documents//DSP-Automation//test-output//ScreenShots//";
		 * 
		 * String filename = "_"+ timeStamp + ".ping"; Path screenshotPath =
		 * Paths.get(screenshotsDir, filename); screenshotPath.toFile();
		 * System.out.println(screenshotPath.toString());
		 */

		App obj = new App();
		obj.excelReadWrite();
		// List<String> obj1=new ArrayList<>(Arrays.asList("sds","dsds"));
		// List<String> obj2=new ArrayList<>(Arrays.asList("sdsdd","dsds"));

		// getParameter( @Parameters("environment"));

		/*
		 * Properties objProperty=new Properties(); File fileObj = new File(
		 * "Resources\\application.properties");
		 * 
		 * InputStream inputStream = new FileInputStream(fileObj) ;
		 * objProperty.load(inputStream);
		 * 
		 * 
		 * System.out.println(objProperty.keySet().toString());
		 * 
		 */
		/*
		 * System.out.println(EcncryptorDecryptor.encryptor("Myvision@18"));
		 * System.out.println(EcncryptorDecryptor.decryptor("!:_/=/(^9ry"));
		 */
		/*
		 * Common_methods comm = new Common_methods();
		 * comm.AssetTemplate("PLE641+PL631");
		 */

	}

}
