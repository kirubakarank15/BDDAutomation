Feature: To check the subscription catlog is displayed correctly for PLG641
  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  @catlogin @PLG641
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLG641 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services                | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      | PLG641      |UIT00133| PRODUCT LINK GENERATION | Comp,Base                   |                           |                        |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLG641 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services                | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      | PLG641      |UIT00133| PRODUCT LINK GENERATION | Comp,Base                   |                           |                        |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLG641 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services                | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      | PLG641      |UIT00133| PRODUCT LINK GENERATION | Comp,Base                   |                           |                        |
