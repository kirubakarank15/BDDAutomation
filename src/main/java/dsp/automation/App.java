package dsp.automation;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.ResourceBundle;

import org.testng.annotations.Parameters;

import dsp.automation.AssetStructures.API.Common_methods;
import dsp.automation.utilities.EcncryptorDecryptor;
import dsp.automation.utilities.FileHandling;
import dsp.automation.utilities.TestFunctionsFactory;

/**
 * Hello world!
 *
 */
public class App 
{ 
	 @Parameters("environment")
		public static String getParameter(String enviro){
			
			System.out.println(FileHandling.getProperty(enviro));
			return null;
			
		}
    public static void main( String[] args ) throws Exception
    
    
    {   	/*	Date dNow = new Date();
	SimpleDateFormat ft = new SimpleDateFormat("Eyyyy.MM.dd'_'hh:mm:ssa");
	String timeStamp = ft.format(dNow).replaceAll(":", "_");
	
	
	String screenshotsDir ="C://Users//krishk10.AP.000//Documents//DSP-Automation//test-output//ScreenShots//";

	  String filename = "_"+ timeStamp + ".ping";
	Path screenshotPath = Paths.get(screenshotsDir, filename);
	screenshotPath.toFile();
	System.out.println(screenshotPath.toString());*/
    	
    App obj=new App();
	
   // getParameter( @Parameters("environment"));
    	
    	/*Properties objProperty=new Properties();
    	File fileObj = new File(
				"Resources\\application.properties");
		
InputStream inputStream = new FileInputStream(fileObj) ;            
objProperty.load(inputStream);	


System.out.println(objProperty.keySet().toString());

*/
  /*  System.out.println(EcncryptorDecryptor.encryptor("Myvision@18"));
    System.out.println(EcncryptorDecryptor.decryptor("!:_/=/(^9ry"));*/
    Common_methods comm = new Common_methods();
    comm.AssetTemplate("PLE641+PL631");
    }
    
}
