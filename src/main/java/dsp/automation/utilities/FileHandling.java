package dsp.automation.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class FileHandling {
	public static Properties objProperty= null;
/*	public Properties readConfig() throws Exception {
		try {
			File fileObj = new File(
					"C:\\Users\\krishk10.AP.000\\Desktop\\Automation\\Workpaces\\Automation\\Resources\\config.properties");
			InputStream inputStream;

			inputStream = new FileInputStream(fileObj);

			// TODO Auto-generated catch block

			objProperty= new Properties();
			objProperty.load(inputStream); 
			HashMap<String, String> obj= new HashMap<>();
			objj

		} catch (Exception e) {

		}
		return objProperty;

	}*/

 public static String getProperty(String key) {
 	        String value = "";
	           try {
			         if (objProperty== null)
					{	                
			        	 objProperty = new Properties();
			        		File fileObj = new File(
			    					"C:\\Users\\krishk10.AP.000\\Desktop\\Automation\\Workpaces\\Automation\\Resources\\config.properties");
			    			
				InputStream inputStream = new FileInputStream(fileObj) ;             
					objProperty.load(inputStream);	
					 }
	                value = (String) objProperty.get(key);   

	           } catch (IOException e) {

	             }
	          return value;
	      }


}
