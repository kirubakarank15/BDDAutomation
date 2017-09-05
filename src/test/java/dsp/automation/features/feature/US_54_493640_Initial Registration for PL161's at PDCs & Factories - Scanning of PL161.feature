@US_54_493640 @UIAutomation
Feature: Scan and register Commercial type PL161

  @Positive1
  Scenario Outline: Login as Factory User to Scan commercial type PL161
    Given Login to DSP as Factory user in "<Browser>"
    And MY WORKLIST Page should be displayed
    And Search Textbox with By Equipment S/N / Engine S/N / Device S/N /Radio S/N Text should be displayed
    And Search button should be displayed
    When I Scan the Commercial type "<CommercialType>" connected with Desktop
    And I Click on Search button with the AssetSerialNumber
    Then Asset SerialNumber 10 digit of the CommercialType should be displayed in the Worklist Textbox
    And Asset Details should be displayed for the Scanned Asset

    Examples: 
      | Browser | CommercialType |
      | IE      | PL161          |
      | Chrome  | PL161          |

  @Positive2
  Scenario: Edit the Product id of commercial type PL161 with No active Subscriptions for the Asset
    Given Factory User is in the Asset Detail page in DSP
    When I Click on Pencil icon of Equipment S/N of the scanned device
    Then Edit Serial Number pop up should be displayed to Enter or Edit the New Serial Number of the Scanned Device
    But Factory user should not be able to set the subscription

  @Positive3
  Scenario: Edit the Product id of commercial type PL161 with active Subscriptions for the Asset
    Given Factory User is in the Asset Detail page in DSP
    When I Click on Pencil icon of Equipment S/N of the scanned device
    Then Error Popup message should be displayed to Cancel the Existing Subcriptions

  @Negative1
  Scenario: Login and Scan 11 digit AssetSerialNumber of PL161
  Given AssetSerialNumber barcode should be Available
  When I Scan the 11 digit AssetSerialNumber from the Barcode
  And click on the Search button
  Then Asset SerialNumber of 11 digit should be displayed in the SearchTextbox
  And Error msg should be displayed for Incorrect length of AssetSerialaNumber
