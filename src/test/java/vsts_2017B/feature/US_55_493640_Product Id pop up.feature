@2017B @US_55 @US_493640 @ProductIdpopupPL161
Feature: Change or Edit Product Id Change popup for PL161

  @FactoryUserProfile @Positive @US_55 @TC_ @PL161
  Scenario: Verify UI of Edit Serial Number popup for PL161 in My Worklist Page in Chrome and IE
    When Navigate to "My worklist"
    And Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    Then Edit Serial Number pop up should be displayed in MyWorklist Page
    And Make should be 'CW1 - CAT WORK TOOLS (SERIALIZED)' in Edit Serial Number pop up
    And Existing SerialNumber Radiobutton should be Checked in Edit Serial Number pop up
    And New SerialNumber Radiobutton should be Unchecked in Edit Serial Number pop up
    And Edit Serial Number dialog text msg  "Click Save to link the selected Serial number to this device" should be displayed in Edit Serial Number pop up

  @FactoryUserProfile @Positive @US_55 @TC_ @NonPL161
  Scenario: Verify UI of Edit Serial Number popup for NonPL161 in My Worklist Page in Chrome and IE
    When Navigate to "My worklist"
    And Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    Then Edit Serial Number pop up should be displayed in MyWorklist Page
    And Make should be CAT in Edit Serial Number pop up
    And Existing SerialNumber Radiobutton should be Checked in Edit Serial Number pop up
    And New SerialNumber Radiobutton should be Unchecked in Edit Serial Number pop up
    And Edit Serial Number dialog text msg  "Click Save to link the selected Serial number to this device" should be displayed in Edit Serial Number pop up

  @FactoryUserProfile @Positive @US_55 @TC_ @PL161
  Scenario: Verify UI of Productid popup in My Worklist Page in Chrome and IE
    When clicked New SerialNumber radiobutton in Edit Serial Number pop up
    Then SerialNumber Textbox should be Empty in Edit Serial Number pop up
    And SerialNumber Textbox Msg should be "Please select a valid Serial Number or Enter a new Serial Number " in Edit Serial Number pop up

  @FactoryUserProfile @Positive @US_55 @TC_ @PL161
  Scenario Outline: Scan Valid Productid for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And verify Make 'CW1 - CAT WORK TOOLS (SERIALIZED)'is displayed in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then ProductId should be displayed New SerialNumber Textbox in Edit Serial Number pop up
    And "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | ProductId | CommercialType |
      | RAM000123 | PL161          |
      | MAD000125 | PL161          |

  @FactoryUserProfile @Positive @US_55 @TC_ @PL161
  Scenario Outline: Cancel Scanning of Valid Productid  PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new  <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And verify Make 'CW1 - CAT WORK TOOLS (SERIALIZED)' is displayed in Edit Serial Number pop up
    And click Cancel button in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

    Examples: 
      | ProductId | CommercialType |
      | RAM000123 | PL161          |
      | MAD000125 | PL161          |

  @FactoryUserProfile @Positive @US_55 @TC_ @NonPL161
  Scenario Outline: Scanning Valid Productid for NonPL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And verify Make CAT is displayed in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then ProductId should be displayed New SerialNumber Textbox in Edit Serial Number pop up
    And "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page
    But Factory user should not be able to set the subscription

    Examples: 
      | ProductId | CommercialType |
      | RAM000123 | PL161          |
      | MAD000125 | PL161          |

  @FactoryUserProfile @Positive @US_55 @TC_ @NonPL161
  Scenario Outline: Cancel Scanning of Valid Productid for Nonn PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And verify Make CAT is displayed in Edit Serial Number pop up
    And click Cancel button in Edit Serial Number pop up
    Then Edit Serial Number pop up should be closed

    Examples: 
      | ProductId | CommercialType |
      | RAM000123 | PL161          |
      | MAD000125 | PL161          |

  @FactoryUserProfile @Negative @US_55 @TC_ @PL161
  Scenario Outline: Set Make as CAT for PL161 for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And Set Make as CAT in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then ProductId should be displayed New SerialNumber Textbox in Edit Serial Number pop up
    And Error msg should be displayed in Edit Serial Number pop up

    Examples: 
      | ProductId | CommercialType |
      | RAM000103 | PL161          |

  @FactoryUserProfile @Negative @US_55 @TC_ @PL161
  Scenario Outline: Scan Invalid Productid with SpecialCharacters for PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And verify Make 'CW1 - CAT WORK TOOLS (SERIALIZED)' is displayed in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then ProductId should be displayed New SerialNumber Textbox in Edit Serial Number pop up
    And Error msg should be displayed in Edit Serial Number pop up

    Examples: 
      | ProductId | CommercialType |
      | RAM&0103  | PL161          |

  @FactoryUserProfile @Positive @US_55 @TC_ @PL161 @CATMake
  Scenario Outline: Validate ProductId Format for CATMake PL161 with No active Subscriptions for the Asset in Chrome and IE
    When Click on Equipment S/N Pencil icon displayed in MyWorklist Page
    And Scan new <ProductId> for <CommercialType> in MyWorklist Page in Edit Serial Number pop up
    And verify new Productid Format is 17AN is displayed in Edit Serial Number pop up
    And click Save button in Edit Serial Number pop up
    Then ProductId should be displayed New SerialNumber Textbox in Edit Serial Number pop up
    And "Product ID Set Successfully" msg should be displayed Device section in MyWorklist Page

    Examples: 
      | ProductId        | CommercialType |
      | RAM0001045454563 | PL161          |
      | RAM 000-333000   | PL161          |
