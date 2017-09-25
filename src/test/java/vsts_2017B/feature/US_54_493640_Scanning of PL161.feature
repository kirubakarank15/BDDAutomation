@2017B @US_54 @US_493640 @ScanningofPL161
Feature: Scan and register Commercial type PL161

  @FactoryUserProfile @Positive @US_54 @TC_
  Scenario: Verify the UI of the FactoryUserWorkList page in Chrome and IE
    When Navigate to "My worklist"
    Then Search Text Box text as "By Equipment S/N / Engine S/N / Device S/N /Radio S/N" should be displayed in MyWorklist Page
    And Tool tip text as "Enter minimum of 3 characters should be displayed in MyWorklist Page
    And Search Button should be Enabled in MyWorklist Page

  @FactoryUserProfile @Positive @US_54 @TC_
  Scenario Outline: Scan valid DeviceSerialNumber for PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    And Scan valid "<DeviceSerialnumber>" for "<CommercialType>" in MyWorklist Page
    And click on Search button in MyWorklist Page
    Then Device Information should be displayed for the Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialnumber |
      | PL161          | RAM000123          |
      | PL161          | MAD000123          |

  @FactoryUserProfile @Positive @US_54 @TC_
  Scenario Outline: Scan valid DeviceSerialNumber for PL161 with NonCAT Make in Chrome and IE
    When Navigate to "My worklist"
    And Scan valid "<DeviceSerialnumber>" for "<CommercialType>" in MyWorklist Page
    And click on Search button in MyWorklist Page
    Then Device Information should be displayed for the Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialnumber |
      | PL161          | RAM000123          |
      | PL161          | MAD000123          |

  @FactoryUserProfile @Positive @US_54 @TC_
  Scenario Outline: Verify the Edit Serial Number popup UI of the FactoryUserWorkList page in Chrome and IE
    When Scan valid "<DeviceSerialnumber>" for "<CommercialType>" in MyWorklist Page
    And Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    Then Edit Serial Number pop up should be displayed in MyWorklist Page
    And New SerialNumber radiobutton should be displayed in Edit Serial Number pop up
    And SerialNumber Textbox msg "Please select a valid Serial Number or Enter a new Serial Number" should be displayed in Edit Serial Number pop up
    And Edit Serial Number dialog text msg  "Click Save to link the selected Serial number to this device" should be displayed in Edit Serial Number pop up

    Examples: 
      | CommercialType | DeviceSerialnumber |
      | PL161          | RAM000123          |
      | PL161          | MAD000123          |

  @FactoryUserProfile @Positive @US_54 @TC_ @CATMake @NonCATMake
  Scenario Outline: Scan Valid Productid for CATMake and NonCATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new  "<ProductId>" for "<CommercialType>" in MyWorklist Page in Edit Serial Number pop up
    And Make is "<Make>"  displayed in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then ProductId should be displayed New SerialNumber Textbox in Edit Serial Number pop up
    And "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | Make    | ProductId | CommercialType |
      | CAT     | RAM000123 | PL161          |
      | Non CAT | MAD000125 | PL161          |
      | CAT     | MAD000123 | PL161          |
      | Non CAT | RAM000125 | PL161          |

  @FactoryUserProfile @Positive @US_54 @TC_ @CATMake @NonCATMake
  Scenario Outline: Cancel Scanning of Valid Productid for CATMake and NonCATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new "<ProductId>" for "<CommercialType>" in Edit Serial Number pop up
    And Make is "<Make>" displayed in Edit Serial Number pop up
    And click Cancel button in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

    Examples: 
      | Make    | ProductId | CommercialType |
      | CAT     | RAM000123 | PL161          |
      | Non CAT | MAD000125 | PL161          |

  @FactoryUserProfile @Positive @US_54 @TC_
  Scenario: Edit the Product id for PL161 with active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    Then Error Popup message "Please cancel the subscriptions or services set on xxxxxxx to change the product ID." should be displayed

  @FactoryUserProfile @US_54 @TC_ @Negative
  Scenario Outline: Scan Invalid Barcode or DeviceSerialNumber for AssetSerialNumber of PL161 in Chrome and IE
    When Scan Invalid "<DeviceSerialnumber>" for "<CommercialType>" in MyWorklist Page
    And click on Search button in MyWorklist Page
    Then Error Msg should be displayed for the Invalid AssetSerialNumber in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialnumber |
      | PL161          | RA00153            |
      | PL161          | RA$00153           |
      | PL161          | R  00153           |
      | PL161          | R-$00153           |

  @FactoryUserProfile @US_54 @TC_ @Negative
  Scenario Outline: Unable to Search the Scanned AssetSerialNumber of PL161 in Chrome and IE
    When Scan valid "<DeviceSerialnumber>" for "<CommercialType>" in MyWorklist Page
    And click on Search button in MyWorklist Page
    Then LoaderIcon should be displayed
    And Time out Error Msg should be displayed

    Examples: 
      | CommercialType | DeviceSerialnumber |
      | PL161          | RAM000123          |
      | PL161          | NAD000123          |

  @FactoryUserProfile @US_54 @TC_ @Negative @CATMake @NonCATMake
  Scenario Outline: Scan Invalid Productid for CATMake or NonCATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new "<ProductId>" for "<CommercialType>" in MyWorklist Page in Edit Serial Number pop up
    And Make is "<Make>" displayed in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then Error msg should be displayed for the New Scanned ProductId in MyWorklist Page

    Examples: 
      | CommercialType | Make    | ProductId |
      | PL161          | CAT     | RA00153   |
      | PL161          | Non CAT | RA$00153  |
      | PL161          | CAT     | R  00153  |
      | PL161          | Non CAT | R-$00153  |
