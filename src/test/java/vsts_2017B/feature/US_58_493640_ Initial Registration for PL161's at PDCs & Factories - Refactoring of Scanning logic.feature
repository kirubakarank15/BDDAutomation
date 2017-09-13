@2017B @US_58 @US_493640 @RefactorScanningofpartnumberPL161
Feature: Refactoring of Scanninglogic Commercial type PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario Outline: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"

    Examples: 
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2
  Scenario Outline: Valdiate UI Refactoring for Scanning valid DeviceSerialNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry = Displayed with ICON, Manual Entry = Displayed with ICON" in MyWorklist Page
    When Scanned for "CommercialType=<CommercialType>,Scan Entry= Clicked, LoaderIcon= True, Scan Text= Scanning" in MyWorklist Page
    Then "DeviceSerialNumber = Displayed, Show Detail Button = Displayed" in MyWorklist Page
    When "Show Detail Button = Clicked" in MyWorklist Page
    Then "DeviceInformation Popup = Displayed,Equipment S/N = DeviceSerialNumber, Edit ICON = Displayed,Close button = Displayed,Connection Check = Displayed, Make.InfoICON = True, Model.InfoICON= True, PartNumber = Edit ICON" in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive3
  Scenario Outline: Valdiate UI Refactoring for Scanning Invalid DeviceSerialNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry = Displayed with ICON, Manual Entry = Displayed with ICON" in MyWorklist Page
    When Scanned for "CommercialType=<CommercialType>,Scan Entry= Clicked, LoaderIcon= True, Scan Text= Scanning" in MyWorklist Page
    Then Error msg should be displayed for the New Scanned Asset in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive4
  Scenario: Validate UI Refactoring of Scanning Valid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON = Displayed,Scan button= Clicked,LoaderIcon= True, Scan Text= Scanning,New Equipment S/N.Textbox = New ProductId" in Edit Serial Number pop up
    When clicked on Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

  @FactoryUserProfile @Sprint5 @FunctionalNegative5
  Scenario: Validate UI Refactoring of cancelling Scan of Valid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan with ICON = Displayed,LoaderIcon= True, Scan Text= Scanning,New Equipment S/N.Textbox = New ProductId" in Edit Serial Number pop up
    When clicked on Cancel button
    Then Edit Serial Number pop up should be closed

  @FactoryUserProfile @Sprint5 @FunctionalPositive6
  Scenario: Edit the Product id of commercial type PL161 with active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then Error Popup message "Please cancel the subscriptions or services set on xxxxxxx to change the product ID." should be displayed

  @FactoryUserProfile @Sprint5 @FunctionalPositive7
  Scenario Outline: Valdiate UI Refactoring for ManualEntry of valid DeviceSerialNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry = Displayed with ICON, Manual Entry = Displayed with ICON" in MyWorklist Page
    When Scanned for "CommercialType=<CommercialType>,Manual Entry= Clicked, LoaderIcon= True, Scan Text= Scanning" in MyWorklist Page
    Then "Enter Device Number.Texbox = Displayed, Enter Device Number = Displayed" in MyWorklist Page
    When DeviceNumber Entered "Search Device = Clicked" in MyWorklist Page
    Then "DeviceInformation Popup = Displayed,Equipment S/N = DeviceSerialNumber, Edit ICON = Displayed,Close button = Displayed,Connection Check = Displayed, Make.InfoICON = True, Model.InfoICON= True, PartNumber = Edit ICON" in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive8
  Scenario: Validate UI Refactoring of ManualEntry of Valid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON = Displayed,New Equipment S/N.Textbox = New ProductId,Retype Equipment S/N = Same New ProductId" in Edit Serial Number pop up
    When clicked on Save button
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

  @FactoryUserProfile @Sprint5 @FunctionalPositive9
  Scenario: Validate UI for ManualEntry of Wrong Productid in Retype Equipment S/N field for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON = Displayed,New Equipment S/N.Textbox = New ProductId,Retype Equipment S/N = different New ProductId" in Edit Serial Number pop up
    When clicked on Save button
    Then Error msg "Retyped Product Id is not same" should be displayed in Edit Serial Number pop up

  @FactoryUserProfile @Sprint5 @FunctionalPositive10
  Scenario: Validate UI Refactoring of cancelling ManualEntry of Valid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    And "Make = CAT with Dropdown, Old Equipment S/N = Existing DeviceSerialNumber,Old Equipment S/N.Radiobutton = checked,New Equipment S/N.Radiobutton = Unchecked,New Equipment S/N.Textbox= Empty,Retype Equipment S/N.Textbox = Empty" in Edit Serial Number pop up
    When New SerialNumber radiobutton is checked
    Then "Scan button with ICON = Displayed,New Equipment S/N.Textbox = New ProductId,Retype Equipment S/N = Same New ProductId" in Edit Serial Number pop up
    When clicked on Cancel button
    Then Edit Serial Number pop up should be closed

  @FactoryUserProfile @Sprint5 @FunctionalPositive11
  Scenario: Valdiate UI Refactoring for ManualEntry of PartNumber Change for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry = Displayed with ICON, Manual Entry = Displayed with ICON" in MyWorklist Page
    When "Scan Entry Or Manual Entry = Clicked" in MyWorklist Page
    Then "DeviceInformation Popup = Displayed,Equipment S/N = DeviceSerialNumber, Edit ICON = Displayed,Close button = Displayed,Connection Check = Displayed, Make.InfoICON = True, Model.InfoICON= True, PartNumber = Edit ICON" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON = Displayed,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,New Part Number.Textbox = New PartNumber ,Retype Part Number.Textbox = Same New PartNumber,PartNumber.Format = 7AN without -, Save Button = Clicked" in SetPartNumber popup
    Then "Part Number Set Successfully,Part Number.Field = New PartNumber" msg should be displayed in Device section in MyWorklist Page

  @FactoryUserProfile @Sprint5 @FunctionalNegative12
  Scenario: Valdiate UI Refactoring for ManualEntry of Invalid PartNumber Entry for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry = Displayed with ICON, Manual Entry = Displayed with ICON" in MyWorklist Page
    When "Scan Entry Or Manual Entry = Clicked" in MyWorklist Page
    Then "DeviceInformation Popup = Displayed,Equipment S/N = DeviceSerialNumber, Edit ICON = Displayed,Close button = Displayed,Connection Check = Displayed, Make.InfoICON = True, Model.InfoICON= True, PartNumber = Edit ICON" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON = Displayed,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,New Part Number.Textbox = New PartNumber ,Retype Part Number.Textbox = Same New PartNumber,PartNumber.Format = 6AN without - or 8AN without -, Save Button = Clicked" in SetPartNumber popup
    Then Error Msg should be displayed for Invalid PartNumber in SetPartNumber popup

  @FactoryUserProfile @Sprint5 @FunctionalNegative13
  Scenario: Valdiate UI Refactoring for ManualEntry of Invalid PartNumber Entry with - for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    Then verify UI "Setup New Device Number Text, Scan Entry = Displayed with ICON, Manual Entry = Displayed with ICON" in MyWorklist Page
    When "Scan Entry Or Manual Entry = Clicked" in MyWorklist Page
    Then "DeviceInformation Popup = Displayed,Equipment S/N = DeviceSerialNumber, Edit ICON = Displayed,Close button = Displayed,Connection Check = Displayed, Make.InfoICON = True, Model.InfoICON= True, PartNumber = Edit ICON" in MyWorklist Page
    When Edit Icon of Partnumber field is clicked
    Then "Set Part Number dialog = True,Old Part Number.Radiobutton = Checked, Old Part Number.Textbox = Existing PartNumber,New Part Number.Radiobutton = Unchecked,New Part Number.Textbox = Empty,Scan button with ICON = Displayed,Retype Part Number.Textbox= Empty" displayed in SetPartNumber popup
    When "New Part Number.Radiobutton = Checked,New Part Number.Textbox = New PartNumber ,Retype Part Number.Textbox = Same New PartNumber,PartNumber.Format = 6AN with - or 8AN with -, Save Button = Clicked" in SetPartNumber popup
    Then Error Msg should be displayed for Invalid PartNumber in SetPartNumber popup
