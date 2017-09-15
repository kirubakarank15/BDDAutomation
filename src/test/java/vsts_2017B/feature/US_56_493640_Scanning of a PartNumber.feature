@2017B @US_56 @US_493640 @ScanningofpartnumberPL161
Feature: Scan PartNumber Commercial type PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2 @CATMake @NonCATMake @PL161
  Scenario: Verify UI of Edit Serial Number popup in My Worklist Page in Chrome and IE
    When Navigate to "My worklist"
    And "Search Text Box=By Equipment S/N / Engine S/N / Device S/N /Radio S/N,Tool tip=Enter minimum of 3 characters,Search Button.isEnabled=True" in MyWorklist Page
    And "PartNumber PencilIcon.IsEnabled = True,PencilIcon.clicked = True" in MyWorklist Page
    Then verify UI "EditPartNumer popup.isDisplayed = True ,PartNumber.Texbox = Empty" in EditPartNumber Popup

  @FactoryUserProfile @Sprint5 @FunctionalPositive3 @CATmake
  Scenario Outline: Set or Edit Scanning valid PartNumber for PL161 for CATMake in Chrome and IE
    When "PartNumber PencilIcon.isEnabled = True,PencilIcon.clicked = True" in MyWorklist Page
    And "CommercialType =<CommercialType>,Scan PartNumber = True,PartNumber.Format =7AN with -,PartNumber.Textbox = Valid PartNumbervalue,PartNumber.PencilIcon.isDisplayed =True, Save.Clicked = True" in EditPartNumber Popup
    Then "Part Number Set Successfully" displayed in Device Information section in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive4 @CATMake
  Scenario Outline: Cancelling Scanning valid PartNumber for PL161 for CATMake in Chrome and IE
    When "PartNumber PencilIcon.isEnabled = True,PencilIcon.clicked = True" in MyWorklist Page
    And "CommercialType =<CommercialType>,Scan PartNumber = True,PartNumber.Format =7AN with -,PartNumber.Textbox = Valid PartNumbervalue,PartNumber.PencilIcon.isDisplayed =True, Cancel.Clicked = True" in EditPartNumber Popup
    Then Edit PartNumber pop up should be closed

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative5 @CATMake
  Scenario Outline: validate PartNumber Scanning CharacterLimit for PL161 for CATMake in Chrome and IE
    When "PartNumber PencilIcon.isEnabled = True,PencilIcon.clicked = True" in MyWorklist Page
    And "CommercialType =<CommercialType>,Scan PartNumber = True,PartNumber.Format =6AN with - or 8AN with -,PartNumber.PencilIcon.isDisplayed =True, Save.Clicked = True" in EditPartNumber Popup
    Then Error Msg "Please Enter Valid PartNumber" should be displayed

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative6 @CATMake
  Scenario Outline: Set or Edit PartNumber Scanning with SpecialCharacters for PL161 for CATMake in Chrome and IE
    When "PartNumber PencilIcon.isEnabled = True,PencilIcon.clicked = True" in MyWorklist Page
    And "CommercialType =<CommercialType>,Scan PartNumber = True,PartNumber.Format =PartNumber with SpecialCharacters,PartNumber.PencilIcon.isDisplayed =True, Save.Clicked = True" in EditPartNumber Popup
    Then Error Msg "Please Enter Valid PartNumber" should be displayed

    Examples: 
      | CommercialType |
      | PL161          |
