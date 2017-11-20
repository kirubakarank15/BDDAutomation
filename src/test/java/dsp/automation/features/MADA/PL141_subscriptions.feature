Feature: To check the subscription catlog is displayed correctly for PL141
@PL141
  @catlogin
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00118" in My Worklist Page

  @catlogin @PL141
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL141 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                   | Dealer                                     | Cat                                        |
      | PL141       | UIT00118 | PRODUCT LINK WEB  | Cat Locator - 6 Hours, Cat Locator - Daily | Cat Locator - 6 Hours, Cat Locator - Daily | Cat Locator - 6 Hours, Cat Locator - Daily |
      | PL141       | UIT00118 | VISION LINK       | Cat Locator - 6 Hours, Cat Locator - Daily |                                            |                                            |
      | PL141       | UIT00118 | MY.CAT.COM        | Cat Daily                                  |                                            |                                            |
      | PL141       | UIT00118 | EQUIPMENT TRACKER | Cat Daily                                  |                                            |                                            |

  ##NO Add on
  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL141 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                   | Dealer                                     | Cat                                        |
      | PL141       | UIT00118 | PRODUCT LINK WEB  | Cat Locator - 6 Hours, Cat Locator - Daily | Cat Locator - 6 Hours, Cat Locator - Daily | Cat Locator - 6 Hours, Cat Locator - Daily |
      | PL141       | UIT00118 | VISION LINK       | Cat Locator - 6 Hours, Cat Locator - Daily |                                            |                                            |
      | PL141       | UIT00118 | MY.CAT.COM        | Cat Daily                                  |                                            |                                            |
      | PL141       | UIT00118 | EQUIPMENT TRACKER | Cat Daily                                  |                                            |                                            |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL141 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                   | Dealer                                     | Cat                                        |
      | PL141       | UIT00118 | PRODUCT LINK WEB  | Cat Locator - 6 Hours, Cat Locator - Daily | Cat Locator - 6 Hours, Cat Locator - Daily | Cat Locator - 6 Hours, Cat Locator - Daily |
      | PL141       | UIT00118 | VISION LINK       | Cat Locator - 6 Hours, Cat Locator - Daily |                                            |                                            |
      | PL141       | UIT00118 | MY.CAT.COM        | Cat Daily                                  |                                            |                                            |
      | PL141       | UIT00118 | EQUIPMENT TRACKER | Cat Daily                                  |                                            |                                            |
