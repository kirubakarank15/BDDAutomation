package demo.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author Kirubakaran.K(kk)
 *PropertyFinder-Demo Cucumber Automation
 * 
 */
public class FileHandling {
	public static Properties objProperty= null;
/*	public Properties readConfig() throws Exception {
		try {
			File fileObj = new File(
					"C:\\Users\\kk.AP.000\\Desktop\\Automation\\Workpaces\\Automation\\Resources\\config.properties");
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

 /*kk
 * @param key
 * @return
 */
public static String getProperty(String key) throws CustomisedException {
 	        String value = "";
	           try {
			         if (objProperty== null)
					{	            
			        	 objProperty = new Properties();
			        		File fileObj = new File("Resources\\config.properties"); 
			    			
				InputStream inputStream = new FileInputStream(fileObj) ;             
					objProperty.load(inputStream);	
					 }
			         System.out.println("protprty file is null"+(String) objProperty.get(key));  
	                value = (String) objProperty.get(key);   

	           } catch (Exception e) {
throw new CustomisedException("key", "facing issue while fetching");
	             }
	          return value;
	      }


}
