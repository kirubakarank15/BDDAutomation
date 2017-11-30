Feature: To check the subscription catlog is displayed correctly for PL240

  @catlogin @catlogSync_Part2
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00120" in My Worklist Page

  @catlogin @PL240 @catlogSync_Part2
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL240 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                   | Dealer | Cat |
      | PL240       | UIT00120 | VISION LINK       | Cat Basic - Hourly, Cat Basic - 10 Minutes |        |     |
      | PL240       | UIT00120 | MY.CAT.COM        | Cat Daily                                  |        |     |
      | PL240       | UIT00120 | EQUIPMENT TRACKER | Cat Daily                                  |        |     |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL240 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                   | Dealer | Cat |
      | PL240       | UIT00120 | VISION LINK       | Cat Basic - Hourly, Cat Basic - 10 Minutes |        |     |
      | PL240       | UIT00120 | MY.CAT.COM        | Cat Daily                                  |        |     |
      | PL240       | UIT00120 | EQUIPMENT TRACKER | Cat Daily                                  |        |     |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL240 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                   | Dealer | Cat |
      | PL240       | UIT00120 | VISION LINK       | Cat Basic - Hourly, Cat Basic - 10 Minutes |        |     |
      | PL240       | UIT00120 | MY.CAT.COM        | Cat Daily                                  |        |     |
      | PL240       | UIT00120 | EQUIPMENT TRACKER | Cat Daily                                  |        |     |
