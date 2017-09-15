@2017B @US_54 @US_493640 @ScanningofPL161
Feature: Scan and register Commercial type PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"
 
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2
  Scenario Outline: Scan valid DeviceSerialNumber for PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    And verify UI "Search Text Box=By Equipment S/N / Engine S/N / Device S/N /Radio S/N,Tool tip=Enter minimum of 3 characters,Search Button=Enabled" in MyWorklist Page
    And Scan valid DeviceSerialnumber "CommercialType=<CommercialType>,Search button.Clicked =True" in MyWorklist Page
    Then Device Information should be displayed for the Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive3
  Scenario Outline: Scan valid DeviceSerialNumber for PL161 with NonCAT Make in Chrome and IE
    When Navigate to "My worklist"
    And verify UI "Search Text Box=By Equipment S/N / Engine S/N / Device S/N /Radio S/N,Tool tip=Enter minimum of 3 characters,Search Button=Enabled" in MyWorklist Page
    And Scan valid DeviceSerialnumber "CommercialType=<CommercialType>,Search button.Clicked =True" in MyWorklist Page
    Then Device Information should be displayed for the Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive4 @CATMake
  Scenario: Scan Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "New SerialNumber radiobutton= Checked,scan new Product id =True,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Save button.Clicked =True" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

  @FactoryUserProfile @Sprint5 @FunctionalPositive5 @CATMake
  Scenario: Cancel Scanning of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "New SerialNumber radiobutton= Checked,scan new Product id =True,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Cancel button.Clicked =True" in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

  @FactoryUserProfile @Sprint5 @FunctionalPositive6
  Scenario: Edit the Product id for PL161 with active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then Error Popup message "Please cancel the subscriptions or services set on xxxxxxx to change the product ID." should be displayed

  @FactoryUserProfile @Sprint5 @FunctionalPositive7 @NonCATMake
  Scenario: Scan Valid Productid for NonCATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "New SerialNumber radiobutton= Checked,scan new Product id =True,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Save button.Clicked =True" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed in Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

  @FactoryUserProfile @Sprint5 @FunctionalPositive8 @NonCATMake
  Scenario: Cancel Scan of Valid Productid for NonCATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "New SerialNumber radiobutton= Clicked,scan new Product id =True,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Cancel button =Clicked" in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

  @FactoryUserProfile @Sprint5 @FunctionalNegative9
  Scenario Outline: Scan Invalid Barcode for AssetSerialNumber of PL161 in Chrome and IE
    When Scan Invalid DeviceSerialnumber "CommercialType=<CommercialType>,Search button.Clicked =True" in MyWorklist Page
    Then Error Msg should be displayed for the Invalid AssetSerialNumber in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative10
  Scenario Outline: Unable to Search the Scanned AssetSerialNumber of PL161 in Chrome and IE
    When Scan valid DeviceSerialnumber "CommercialType=<CommercialType>,Search button.Clicked =True" in MyWorklist Page
    Then LoaderIcon should be displayed
    And Time out Error Msg should be displayed

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative11 @InvalidDeviceSerialNumber @CATmake
  Scenario Outline: Scan Invalid DeviceSerialNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Scan valid DeviceSerialnumber "CommercialType=<CommercialType>,Search button.Clicked =True" in MyWorklist Page
    Then Error msg should be displayed for the New Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative12 @CATMake
  Scenario: Scan InValid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "New SerialNumber radiobutton= Checked,scan new Product id =True,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Save button.Clicked =True" in Edit Serial Number pop up
    Then Error msg should be displayed for the New Scanned ProductId in MyWorklist Page
