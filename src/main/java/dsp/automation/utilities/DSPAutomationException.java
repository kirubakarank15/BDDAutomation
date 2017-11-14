package dsp.automation.utilities;

import java.io.Serializable;

public class DSPAutomationException extends RuntimeException implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2709422224108198590L;

	private String excpetionMessage;
	private Integer errorCode;
	

	public DSPAutomationException(String excpetionMessage, Integer errorCode) {
		super();
		this.excpetionMessage = excpetionMessage;
		this.errorCode = errorCode;
	}

	public String getExcpetionMessage() {
		return excpetionMessage;
	}

	public void setExcpetionMessage(String excpetionMessage) {
		this.excpetionMessage = excpetionMessage;
	}

	public Integer getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(Integer errorCode) {
		this.errorCode = errorCode;
	}

}
