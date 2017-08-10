package dsp.automation.AssetStructures.API;

import java.util.List;

public class SampleModel {
	
	/*private String make="CAT"; 
	private String serialNumber="MUN12345";*/ 
	private String make; 
	private String serialNumber;
	private List<AttachedDevices> attachedDevices; 
	private List<Components> components; 


	public String getMake() { 
	        return make; 
	} 
	public void setMake(String make) { 
	        this.make = make; 
	} 
	
	public String getSerialNumber() { 
		
        return serialNumber; 
	}
	
	public void setSerialNumber(String serialNumber) 
	{ 
        this.serialNumber = serialNumber; 
         } 
	 

	public List<AttachedDevices> getAttachedDevices() {
		return attachedDevices;
	}
	public void setAttachedDevices(List<AttachedDevices> attachedDevices) {
		this.attachedDevices = attachedDevices;
	} 

	public List<Components> getComponents() { 
	        return components; 
	} 
	public void setComponents(List<Components> components) { 
	        this.components = components; 
	}
}
