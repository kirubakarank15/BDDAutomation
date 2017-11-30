Feature: To check the subscription catlog is displayed correctly for PL631

  @catlogin @PL631  @catlogSync_Part3
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00124" in My Worklist Page

  @catlogin @PL63 @catlogSync_Part3
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                     | Dealer                      | Cat                         |
      | PL631       | UIT00124 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |
      | PL631       | UIT00124 | VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                             |                             |
      | PL631       | UIT00124 | MY.CAT.COM        | Cat Daily                                    |                             |                             |
      | PL631       | UIT00124 | EQUIPMENT TRACKER | Cat Daily                                    |                             |                             |
 @catlogin @PL6311 @catlogSync_Part3
  Scenario Outline: To chek whether the Add-Ons are displayed properly for PL631 subscriptions
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer                 | Dealer | Cat | Additional Services                          |
      | PL631       | UIT00124 | VISION LINK | Cat Essentials - 4 Hours |        |     | VisionLink Load and Cycle Project Monitoring |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                  | Dealer Level Subscription   | Cat Level Subscription |
      | PL631       | UIT00124 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  | Vitals (ES1-0),Aide (ES4-0) |                        |
      | PL631       | UIT00124 | VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                             |                        |
      | PL631       | UIT00124 | MY.CAT.COM        | Cat Daily                                    |                             |                        |
      | PL631       | UIT00124 | EQUIPMENT TRACKER | Cat Daily                                    |                             |                        |

  Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631       | UIT00124 | VISION LINK | Cat Essentials - 4 Hours    |                           |                        | VisionLink Load and Cycle Project Monitoring |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                  | Dealer Level Subscription | Cat Level Subscription |
      | PL631       | UIT00124 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  |                           |                        |
      | PL631       | UIT00124 | VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                           |                        |
      | PL631       | UIT00124 | MY.CAT.COM        | Cat Daily                                    |                           |                        |
      | PL631       | UIT00124 | EQUIPMENT TRACKER | Cat Daily                                    |                           |                        |

  Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631       | UIT00124 | VISION LINK | Cat Essentials - 4 Hours    |                           |                        | VisionLink Load and Cycle Project Monitoring |
