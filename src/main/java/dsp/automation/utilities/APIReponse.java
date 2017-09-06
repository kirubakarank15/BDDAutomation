package dsp.automation.utilities;

import java.io.Serializable;

public class APIReponse implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5656141332555081625L;
	private int statusCode;
	private String response;
	private String failureReason;

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getFailureReason() {
		return failureReason;
	}

	public void setFailureReason(String failureReason) {
		this.failureReason = failureReason;
	}

}
