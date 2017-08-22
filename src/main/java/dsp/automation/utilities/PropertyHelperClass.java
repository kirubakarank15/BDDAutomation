package dsp.automation.utilities;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyHelperClass 
{
	public static String attribute =  null; 
	public 	static  String getProperty(String key) {
	        Properties properties = new Properties();
	        //String attribute = "";
	           try {

	                InputStream inputStream = PropertyHelperClass.class.getClassLoader().getResourceAsStream("application.properties");	              
	                properties.load(inputStream);	               
	                attribute = properties.getProperty(key);

	           } catch (IOException e) {
	           //    LoggingUtility.logErrorMessage("PropertyHelperClass.getProperty", e);
	               e.printStackTrace();
	             }
	          return attribute;
	      }

	
	
}
