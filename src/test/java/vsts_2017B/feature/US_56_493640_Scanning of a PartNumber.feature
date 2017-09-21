@2017B @US_56 @US_493640 @ScanningofpartnumberPL161
Feature: Scan PartNumber Commercial type PL161

  @FactoryUserProfile @US_56 @TC_ @Positive @CATMake @NonCATMake @PL161
  Scenario: Verify UI of set Part Number popup UI in My Worklist Page in Chrome and IE
   When Navigate to "My worklist"
    And verify PartNumber PencilIcon is diplayed in MyWorklist Page
    And click on PartNumber PencilIcon in MyWorklist Page
    Then Set Part Number popup should be displayed
    And Old Part Number should be displayed with Existing PartNumber in disabled mode in Set Part Number popup
    And New Part Number should be Empty in Set Part Number popup
    And Scan button with ICON should be displayed in Set Part Number popup
    And Manual Entry button with ICON should be displayed in Set Part Number popup
    And Retype Part Number textbox should be Empty in Set Part Number popup
    And Save button should be should be displayed in Set Part Number popup
    And Cancel button should be should be displayed in Set Part Number popup

 @FactoryUserProfile @US_56 @TC_ @Positive @CATMake @PL161
     Scenario Outline: Validate Refactored UI for PartNumber change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And click on PencilEditICON of PartNumber field in Device information popup for <CommercialType> in MyWorklist Page
    And uncheck  Old PartNumber Radiobutton in set Part Number Popup
    And click on New PartNumber radiobutton in set Part Number Popup
    Then Scan button with ICON along with Manual Entry with ICON should be displayed in set Part Number Popup
    And Retype PartNumber with Textbox should be displayed in set Part Number Popup

    Examples: 
      | CommercialType |
      | PL161          |
      | PL161          |


 @FactoryUserProfile @US_56 @TC_ @Positive @CATMake @PL161
  Scenario Outline: valdiate Save Functionality for Scanning valid PartNumber for PL161 for CATMake in Chrome and IE
    When click on Scan button to scan valid <PartNumber> for <CommercialType> in set Part Number Popup
    And click Save button
    Then "Part Number Set Successfully" msg should be displayed Device section in MyWorklist Page
  
   Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |
    
     @FactoryUserProfile @US_56 @TC_ @Positive @CATMake @PL161
    Scenario Outline: valdiate Cancel Functionality for Scanning valid PartNumber for PL161 for CATMake in Chrome and IE
    When click on Scan button to scan valid <PartNumber> for <CommercialType> in set Part Number Popup
    And click Cancel button
   Then Set PartNumber pop up should be closed
  
   Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |
  
  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake
  Scenario Outline: Scanning Invalid PartNumber for PL161 for CATMake in Chrome and IE
    When Scan Invalid <PartNumber>  for <CommercialType> Set Part Number popup
    And click Save button in Set Part Number popup
    Then Error Msg "Please Enter Valid PartNumber" should be displayed

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0-0263   |
      | PL161          | AZ0-026323 |
      | PL161          | A#0-0263   |
      | PL161          | AZ0-0$$3   |
   



  