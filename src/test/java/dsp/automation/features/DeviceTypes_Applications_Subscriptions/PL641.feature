Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL641.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                                                                           | Dealer Level Subscription                    | Cat   Level Subscription                     |
      | PL641       | NULL | PRODUCT LINK WEB  | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T)                                                                          | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T) |
      | PL641       | NULL | VISION_LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                                              |                                              |
      | PL641       | NULL | MY.CAT.COM        | Cat Daily                                                                                                             |                                              |                                              |
      | PL641       | NULL | EQUIPMENT_TRACKER | Cat Daily                                                                                                             |                                              |                                              |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>,<Dealer Level Subscription>,<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL641       | NULL | VISION_LINK | Cat Basic - Hourly          |                           |                        | VisionLink Load and Cycle Project Monitoring |
      | PL641       | NULL | VISION_LINK | Cat Basic - 10 Minutes      |                           |                        | VisionLink Load and Cycle Project Monitoring |
