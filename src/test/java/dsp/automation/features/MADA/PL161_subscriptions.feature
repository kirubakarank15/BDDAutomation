Feature: To check the subscription catlog is displayed correctly for PL161

  @catlogin
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00119" in My Worklist Page

  @catlogin @PL161
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL161 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                            | Dealer | Cat |
      | PL161       | UIT00119 | VISION LINK       | Cat Locator (Prepaid With Hardware) |        |     |
     # | PL161       | UIT00119 | MY.CAT.COM        | Cat Daily                           |        |     |
      | PL161       | UIT00119 | EQUIPMENT TRACKER | Cat Daily                           |        |     |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL161 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                            | Dealer | Cat |
      | PL161       | UIT00119 | VISION LINK       | Cat Locator (Prepaid With Hardware) |        |     |
      | PL161       | UIT00119 | MY.CAT.COM        | Cat Daily                           |        |     |
      | PL161       | UIT00119 | EQUIPMENT TRACKER | Cat Daily                           |        |     |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL161 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                            | Dealer | Cat |
      | PL161       | UIT00119 | VISION LINK       | Cat Locator (Prepaid With Hardware) |        |     |
      | PL161       | UIT00119 | MY.CAT.COM        | Cat Daily                           |        |     |
      | PL161       | UIT00119 | EQUIPMENT TRACKER | Cat Daily                           |        |     |
