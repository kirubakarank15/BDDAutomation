package dsp.automation.utilities;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import dsp.automation.AssetStructures.API.Common_methods;

public class ReusableMethodsAPI {
	

	static Properties properties = new Properties();
	static Common_methods meth = new Common_methods();
	static String existingValue = "";
	static String previousSerialNo = "";

	
	public static String valueIncrementor(String data) throws FileNotFoundException, IOException, SQLException {
String value;

value=incremnetHelper(data);
System.out.println(data);
return value;

			
	}
	
	public static String incremnetHelper(String data) {
		String valueConcat = "";
		String[] var = data.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");

		long h;
		char[] zero = null;
		String zeroString = "";
		for (String k : var) {

			if (k.matches("[0-9]+")) {
				h = Long.parseLong(k) + 1;
				if (k.startsWith("0")) 
				{
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

		}


		previousSerialNo=data;
	return valueConcat;
		
	}
	
}
