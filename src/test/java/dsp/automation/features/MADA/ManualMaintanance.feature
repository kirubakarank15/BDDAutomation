Feature: To check the subscription catlog is displayed correctly for Manual Maintenance

  @catlogin @catlogSync_Part1
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00136" with make code "CAT" in My Worklist Page

  @catlogin @catlogSync_Part1
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL131 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services         | Customer                 | Dealer                   | Cat                      |
      | PL131       | UIT00136 | PRODUCT LINK WEB | Manual PM,Vitals (EAN-0) | Manual PM,Vitals (EAN-0) | Manual PM,Vitals (EAN-0) |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL131 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services         | Customer                 | Dealer                   | Cat |
      | PL131       | UIT00136 | PRODUCT LINK WEB | Manual PM,Vitals (EAN-0) | Manual PM,Vitals (EAN-0) |     |

  @catlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL131 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services         | Customer                 | Dealer                   | Cat |
      | PL131       | UIT00136 | PRODUCT LINK WEB | Manual PM,Vitals (EAN-0) | Manual PM,Vitals (EAN-0) |     |
