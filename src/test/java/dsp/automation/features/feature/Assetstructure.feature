@API @TESTs
Feature: Asset Onboarding through CCDS
  This feature is to Validate Assetstructure API response and Verify Onboarded asset values in DB

  @Sanity @Regression @Positive
  Scenario Outline: Comapare and Validate AssetStructureVerbose from AssetStructureMessage Table
    Given Construct OAuth key and Random generated Attributes for PostAssetStructure Template
    When Construct Post AssetStructure request API with "<CommercialType>"
    Then Validate Successful API Response and "<HttpStatus>" of the Post AssetStructure request API

    Examples: 
      | CommercialType | HttpStatus |
      | PLE641         |        201 |
      #| PLE631         |        201 |
      #| PLE641+PL631   |        201 |
      #| PLE601         |        201 |
      #| PL641          |        201 |
      #| PL631          |        201 |
      #| PL131          |        201 |
      #| PL141          |        201 |
      #| PL161          |        201 |
      #| PL671          |        201 |

  @Sanity @Regression @Positive
  Scenario: Retrieve AssetStructureVerbose from AssetStructureMessage Table
    Given Connection set for DB to access AssetStructureMessage Table
    Then Retrieve assetStructureVerbose with SerialNumber for the newly Onboarded Asset

  @Sanity @Regression @Positive
  Scenario: Retrieve Asset Table for the newly Onboarded Asset
    Given Connection set for DB to access Asset Table
    Then Retrieve the values of EngineSerialNumber ,Device_Type,IS_Telematic_Registered,Serial_Number, device_Id, Asset_ID in Asset Table for the newly Onboarded Asset

  @Sanity @Regression @Positive
  Scenario: Retrieve Radio ,Device ,AssetSubscriptionHistory and AssetSubscription for the newly Onboarded Asset
    Given Connection set for DB to access Radio, Device, SubsciptionHistory and AssetSubscription Tables
    Then Retrieve the values of Radio details in Radio Table for onboarded asset
    And Retrieve the values of Device_Id ,Commercial_type in Device Table for onboarded asset
    And Retrieve the values of Subscription_id in AssetSubscriptionHistory Table for onboarded asset
    And Retrieve the values of Subscription_id in AssetSubscription Table for onboarded asset
    And Verify the Subscription_id is "376"
