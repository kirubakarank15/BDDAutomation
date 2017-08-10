package dsp.automation.AssetStructures.API;

public class Radio
{	
	private String id;
	private String serialNumber;
	private String self;
	private Boolean isShared;
	private String operation;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
	public Boolean getIsShared() {
		return isShared;
	}
	public void setIsShared(Boolean isShared) {
		this.isShared = isShared;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}

}