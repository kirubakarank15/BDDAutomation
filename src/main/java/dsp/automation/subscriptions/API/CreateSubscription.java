package dsp.automation.subscriptions.API;

import java.util.Date;

public class CreateSubscription {
	
	private String make;
	private String serialNumber;                  
	private String siteId;
	private String typeId;
	private String level;
	private String origin;
	private String organization;
	private String organizationType;
	private String associatedOrganization;
	private String associatedOrganizationType;
	private String startTime;
	private String endTime;
	private String dcn;
	private String billingtUserAccountId;
	private String parentId;
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getOrganizationType() {
		return organizationType;
	}
	public void setOrganizationType(String organizationType) {
		this.organizationType = organizationType;
	}
	public String getAssociatedOrganization() {
		return associatedOrganization;
	}
	public void setAssociatedOrganization(String associatedOrganization) {
		this.associatedOrganization = associatedOrganization;
	}
	public String getAssociatedOrganizationType() {
		return associatedOrganizationType;
	}
	public void setAssociatedOrganizationType(String associatedOrganizationType) {
		this.associatedOrganizationType = associatedOrganizationType;
	}
		
	public String getDcn() {
		return dcn;
	}
	public void setDcn(String dcn) {
		this.dcn = dcn;
	}
	public String getBillingtUserAccountId() {
		return billingtUserAccountId;
	}
	public void setBillingtUserAccountId(String billingtUserAccountId) {
		this.billingtUserAccountId = billingtUserAccountId;
	}
	
	
	
}
