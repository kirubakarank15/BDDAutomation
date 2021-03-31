package demo.utilities;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

public class TextFileWriter {
	static BufferedWriter writer;
	public static void textpadWriter(HashMap<String, String> map ) throws CustomisedException{
		try{
		//create a temporary file
        String timeLog = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
        File logFile = new File("AgentDetails"+timeLog);

        // This will output the full path where the file will be written to...
        System.out.println(logFile.getCanonicalPath());

        writer = new BufferedWriter(new FileWriter(logFile,true));
        for(String loop:map.keySet()){
        writer.write("\n"+loop+":  "+map.get(loop));
        
        }
	}
	catch(Exception e){
		
	}
		 finally {
	            try {
	                // Close the writer regardless of what happens...
	                writer.close();
	            } catch (Exception e) {
	            }}
}
}