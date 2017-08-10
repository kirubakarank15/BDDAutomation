package dsp.automation.AssetStructures.API;

import java.util.List;


public class AttachedDevices {
	private String commercialType; 
    private String type; 
    private String deviceId;
    
    private List<AttachedEcms> attachedEcms; 
    private List<AttachedRadios> attachedRadios;
    
public String getCommercialType() { 
           return commercialType; 
   } 

   public void setCommercialType(String commercialType) { 
           this.commercialType = commercialType; 
   } 

   public String getType() { 
           return type; 
   } 

   public void setType(String type) { 
           this.type = type; 
   } 

   public String getDeviceId() { 
           return deviceId; 
   } 

   public void setDeviceId(String deviceId) { 
           this.deviceId = deviceId; 
   } 
   
   public List<AttachedEcms> getAttachedEcms() { 
           return attachedEcms; 
   } 

   public void setAttachedEcms(List<AttachedEcms> attachedEcms) { 
           this.attachedEcms = attachedEcms; 
   } 

   public List<AttachedRadios> getAttachedRadios() { 
           return attachedRadios; 
   } 

   public void setAttachedRadios(List<AttachedRadios> attachedRadios) { 
           this.attachedRadios = attachedRadios; 
           
   }
   }
   
   


