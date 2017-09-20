@2017B @US_58 @US_493640 @RefactorScanningofpartnumberPL161
Feature: UI Refactoring of Scanninglogic Commercial type PL161

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario: validate Refactored in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    Then In UI Setup New Device Number Text displayed in MyWorklist Page
    And Scan Entry button with ICON should be displayed  in MyWorklist Page
    And Manual Entry button with ICON should be displayed  in MyWorklist Page

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate UI and valid DeviceSerialNumber scanning in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    And click on Scan Entry Button to scan valid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in MyWorklist Page
    Then LoaderIcon with Scanning Button should be displayed in MyWorklist Page
    And scanned DeviceserialNumber with crossmark above the Show Detail button should be displayed in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM000123          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate the Device information popup for the Scanned DeviceSerialNumber in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    And Click on Show Detail button with "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Scanned DeviceSerialNumber should be displayed in Equipment S/N field with PencilEditICON in Device information popup in MyWorklist Page
    And PencilEditICON of Equipment S/N field should be Enabled in Device information popup in MyWorklist Page
    And Close button should be displayed in Device information popup in MyWorklist Page
    And Connection Check should be displayed at the botton in Device information popup in MyWorklist Page
    And Info Icon should be displayed for Make and Model in Device information popup in MyWorklist Page
    And PartNumber Edit ICON should be displayed in Device information popup in MyWorklist Page
    And PencilEditICON of PartNumber field should be Enabled in Device information popup in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM000123          |

  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake @PL161
  Scenario Outline: Scanning Invalid DeviceSerialNumber in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    And click on Scan Entry Button to scan valid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in MyWorklist Page
    Then LoaderIcon with Scanning Button should be displayed in MyWorklist Page
    And Error msg should be displayed for the Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType | Equipment S/N             |
      | PL161          | RAM$$00123                |
      | PL161          | RAM3364545454545454400123 |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate Refactored UI of Edit Serial Number Popup for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on PencilEditICON of Equipment S/N field in Device information popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Edit Serial Number popup should be displayed
    And Make should be dropdown with CAT by default in Edit Serial Number popup
    And Old Equipment S/N field Radiobutton should be checked with Existing DeviceSerialNumber in disabled mode in Edit Serial Number popup
    And New Equipment S/N Radiobutton should be unchecked with empty Textbox in Edit Serial Number popup
    And Retype Equipment S/N Radiobutton should be unchecked with empty Textbox in Edit Serial Number popup
    And Save and Cancel button should be displayed in Edit Serial Number popup

    Examples: 
      | CommercialType |
      | PL161          |
      | PL161          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Refactored UI for Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And click on PencilEditICON of Equipment S/N field in Device information popup for "CommercialType=<CommercialType>" in MyWorklist Page
    And uncheck  Old Equipment S/N field Radiobutton in Edit Serial Number popup
    And click on New Equipment S/N radiobutton in Edit Serial Number popup
    Then Scan button with ICON along with Manual Entry with ICON should be displayed in Edit Serial Number popup
    And New Equipment S/N Radiobutton should be checked with empty Textbox in Edit Serial Number popup

    Examples: 
      | CommercialType |
      | PL161          |
      | PL161          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Scanning of valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on PencilEditICON of Equipment S/N field in Device information popup for "CommercialType=<CommercialType>" in MyWorklist Page
    And click on New Equipment S/N radiobutton in Edit Serial Number popup
    And click on Scan button to scan valid "DeviceSerialNumber = <DeviceSerialNumber>" in Edit Serial Number popup
    Then LoaderIcon with Scanning Text should be displayed in Edit Serial Number popup
    And Manual Entry button with ICON should be displayed in Edit Serial Number popup
    And New DeviceSerialNumber should be displayed in New Equipment S/N textbox with crossmark in Edit Serial Number popup

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM00123           |
      | PL161          | RAM00123           |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Save functionality for Scanned valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on Scan button to scan valid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And click Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM00123           |
      | PL161          | RAM00123           |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: cancel Scanning of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on Scan button to scan valid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And click Cancel button
    Then Edit Serial Number pop up should be closed

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM00123           |
      | PL161          | RAM00123           |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate UI and ManualEntry of valid DeviceSerialNumber in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    And click on Manual Entry Button
    And Enter valid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Enter Device Number Button with Empty textbox above the button should be displayed in MyWorklist Page
    And New DeviceSerialNumber with crossmark should be displayed in Textbox in MyWorklist Page
    And Search Device button should be displayed in MyWorklist Page

    Examples: 
      | CommercialType | Enter Device Number |
      | PL161          | RAM000123           |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate the Device information popup for the Manual Entered DeviceSerialNumber in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    And click on Search Device Button with "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Entered DeviceSerialNumber should be displayed in Equipment S/N field with PencilEditICON in Device information popup in MyWorklist Page
    And PencilEditICON of Equipment S/N field should be Enabled in Device information popup in MyWorklist Page
    And Close button should be displayed in Device information popup in MyWorklist Page
    And Connection Check should be displayed at the botton in Device information popup in MyWorklist Page
    And Info Icon should be displayed for Make and Model in Device information popup in MyWorklist Page
    And PartNumber Edit ICON should be displayed in Device information popup in MyWorklist Page
    And PencilEditICON of PartNumber field should be Enabled in Device information popup in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM000123          |

  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake @PL161
  Scenario Outline: ManualEntry of Invalid DeviceSerialNumber in MyWorklist Page for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    And click on Manual Entry Button
    And Enter Invalid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Error msg should be displayed for the newly Entered DeviceSerialNumber in MyWorklist Page

    Examples: 
      | CommercialType | DeviceSerialNumber        |
      | PL161          | RAM$$00123                |
      | PL161          | RAM3364545454545454400123 |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate ManualEntry of Valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on PencilEditICON of Equipment S/N field in Device information popup for "CommercialType=<CommercialType>" in MyWorklist Page
    And click on New Equipment S/N radiobutton in Edit Serial Number popup
    And click Manual Entry button to enter valid " New Equipment S/N = < New Equipment S/N>" in New Equipment S/N textbox in Edit Serial Number popup
    Then New Equipment S/N radiobutton should be checked in Edit Serial Number popup
    And Scan button with ICON should be displayed in Edit Serial Number popup
    And Crossmark should be displayed along with New DeviceSerialNumber in New Equipment S/N textbox in Edit Serial Number popup
    And Same New DeviceSerialNumber should be displayed in Retype Equipment S/N textbox in Edit Serial Number popup

    Examples: 
      | CommercialType | New Equipment S/N |
      | PL161          | RAM00123          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Save functionality for ManualEntered valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click Manual Entry button to enter valid " New Equipment S/N = < New Equipment S/N>" for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And click Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType | New Equipment S/N |
      | PL161          | RAM00123          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Cancelling ManualEntry of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click Manual Entry button to enter valid " New Equipment S/N = < New Equipment S/N>" for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And click Cancel button
    Then Edit Serial Number pop up should be closed

    Examples: 
      | CommercialType | New Equipment S/N |
      | PL161          | RAM00123          |

  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake @PL161
  Scenario Outline: Validate ManualEntry of Wrong Productid in Retype Equipment S/N field for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click Manual Entry button to enter valid " New Equipment S/N = < New Equipment S/N>" in New Equipment S/N textbox for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And Enter Wrong Productid in "Retype Equipment S/N = <Retype Equipment S/N>" textbox  in Edit Serial Number pop up
    And click Save button
    Then Retype Equipment S/N  textbox should be highlighted in red in Edit Serial Number pop up

    Examples: 
      | CommercialType | New Equipment S/N | Retype Equipment S/N |
      | PL161          | RAM00123          | AMR00123             |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
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

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Refactored UI for PartNumber change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And click on PencilEditICON of PartNumber field in Device information popup for "CommercialType=<CommercialType>" in MyWorklist Page
    And uncheck  Old PartNumber Radiobutton in set Part Number Popup
    And click on New PartNumber radiobutton in set Part Number Popup
    Then Scan button with ICON along with Manual Entry with ICON should be displayed in set Part Number Popup
    And Retype PartNumber with Textbox should be displayed in set Part Number Popup

    Examples: 
      | CommercialType |
      | PL161          |
      | PL161          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: valdiate Save Functionality for Scanning valid PartNumber for PL161 for CATMake in Chrome and IE
    When click on Scan button to scan valid "PartNumber = <PartNumber>" for "CommercialType=<CommercialType>" in set Part Number Popup
    And click Save button
    Then "Part Number Set Successfully" msg should be displayed Device section in MyWorklist Page

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: valdiate Cancel Functionality for Scanning valid PartNumber for PL161 for CATMake in Chrome and IE
    When click on Scan button to scan valid "PartNumber = <PartNumber>" for "CommercialType=<CommercialType>" in set Part Number Popup
    And click Cancel button
    Then Set PartNumber pop up should be closed

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |

  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake
  Scenario Outline: Scanning Invalid PartNumber for PL161 for CATMake in Chrome and IE
    When Scan Invalid "PartNumber = <PartNumber>"  for "CommercialType =<CommercialType>" Set Part Number popup
    And click Save button in Set Part Number popup
    Then Error Msg "Please Enter Valid PartNumber" should be displayed

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0-0263   |
      | PL161          | AZ0-026323 |
      | PL161          | A#0-0263   |
      | PL161          | AZ0-0$$3   |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate ManualEntry of Valid PartNumber change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on PencilEditICON of PartNumber field in Device information popup for "CommercialType=<CommercialType>" in MyWorklist Page
    And click on New PartNumber radiobutton in set Part Number Popup
    And click Manual Entry button to enter valid "PartNumber = <PartNumber>" in New Equipment S/N textbox in set Part Number Popup
    Then New PartNumber radiobutton should be checked in set Part Number Popup
    And Scan button with ICON should be displayed in set Part Number Popup
    And Crossmark should be displayed along with New PartNumber in New PartNumber textbox in set Part Number Popup
    And Same New PartNumber should be displayed in Retype PartNumber textbox in set Part Number Popup

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | RAM00123   |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate save Functionality for ManualEntry of Valid PartNumber Change for PL161 with CAT Make in Chrome and IE
    When click on Manual Entry button to enter valid "PartNumber = <PartNumber>" for "CommercialType=<CommercialType>" in set Part Number Popup
    And click Save button
    Then "Part Number Set Successfully" msg should be displayed Device section in MyWorklist Page

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: validate Cancel Functionality for ManualEntry of Valid PartNumber Change for PL161 with CAT Make in Chrome and IE
    When click on Manual Entry button to enter valid "PartNumber = <PartNumber>" for "CommercialType=<CommercialType>" in set Part Number Popup
    And click Cancel button
    Then set Part Number Popup should be closed

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |

  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake @PL161
  Scenario Outline: ManualEntry of Wrong PartNumber Entry in Retype Part Number field for PL161 with CAT Make in Chrome and IE
    When click Manual Entry button to enter valid " PartNumber = <PartNumber>" in New Equipment S/N textbox for "CommercialType=<CommercialType>" in SetPartNumber popup
    And Enter Wrong PartNumber in "Retype Part Number= <Retype Part Number>" textbox  in SetPartNumber popup
    And click Save button
    Then Retype Part Number textbox should be highlighted in red in Edit Serial Number pop up

    Examples: 
      | CommercialType | PartNumber | Retype Part Number |
      | PL161          | RAM00123   | AMR00123           |

  @FactoryUserProfile @US_58 @TC_ @Negative @CATMake @PL161
  Scenario Outline: ManualEntry of Invalid Part Number Entry for PL161 with CAT Make in Chrome and IE
    When click Manual Entry button to enter Invalid " PartNumber = <PartNumber>" in New Equipment S/N textbox for "CommercialType=<CommercialType>" in SetPartNumber popup
    And click Save button
    Then Error Msg should be displayed for Invalid PartNumber in SetPartNumber popup

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | RAM 123    |
      | PL161          | RAM 30012  |
      | PL161          | RAM-123    |
      | PL161          | RAM-30012  |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Toggling to ManualEntry from Scanning Valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on Scan button to scan valid "DeviceSerialNumber = <DeviceSerialNumber>" for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And click Manual Entry button in Edit Serial Number popup
    And Enter value in New Equipment S/N Field in Edit Serial Number popup
    And Enter value in Retype Equipment S/N Field in Edit Serial Number popup
    And verify scan and Manual Entry button is displayed in Edit Serial Number popup
    And click Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM000123          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Toggling to Scanning from ManualEntry of Valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click Manual Entry button to enter valid " New Equipment S/N = < New Equipment S/N>" for "CommercialType=<CommercialType>" in Edit Serial Number popup
    And click Scan button in Edit Serial Number popup
    And verify scan and Manual Entry button is displayed in Edit Serial Number popup
    And click Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType | DeviceSerialNumber |
      | PL161          | RAM000123          |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Toggling to ManualEntry from Scanning valid PartNumber Change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click on Scan button to scan valid "PartNumber = <PartNumber>" for "CommercialType=<CommercialType>" in set Part Number Popup
    And click Manual Entry button in set Part Number Popup
    And Enter value in New PartNumber Field in set Part Number Popup
    And Enter value in Retype PartNumber Field in set Part Number Popup
    And verify scan and Manual Entry button is displayed in set Part Number Popup
    And click Save button
    Then "Part Number Set Successfully" msg should be displayed Device section in MyWorklist Page

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |

  @FactoryUserProfile @US_58 @TC_ @Positive @CATMake @PL161
  Scenario Outline: Validate Toggling to Scanning from ManualEntry valid PartNumber Change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When click Manual Entry button to enter valid "PartNumber = <PartNumber>" for "CommercialType=<CommercialType>" in set Part Number Popup
    And click Scan button in set Part Number Popup
    And verify scan and Manual Entry button is displayed in Edit Serial Number popup
    And click Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType | PartNumber |
      | PL161          | AZ0 5263   |
