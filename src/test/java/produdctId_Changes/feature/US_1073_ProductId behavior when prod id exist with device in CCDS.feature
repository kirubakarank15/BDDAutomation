@US_1073 @DSP @2017B.1 @ProductIdChanges
Feature: Product ID Update in DSP UI
  This feature is to verify the bevavior of product id update when 'To product id' exist in CCDS system with a device

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      | RFV00100     |
      | RFV00101     |

  @TC_ @Positive @Catprofile
  Scenario Outline: To Verify Product Id update when To product id with make combination is not exist in DSP DB and exist in ccds with a next gen device attached
    When User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is not empty
    And If the attached device is an next gen device type
    And Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | To Product id |
      | RFV00102      |
      | RFV00103      |

  @TC_ @Positive @Catprofile
  Scenario Outline: To Verify Product Id update when To product Id with make combination is not exist in DSP DB and exist in CCDS with a legacy device attached with active subscriptions
    When User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is not empty
    And If the attached device is an Legacy device
    And Verify the 'To product id' is having any active legacy subscriptions in Trimble store using Trimble SOAP API
    And Verify in UI This product Id is having an active subscription. Please cancel the subscription in Trimble store is displayed and product id update should not happen

    Examples: 
      | To Product Id |
      | RFV00104      |
      | RFV00105      |

  @TC_ @Positive @Catprofile
  Scenario Outline: To Verify product Id update when To product Id with make combination is not exist in DSP DB and exist in CCDS with a legacy device attached without active subscriptions and user clicked on proceed to claim the product id

    When User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is not empty
    And If the attached device is an Legacy device
    And Verify the 'To product id' is not having any active legacy subscription in Trimble store using Trimble SOAP API
    And Verify in UI a popup with message This asset has a legacy device associated  with it in Trimble store. Please click on proceed to claim the product id
    And If user click on proceed Call CCDS composite API to Claim the product id
#API timeout or null response

    Examples: 
      | To product id |
      | RFV00106      |
      | RFV00107      |

  @TC_ @Positive @Catprofile
  Scenario Outline: To Verify product Id update when To product Id with make combination is not exist in DSP DB and exist in CCDS with a legacy device attached without active subscriptions and user clicked on Cancel to discard the product id claim

    When User clicks on product id update icon
    And Enters '<To product id>'with make combination that is not exists in DSP DB
    And Clicks on save button
    Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    And Check if the response of Asset structure Get API is 200 or 202
    And Check if any devices are attached in AS response
    And If the device array is not empty
    And If the attached device is an Legacy device
    And Verify the 'To product id' is not having any active legacy subscription in Trimble store using Trimble SOAP API
    And Verify in UI a popup with message This asset has a legacy device associated  with it in Trimble store. Please click on proceed to claim the product id
    And If user click on Cancel the product id claim should not happen

    Examples: 
      | To Product id |
      | RFV00108      |
      | RFV00109      |

#diff user profiles
      