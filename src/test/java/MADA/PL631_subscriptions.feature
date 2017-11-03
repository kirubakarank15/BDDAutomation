Feature: To check the subscription catlog is displayed correctly for PL631
  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  @catlogin @PL631
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                  | Dealer Level Subscription   | Cat Level Subscription      |
      | PL631    |UIT00124|PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |
      | PL631    |UIT00124|VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                             |                             |
      | PL631    |UIT00124|MY.CAT.COM        | Cat Daily                                    |                             |                             |
      | PL631    |UIT00124|EQUIPMENT TRACKER | Cat Daily                                    |                             |                             |

  Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631    |UIT00124|VISION LINK | Cat Essentials - 4 Hours    |                           |                        | VisionLink Load and Cycle Project Monitoring |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                  | Dealer Level Subscription   | Cat Level Subscription |
      | PL631    |UIT00124|PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  | Vitals (ES1-0),Aide (ES4-0) |                        |
      | PL631    |UIT00124|VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                             |                        |
      | PL631    |UIT00124|MY.CAT.COM        | Cat Daily                                    |                             |                        |
      | PL631    |UIT00124|EQUIPMENT TRACKER | Cat Daily                                    |                             |                        |


Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631    |UIT00124|VISION LINK | Cat Essentials - 4 Hours    |                           |                        | VisionLink Load and Cycle Project Monitoring |
 
 
  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                  | Dealer Level Subscription | Cat Level Subscription |
      | PL631    |UIT00124|PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  |                           |                        |
      | PL631    |UIT00124|VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                           |                        |
      | PL631    |UIT00124|MY.CAT.COM        | Cat Daily                                    |                           |                        |
      | PL631    |UIT00124|EQUIPMENT TRACKER | Cat Daily                                    |                           |                        |

      
      Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631    |UIT00124|VISION LINK | Cat Essentials - 4 Hours    |                           |                        | VisionLink Load and Cycle Project Monitoring |