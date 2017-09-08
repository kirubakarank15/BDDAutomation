package dsp.automation.subscriptions.API;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.Instant;
import java.util.Properties;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.JsonParser;
//import APIAutomation.APIReponse;
import dsp.automation.AssetStructures.API.*;
import dsp.automation.utilities.APIReponse;

public class CommonMethods_Subscriptions 
{
	public static String AssetSno = null;
	public static String Oauthkey = null;
	
	// Following function will build a URL
		public URI buildingurl() throws FileNotFoundException, IOException {
			Properties properties = new Properties();
			properties.load(new FileInputStream(
					"Resources\\application.properties"));
			DefaultHttpClient client = new DefaultHttpClient();
			String Requesturl = properties.getProperty("dspsubscriptionspost.int");
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
		public HttpPost addingheaderstourl()
				throws FileNotFoundException, NullPointerException, IOException, JSONException {
			StringEntity input = null;
			CommonMethods reusemethods = new CommonMethods();
			String FetchOath = reusemethods.GetOAuth(); // to get the OAuth from
														// common_methods class
			URI uri = reusemethods.buildingurl();
			Oauthkey = "Bearer " + FetchOath;
			HttpPost request = new HttpPost(uri);
			request.addHeader("Authorization", Oauthkey);
			request.addHeader("Ocp-Apim-Subscription-Key", "ec53923cc0e5447bb0110812925f9ce2");
			request.addHeader("cwsId" , "ramaia1");
				// String jsonInString = reusemethods.AssetTemplate(commercialType);
			JsonParser parser = new JsonParser();
			Object obj = parser.parse(new FileReader(
					"Resources\\custlevel.properties"));
			
			input = new StringEntity(obj.toString(), "UTF-8");
			String custlevelsub = obj.toString();
			input.setContentType("application/subscriptions-v1+json");
			request.addHeader("accept", "application/subscriptions-v1+json");
			
			/*String custlevelsub = obj.toString();
			input = new StringEntity(obj.toString(), "UTF-8");
			input.setContentType("application/subscriptions-v1+json");
			request.addHeader("accept", "application/subscriptions-v1+json");*/
			System.out.println("request body " + input);
			request.setEntity(input);
			return request;
		}
						
		// Following function will generate OAuth
		public String GetOAuth()
				throws FileNotFoundException, IOException, NullPointerException, JSONException, org.json.JSONException {

			DefaultHttpClient client = new DefaultHttpClient();

			Properties properties = new Properties();
			properties.load(new FileInputStream(
					"Resources\\application.properties"));
			/*String decrypPwd = properties.getProperty("Password");
			String ldapUserName = properties.getProperty("UserName");
			String ucidSearchURL = properties.getProperty("SearchURL");*/
			String decrypPwd = properties.getProperty("ClientSecret");
			String ldapUserName = properties.getProperty("ClientId");
			String ucidSearchURL = properties.getProperty("SearchURL");
			String UserName = properties.getProperty("UserName");
			String Password = properties.getProperty("Password");
			//System.out.println("ucidurl:" + ucidSearchURL);

			HttpResponse httpResponse = null;
			URI uri = null;
			StringEntity input = null;

			byte[] encodedAuth = org.apache.commons.codec.binary.Base64
					.encodeBase64((ldapUserName + ":" + decrypPwd).getBytes());
			String authorization = "Basic " + new String(encodedAuth);
			System.out.println("Authorization:" + authorization);
			URIBuilder builder = new URIBuilder();
			builder = builder.setScheme("https").setHost(ucidSearchURL);
			System.out.println("builder:" + builder);
			try {
				uri = builder.build();
			} catch (URISyntaxException e1) {
				e1.printStackTrace();
			}

			HttpPost request = new HttpPost(uri);
			request.addHeader("Authorization", authorization);
			String result = null;

			try {
				input = new StringEntity("grant_type=client_credentials&username="+UserName+"&password="+Password);
				input.setContentType("application/x-www-form-urlencoded");
				request.setEntity(input);
				System.out.println("Request:" + request);
				httpResponse = client.execute(request);
				result = EntityUtils.toString(httpResponse.getEntity());
				System.out.println("Http Status :" + "\n" + httpResponse);
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
		
		public static APIReponse apiexecutuion(String requestBody,String contentType,String acceptType,String requestType)
				throws FileNotFoundException, NullPointerException, IOException, JSONException {

			StringEntity input = null;
			CommonMethods_Subscriptions reusemethods = new CommonMethods_Subscriptions();
			String FetchOath = reusemethods.GetOAuth(); // to get the OAuth from
														// common_methods class
			URI uri = reusemethods.buildingurl();
			Oauthkey = "Bearer " + FetchOath;
			System.out.println("Oauth:" +Oauthkey);
			
			HttpUriRequest request =null;
			
			if(requestType!=null && requestType.equalsIgnoreCase("POST")){
				request = new HttpPost(uri);
				input = new StringEntity(requestBody, "UTF-8");
				((HttpPost) request).setEntity(input);
				input.setContentType(contentType);
			}else if(requestType!=null && requestType.equalsIgnoreCase("GET")){
				request = new HttpGet(uri);
			}else if(requestType!=null && requestType.equalsIgnoreCase("PUT")){
				request = new HttpPut(uri);
				((HttpPut) request).setEntity(input);
			}else if(requestType!=null && requestType.equalsIgnoreCase("DELETE")){
				request = new HttpDelete(uri);
			}
			request.addHeader("Authorization", Oauthkey);
			request.addHeader("Ocp-Apim-Subscription-Key", "ec53923cc0e5447bb0110812925f9ce2");
			request.addHeader("cwsId" , "ramaia1");
					
			request.addHeader("accept", acceptType);
			System.out.println("request body " + input);
			
			APIReponse apiReponse = new APIReponse();
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse httpResponse = client.execute(request);
			String response = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");

			Integer statusCode = httpResponse.getStatusLine().getStatusCode();
			if (statusCode == 200 || statusCode == 202 || statusCode == 201) {
				apiReponse.setResponse(response);
			} else {
				String message = httpResponse.getStatusLine().getReasonPhrase();
				apiReponse.setFailureReason(response);
			}
			apiReponse.setStatusCode(statusCode);
			System.out.println("Response of the API :" + "\n" + response + "\n" + "status:" + "\n" + statusCode);
			return apiReponse;
		}
		
		
	

}
