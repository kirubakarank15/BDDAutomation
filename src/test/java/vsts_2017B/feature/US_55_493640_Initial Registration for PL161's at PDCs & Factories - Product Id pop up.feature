@2017B @US_55 @US_493640 @ScanningofPL161
Feature: Change or Edit Product Id Change popup for PL161

  @FactoryUserProfile @Sprint5 @FunctionalPositive1
  Scenario Outline: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"

    Examples: 
      | Role            |
      | FactoryUserName |

  @FactoryUserProfile @Sprint5 @FunctionalPositive2 @CATMake @PL161
  Scenario Outline: Scan Valid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    When "CommercialType=<CommercialType>,New SerialNumber radiobutton= Clicked,scan new Product id =True,Make =CW1 - CAT WORK TOOLS (SERIALIZED),SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Save button =Clicked" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive3 @CATMake @PL161
  Scenario Outline: Cancel or Close the Scan of Valid Productid for CATMake of commercial type PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
     When "CommercialType=<CommercialType>,New SerialNumber radiobutton= Clicked,scan new Product id =True,Make =CW1 - CAT WORK TOOLS (SERIALIZED),SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Cancel button =Clicked" in Edit Serial Number pop up
        Then Edit Serial Number pop up should be closed

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive4 @CATMake @NonPL161
  Scenario Outline: Scan Valid Productid for CATMake of Commercial type except PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    When "CommercialType=<CommercialType>,New SerialNumber radiobutton= Clicked,scan new Product id =True,Make =CAT,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Save button =Clicked" in Edit Serial Number pop up
    Then "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | CommercialType |
      | PL161          |

  @FactoryUserProfile @Sprint5 @FunctionalPositive3 @CATMake @NonPL161
  Scenario Outline: Cancel or Close the Scan of Valid Productid for CATMake of commercial type except PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Navigate to "My worklist"
    And Click in UI "Pencil icon =Enabled" in MyWorklist Page
    Then "Edit Serial Number pop up = toDisplay" in MyWorklist Page
    When "CommercialType=<CommercialType>,New SerialNumber radiobutton= Clicked,scan new Product id =True,Make =CAT,SerialNumber Textbox Msg =Please select a valid Serial Number or Enter a new Serial Number,Edit Serial Number dialog msg =Click Save to link the selected Serial number to this device,Cancel button =Clicked" in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

    Examples: 
      | CommercialType |
      | PL161          |
