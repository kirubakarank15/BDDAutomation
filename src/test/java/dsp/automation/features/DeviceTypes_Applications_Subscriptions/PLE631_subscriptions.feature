
Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                     | Dealer Level Subscription   | Cat Level Subscription      |
      | PL631       | AUT10002 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                                     | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |
      | PL631       | AUT10002 | VISION LINK       | Cat Basic - 4 Hours,Cat Basic - Hourly,Cat Essentials - 4 Hours |                             |                             |
      | PL631       | AUT10002 | MY.CAT.COM        | Cat Daily                                                       |                             |                             |
      | PL631       | AUT10002 | EQUIPMENT TRACKER | Cat Daily                                                       |                             |                             |

  Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631       | AUT10002 | VISION LINK | Cat Essentials - 4 Hours    |                           |                        | VisionLink Load and Cycle Project Monitoring |
