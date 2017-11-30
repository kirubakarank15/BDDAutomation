Feature: To check the subscription catlog is displayed correctly for PL542

  @catlogin @catlogSync_Part3
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00123" in My Worklist Page

  @catlogin @PL542 @catlogSync_Part3
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL542 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                                                                      | Dealer | Cat |
      | PL542       | UIT00123 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |        |     |
      | PL542       | UIT00123 | MY.CAT.COM        | Cat Daily                                                                                     |        |     |
      | PL542       | UIT00123 | EQUIPMENT TRACKER | Cat Daily                                                                                     |        |     |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL542 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat Level Subscription |
      | PL542       | UIT00123 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                        |
      | PL542       | UIT00123 | MY.CAT.COM        | Cat Daily                                                                                     |                           |                        |
      | PL542       | UIT00123 | EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                        |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL542 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat Level Subscription |
      | PL542       | UIT00123 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                        |
      | PL542       | UIT00123 | MY.CAT.COM        | Cat Daily                                                                                     |                           |                        |
      | PL542       | UIT00123 | EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                        |
