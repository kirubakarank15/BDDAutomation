package dsp.automation;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.json.JSONException;

import dsp.automation.AssetStructures.API.Common_methods;

public class testcheck {

	public static void main(String[] args) throws FileNotFoundException, NullPointerException, JSONException, IOException {
		// TODO Auto-generated method stub
		byte[] encodedAuth = org.apache.commons.codec.binary.Base64
				.encodeBase64(("ramaia1" + ":" + "Cts@17@ju").getBytes());
		System.out.println("test :" +new String(encodedAuth));
		
		Common_methods C1 = new Common_methods();
		//C1.GetOAuth();
		C1.addingheaderstourl();
	}

}
