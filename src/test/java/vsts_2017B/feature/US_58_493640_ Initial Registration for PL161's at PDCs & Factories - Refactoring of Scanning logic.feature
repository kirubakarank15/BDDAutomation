@2017B @US_58 @US_493640 @RefactorScanningofpartnumberPL161
Feature: UI Refactoring of Scanninglogic Commercial type PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2 @CATMake
  Scenario Outline: validate UI and Scanning valid DeviceSerialNumber for PL161 for CATMake in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry with ICON.isDisplayed = True, Manual Entry with ICON.isDisplayed = True" in MyWorklist Page
    When "Scan DeviceSerialNumber = True,Scan Entry.Clicked=True,Equipment S/N=<Equipment S/N>,CommercialType=<CommercialType>,LoaderIcon= True, Scan Text= Scanning" in MyWorklist Page
    Then "ValidDeviceSerialNumber.isDisplayed = True, Show Detail Button.isDisplayed = True" in MyWorklist Page
    When "Show Detail Button.Clicked =True " in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page

    Examples: 
      | CommercialType | Equipment S/N |
      | PL161          | RAM000123     |

  @FactoryUserProfile @Sprint5 @FunctionalPositive3 @CATMake
  Scenario Outline: Scanning Invalid DeviceSerialNumber for PL161 for CATMake in Chrome and IE
    When "Scan DeviceSerialNumber = True,Scan Entry.Clicked=True,Equipment S/N=<Equipment S/N >,CommercialType=<CommercialType>,LoaderIcon= True, Scan Text= Scanning" in MyWorklist Page
    Then Error msg should be displayed for the New Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType | Equipment S/N             |
      | PL161          | RAM$$00123                |
      | PL161          | RAM3364545454545454400123 |

  @FactoryUserProfile @Sprint5 @FunctionalPositive4 @CATMake
  Scenario: validate UI and Scanning Valid Productid change for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Clicked on UI "PartNumber Edit ICON.isDisplayed = True,PartNumber Edit ICON.Clicked=True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON.isDisplayed= True ,Scan button.Clicked= True,LoaderIcon= True, Scan Text= Scanning,New Equipment S/N.Textbox = New valid ProductId, Retype Equipment S/N.Textbox =False" in Edit Serial Number pop up
    When clicked on Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

  @FactoryUserProfile @Sprint5 @FunctionalNegative5 @CATMake
  Scenario: cancelling Scanning of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON.isDisplayed= True ,Scan button.Clicked= True,LoaderIcon= True, Scan Text= Scanning,New Equipment S/N.Textbox = New valid ProductId,Retype Equipment S/N.Textbox =False" in Edit Serial Number pop up
    When clicked on Cancel button
    Then Edit Serial Number pop up should be closed

  @FactoryUserProfile @Sprint5 @FunctionalPositive6
  Scenario Outline: validate UI and ManualEntry of valid DeviceSerialNumber for PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry with ICON.isDisplayed = True, Manual Entry with ICON.isDisplayed = True" in MyWorklist Page
    When "CommercialType=<CommercialType>,Manual Entry.Clicked=True"  in MyWorklist Page
    Then "Enter Device Number Texbox.isDisplayed = True, Enter Device Number button.isDisplayed = True" in MyWorklist Page
    When "Enter Device Number Texbox= <Enter Device Number>,Search Device.Clicked = True" in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page

    Examples: 
      | CommercialType | Enter Device Number |
      | PL161          | RAM000123           |

  @FactoryUserProfile @Sprint5 @FunctionalNegative7
  Scenario Outline: ManualEntry of Invalid DeviceSerialNumber for PL161 with CAT Make in Chrome and IE
    When "Enter Device Number Texbox= <Enter Device Number>,Search Device.Clicked = True" in MyWorklist Page
    Then Error msg should be displayed for the New Scanned Asset in MyWorklist Page

    Examples: 
      | Enter Device Number       |
      | RAM$$00123                |
      | RAM3364545454545454400123 |

  @FactoryUserProfile @Sprint5 @FunctionalPositive8
  Scenario: ManualEntry of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON.isDisplayed= False ,New Equipment S/N.Textbox = New valid ProductId,Retype Equipment S/N.Textbox = Same valid New ProductId" in Edit Serial Number pop up
    When clicked on Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

  @FactoryUserProfile @Sprint5 @FunctionalPositive8
  Scenario: ManualEntry of Wrong Productid in Retype Equipment S/N field for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON.isDisplayed= False ,New Equipment S/N.Textbox = New valid ProductId,Retype Equipment S/N.Textbox = Different New ProductId" in Edit Serial Number pop up
    When clicked on Save button
    Then Error msg "Retyped Product Id is not same" should be displayed in Edit Serial Number pop up

  @FactoryUserProfile @Sprint5 @FunctionalPositive9
  Scenario: Cancelling ManualEntry of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON.isDisplayed= False ,New Equipment S/N.Textbox = New valid ProductId,Retype Equipment S/N.Textbox = Same valid New ProductId" in Edit Serial Number pop up
    When clicked on Cancel button
    Then Edit Serial Number pop up should be closed

  @FactoryUserProfile @Sprint5 @FunctionalPositive10
  Scenario Outline: Validate UI and scanning of Valid PartNumber Change for PL161 with CAT Make in Chrome and IE
    When "Scan Entry.Clicked = True" in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog.isDisplayed = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON.isDisplayed = True,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,PartNumber Scan button.clicked= True,New PartNumber.Textbox = <New PartNumber>,PartNumber.Format = 7AN without -,Retype Part Number.Textbox= False, Save Button.Clicked = True" in SetPartNumber popup
    Then "Part Number Set Successfully,Part Number.Field = New PartNumber" msg should be displayed in Device section in MyWorklist Page

    Examples: 
      | New PartNumber |
      | RAM00123       |
      | RA30012        |

  @FactoryUserProfile @Sprint5 @FunctionalNegative11
  Scenario Outline: Scanning of Invalid PartNumber Entry for PL161 with CAT Make in Chrome and IE
    When "Scan Entry.Clicked = True" in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON.isDisplayed=True,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,PartNumber Scan button.clicked= True,New Part Number.Textbox = <New Part Number>,Retype Part Number.Textbox= False, Save Button.Clicked = True" in SetPartNumber popup
    Then Error Msg should be displayed for Invalid PartNumber in SetPartNumber popup

    Examples: 
      | New PartNumber |
      | RAM 123        |
      | RAM 30012      |
      | RAM-123        |
      | RAM-30012      |

  @FactoryUserProfile @Sprint5 @FunctionalPositive12
  Scenario Outline: ManualEntry of Valid PartNumber Change for PL161 with CAT Make in Chrome and IE
    When "Manual Entry.Clicked = True" in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog.isDisplayed = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON = Displayed,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,New Part Number.Textbox = <New PartNumber> ,Retype Part Number.Textbox = <Retype Part Number>, Save Button = Clicked" in SetPartNumber popup
    Then "Part Number Set Successfully,Part Number.Field = New PartNumber" msg should be displayed in Device section in MyWorklist Page

    Examples: 
      | New PartNumber | Retype Part Number |
      | RAM0012        | RAM0012            |
      | RA300123       | RA30012            |

  @FactoryUserProfile @Sprint5 @FunctionalNegative13
  Scenario Outline: ManualEntry of Invalid PartNumber Entry for PL161 with CAT Make in Chrome and IE
    When "Manual Entry.Clicked = True" in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog.isDisplayed = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON = Displayed,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,New Part Number.Textbox = <New PartNumber> ,Retype Part Number.Textbox = <Retype Part Number>, Save Button = Clicked" in SetPartNumber popup
    Then Error Msg should be displayed for Invalid PartNumber in SetPartNumber popup

    Examples: 
      | New PartNumber |
      | RAM 123        |
      | RAM 30012      |
      | RAM-123        |
      | RAM-30012      |

  @FactoryUserProfile @Sprint5 @FunctionalNegative14
  Scenario Outline: ManualEntry of Wrong PartNumber Entry in Retype Part Number for PL161 with CAT Make in Chrome and IE
    When "Manual Entry.Clicked = True" in MyWorklist Page
    Then "DeviceInformation Popup.isDisplayed = True ,Equipment S/N = Valid Equipment S/N, Edit ICON.isDisplayed = True ,Close button.isDisplayed = True ,Connection Check.isDisplayed = True, Make InfoICON.isDisplayed = True, Model InfoICON.isDisplayed = True, PartNumber Edit ICON.isDisplayed = True" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog.isDisplayed = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON = Displayed,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,New Part Number.Textbox = <New PartNumber> ,Retype Part Number.Textbox = <Retype Part Number>, Save Button = Clicked" in SetPartNumber popup
    Then Error msg "Retyped PartNumber is not same" should be displayed in Edit Serial Number pop up

    Examples: 
      | New PartNumber | Retype Part Number |
      | RAM0012        | RAM0012            |
      | RA300123       | RA30012            |
