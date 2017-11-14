package dsp.automation.utilities;

public enum DSPAutomationExceptionMessage {

	DATABASE(500, "Exception Occured while connecting to database"),
	CLASS_NOT_FOUND(500, "Class not found"),
	STATEMENT(500, "getStateMent failed"),
	RESULTSET(500, "No DATA in DB"),
	SQLEXCEPTION(500, "Invalid Query"),
	IOException(500, "Unable to Open or Close File"),
	AUTHORIZATION(500,"Invalid Auth");

	private final int code;
	private final String description;

	private DSPAutomationExceptionMessage(int code, String description) {
		this.code = code;
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public int getCode() {
		return code;
	}

	@Override
	public String toString() {
		return code + ": " + description;
	}

}
