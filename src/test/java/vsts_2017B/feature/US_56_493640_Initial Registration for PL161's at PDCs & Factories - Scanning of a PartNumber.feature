@2017B @US_56 @US_493640 @ScanningofpartnumberPL161
Feature: Scan PartNumber Commercial type PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario Outline: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"

    Examples: 
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2
  Scenario Outline: Scan valid PartNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    And verify UI "Search Text Box=By Equipment S/N / Engine S/N / Device S/N /Radio S/N,Tool tip=Enter minimum of 3 characters,Search Button=Enabled" in MyWorklist Page
    And verify UI "PartNumber.PencilIcon =IsEnabled,PencilIcon = clicked" in MyWorklist Page
    Then verify UI, "EditPartNumer popup = Displayed,PartNumber.Texbox = Empty" in EditPartNumber Popup
    When scanned PartNumber "PartNumber.Format =7AN with -" in EditPartNumber Popup
    Then "PartNumber.Textbox = PartNumber value, PartNumber.Format =7AN,Save = Clicked,PartNumber.Field=PartNumber value,PartNumber.PencilIcon = Displayed"in Device Information section in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive3
  Scenario Outline: Cancel or Close Scanning valid PartNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    And verify UI "Search Text Box=By Equipment S/N / Engine S/N / Device S/N /Radio S/N,Tool tip=Enter minimum of 3 characters,Search Button=Enabled" in MyWorklist Page
    And verify UI "PartNumber.PencilIcon =IsEnabled,PencilIcon = clicked" in MyWorklist Page
    Then verify UI, "EditPartNumer popup = Displayed,PartNumber.Texbox = Empty" in EditPartNumber Popup
    When scanned PartNumber "PartNumber.Format =7AN with -" in EditPartNumber Popup
    Then "PartNumber.Textbox = PartNumber value,Cancel = Clicked,PartNumber.Field=Empty,PartNumber.PencilIcon = Displayed"in Device Information section in MyWorklist Page

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative4
  Scenario Outline: Scan invalid PartNumber for commercial type PL161 with CAT Make in Chrome and IE
    When Navigate to "My worklist"
    And verify UI "Search Text Box=By Equipment S/N / Engine S/N / Device S/N /Radio S/N,Tool tip=Enter minimum of 3 characters,Search Button=Enabled" in MyWorklist Page
    And verify UI "PartNumber.PencilIcon =IsEnabled,PencilIcon = clicked" in MyWorklist Page
    Then verify UI, "EditPartNumer popup = Displayed,PartNumber.Texbox = Empty" in EditPartNumber Popup
    When scanned PartNumber "PartNumber.Format =8AN" in EditPartNumber Popup
    Then Error Msg "Please Enter Valid PartNumber" should be displayed

    Examples: 
      | CommercialType |
      | PL161          |
