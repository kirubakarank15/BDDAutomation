@US_1072 @DSP @2017B.1 @ProductIdChanges
Feature: Product ID Update in DSP UI
  This feature is to verify the bevavior of product id update when 'To product id' exist in CCDS system without a device

  @TC_ @Positive @catprofile
  Scenario Outline: To verify Product Id update when To product id with Cat make is not exist in DSP DB and exist in ccds without a device and without active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether To product id is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the To product id is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    #get the testdata from CCDS with legacy device and subscriotion in trimble
    #compare the guid after the prod id update
    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00170     | FDB01202      | CAT  |
      | RFV00171     | FRA00120YD    | Z99  |
      | RFV00172     | JSM00397      | CAT  |
      | RFV00173     | MSY00544      | CAT  |
      | RFV00174     | ABC41056      | CAT  |

  @TC_ @Positive @catprofile
  Scenario Outline: To verify Product Id update when To product id with Non Cat make is not exist in DSP DB and exist in ccds without a device and without active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    #get the testdata from CCDS with legacy device and subscription in trimble
    #compare the guid after the prod id update
    Examples: 
      | SerialNumber | To product id | Make |
      |              | FDB01202      | CAT  |
      |              | FRA00120YD    | Z99  |
      |              | JSM00397      | CAT  |
      |              | MSY00544      | CAT  |
      |              | ABC41056      | CAT  |

  @TC_ @Positive @catprofile
  Scenario Outline: To verify product Id update when To product id with Cat make is not exist in DSP DB and exist in CCDS without a device but with active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>' with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    #prodid should not change
    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      | CAT  |
      |              | RFV00101      | Z99  |

  @TC_ @Positive @catprofile
  Scenario Outline: To verify product Id update when To product id with Non Cat make is not exist in DSP DB and exist in CCDS without a device but with active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>' with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    #prodid should not change
    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      | CAT  |
      |              | RFV00101      | Z99  |

  @TC_ @Positive @Dealerprofile
  Scenario Outline: To verify Product Id update when To product id with CAT make is not exist in DSP DB and exist in ccds without a device and without active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @Dealerprofile
  Scenario Outline: To verify Product Id update when To product id with Non Cat make is not exist in DSP DB and exist in ccds without a device and without active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @Dealerprofile
  Scenario Outline: To verify product Id update when To product id with Cat make is not exist in DSP DB and exist in CCDS without a device but with active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>' with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @Dealerprofile
  Scenario Outline: To verify product Id update when To product id with Non Cat make is not exist in DSP DB and exist in CCDS without a device but with active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>' with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    Examples: 
      | To product id |
      | RFV00100      |
      | RFV00101      |

  @TC_ @Positive @Factoryuser 
  Scenario Outline: To verify Product Id update when To product id with Cat make is not exist in DSP DB and exist in ccds without a device and without active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @Factoryuser 
  Scenario Outline: To verify Product Id update when To product id with Non Cat make is not exist in DSP DB and exist in ccds without a device and without active trimble subscription
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @Factoryuser 
  Scenario Outline: To verify product Id update when To product id with Cat make combination is not exist in DSP DB and exist in CCDS without a device
    but with active trimble subscription

    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>' with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @Factoryuser
  Scenario Outline: To verify product Id update when To product id with Non Cat make combination is not exist in DSP DB and exist in CCDS without a device
    but with active trimble subscription

    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>' with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    Examples: 
      | SerialNumber | To product id | Make |
      |              | RFV00100      |      |
      |              | RFV00101      |      |

  @TC_ @Positive @FieldTechnician
  Scenario Outline: To verify Product Id update when To product id with make combination is not exist in DSP DB and exist in ccds without a device
    and without active trimble subscription

    When User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is not having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI product id is changed successfully by calling CCDS Composite API

    Examples: 
      | To product id |
      | RFV00100      |
      | RFV00101      |

  @TC_ @Positive @FieldTechnician
  Scenario Outline: To verify product Id update when To product id with make combination is not exist in DSP DB and exist in CCDS without a device
    but with active trimble subscription

    When User clicks on product id update icon
    And Enters '<To product id>' with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS syste,
    And check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is empty
    And Verify the 'To product id' is having active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This Product Id is having an active subscription. Please cancel the subscription in Trimble store is shown and product id update should not happen

    Examples: 
      | To product id |
      | RFV00100      |
      | RFV00101      |
