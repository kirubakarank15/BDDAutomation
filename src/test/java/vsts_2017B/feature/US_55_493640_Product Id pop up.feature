@2017B @US_55 @US_493640 @ScanningofPL161
Feature: Change or Edit Product Id Change popup for PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2 @CATMake @NonCATMake @PL161
  Scenario: Verify UI of Edit Serial Number popup in My Worklist Page in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True,Make ='CW1 - CAT WORK TOOLS (SERIALIZED)',Existing SerialNumber.Radiobutton =Checked,New SerialNumber radiobutton =Unchecked,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device" in Edit Serial Number pop up
    When clicked New SerialNumber radiobutton in Edit Serial Number pop up
    Then "SerialNumber.Textbox = Empty,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number "in Edit Serial Number pop up

  @FactoryUserProfile @Sprint5 @FunctionalPositive3 @CATMake @PL161
  Scenario Outline: Scanning Valid Productid for CATMake,PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,Save Button.Clicked =True" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive4 @CATMake @PL161
  Scenario Outline: Cancel Scanning of Valid Productid for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,Make ='CW1 - CAT WORK TOOLS (SERIALIZED)',Cancel Button.Clicked =True" in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive5 @CATMake @NonPL161
  Scenario Outline: Scanning Valid Productid for CATMake other than PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,Make = CAT,Save Button.Clicked =True" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive6 @CATMake @NonPL161
  Scenario Outline: Cancel Scanning of Valid Productid for CATMake other than PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,Make = CAT,Cancel Button.Clicked =True" in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative7 @CATMake @PL161
  Scenario Outline: Set Make as CAT for CATMake for PL161 for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,Make = CAT,Save Button.Clicked =True" in Edit Serial Number pop up
    Then Error msg should be displayed in Edit Serial Number pop up

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalNegative8 @CATMake @PL161
  Scenario Outline: Scan Invalid Productid with SpecialCharacters for CATMake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,Make ='CW1 - CAT WORK TOOLS (SERIALIZED)',Save Button.Clicked =True" in Edit Serial Number pop up
    Then Error msg should be displayed in Edit Serial Number pop up

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive9 @NonCATMake @PL161
  Scenario Outline: Validate ProductId characterLimit for NonCATmake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,New SerialNumber.Format=17AN,Make =CAT,Save Button.Clicked =True" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive10 @NonCATMake @PL161
  Scenario Outline: Validate ProductId with space and Hyphen for NonCATmake for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click in UI "Equipment S/N Pencil icon.isEnabled =True" in MyWorklist Page
    Then "Edit Serial Number pop up.isDisplayed = True" in MyWorklist Page
    When "CommercialType =<CommercialType>,Scan New SerialNumber = True,New SerialNumber.Textbox = <New SerialNumber>,New SerialNumber.Format=space & hyphen in between SerialNumber ,Make =CAT,Save Button.Clicked =True" in Edit Serial Number pop up
    But "New SerialNumber.Format=space & hyphen not Prefixed or Suffixed" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page

    Examples: 
      | New SerialNumber | CommercialType |
      | RAM000103        | PL161          |
