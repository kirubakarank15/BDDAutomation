Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE640.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services                    | Customer Level Subscription                                                                                              | Dealer Level Subscription                                                                                                | Cat Level Subscription                                                                                                   |
      | PLE641      | NULL | PRODUCT LINK WEB            | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) |
      | PLE641      | NULL | PRODUCT LINK WEB            | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite                                                           | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite                                                           | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite                                                           |
      | PLE641      | NULL | VISION LINK                 | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes                            |                                                                                                                          |                                                                                                                          |
      | PLE641      | NULL | MY.CAT.COM                  | Cat Daily                                                                                                                |                                                                                                                          |                                                                                                                          |
      | PLE641      | NULL | EQUIPMENT TRACKER           | Cat Daily                                                                                                                |                                                                                                                          |                                                                                                                          |
      | PLE641      | NULL | PRODUCT LINK GENERATION | Base,Comp,Custom                                                                                                         | Base,Comp,Custom                                                                                                         | Base,Comp,Custom                                                                                                         |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>,<Dealer Level Subscription>,<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services         | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                                  |
      | PLE641      | NULL | PRODUCT LINK WEB | Vitals (EC1-4)              | Vitals (EC1-4)            | Vitals (EC1-4)         | Onboard Analytics                                                                    |
      | PLE641      | NULL | PRODUCT LINK WEB | Aide (EC4-14)               | Aide (EC4-14)             | Aide (EC4-14)          | Onboard Analytics                                                                    |
      | PLE641      | NULL | PRODUCT LINK WEB | Aide (EC4-14-T )            | Aide (EC4-14-T )          | Aide (EC4-14-T )       | Onboard Analytics                                                                    |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-54 )          | Advisor (EC24-54 )        | Advisor (EC24-54 )     | Onboard Analytics                                                                    |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-104)          | Advisor (EC24-104)        | Advisor (EC24-104)     | Onboard Analytics                                                                    |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-204)          | Advisor (EC24-204)        | Advisor (EC24-204)     | Onboard Analytics                                                                    |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-54-T)         | Advisor (EC24-54-T)       | Advisor (EC24-54-T)    | Onboard Analytics                                                                    |
      | PLE641      | NULL | VISION LINK      | Cat Basic - Hourly          |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE641      | NULL | VISION LINK      | Cat Basic - 10 Minutes      |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE641      | NULL | VISION LINK      | Cat Essentials - Hourly     |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE641      | NULL | VISION LINK      | Cat Essentials - 10 Minutes |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
