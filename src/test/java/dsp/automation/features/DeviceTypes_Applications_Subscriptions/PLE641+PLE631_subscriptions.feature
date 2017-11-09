Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE640.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services                    | Customer Level Subscription                                                                                                                                                                | Dealer Level Subscription                                                                                                                                                                  | Cat Level Subscription                                                                                                                                                                     |
      | PLE641      | NULL | PRODUCT LINK WEB            | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) |
      | PLE641      | NULL | PRODUCT LINK WEB            | ECA Data Collector                                                                                                                                                                         | ECA Data Collector                                                                                                                                                                         | ECA Data Collector                                                                                                                                                                         |
      | PLE641      | NULL | VISION LINK                 | Cat Essentials - Dual Mode                                                                                                                                                                 |                                                                                                                                                                                            |                                                                                                                                                                                            |
      | PLE641      | NULL | MY.CAT.COM                  | Cat Daily                                                                                                                                                                                  |                                                                                                                                                                                            |                                                                                                                                                                                            |
      | PLE641      | NULL | EQUIPMENT TRACKER           | Cat Daily                                                                                                                                                                                  |                                                                                                                                                                                            |                                                                                                                                                                                            |
      | PLE641      | NULL | PRODUCT LINK GENERATION | Base,Comp,Custom                                                                                                                                                                           | Base,Comp,Custom                                                                                                                                                                           | Base,Comp,Custom                                                                                                                                                                           |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>,<Dealer Level Subscription>,<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services         | Customer Level Subscription | Dealer Level Subscription  | Cat Level Subscription     | Additional Services                                                                                            |
      | PLE641      | NULL | PRODUCT LINK WEB | Vitals (EC1-4 & S1-0)       | Vitals (EC1-4 & S1-0)      | Vitals (EC1-4 & S1-0)      | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Vitals (EC1-4 & S0-0)       | Vitals (EC1-4 & S0-0)      | Vitals (EC1-4 & S0-0)      | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Aide (EC4-14 & S4-0)        | Aide (EC4-14 & S4-0)       | Aide (EC4-14 & S4-0)       | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Aide (EC4-14 & S0-0)        | Aide (EC4-14 & S0-0)       | Aide (EC4-14 & S0-0)       | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Aide (EC4-14-T & S0-0)      | Aide (EC4-14-T & S0-0)     | Aide (EC4-14-T & S0-0)     | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-54 & S24-0)   | Advisor (EC24-54 & S24-0)  | Advisor (EC24-54 & S24-0)  | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-54 & S0-0)    | Advisor (EC24-54 & S0-0)   | Advisor (EC24-54 & S0-0)   | Onboard Analytics                                                                                              |
      | PLE641      | NULL | PRODUCT LINK WEB | Advisor (EC24-54-T & S0-0)  | Advisor (EC24-54-T & S0-0) | Advisor (EC24-54-T & S0-0) | Onboard Analytics                                                                                              |
      | PLE641      | NULL | VISION LINK      | Cat Essentials - Dual Mode  |                            |                            | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics,Satellite Radio Suspended |
      | PLE641      | NULL | VISION LINK      | Cat Basic - 10 Minutes      |                            |                            | Advanced Productivity,Onboard Analytics                                                                        |
      | PLE641      | NULL | VISION LINK      | Cat Essentials - Hourly     |                            |                            | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics                           |
      | PLE641      | NULL | VISION LINK      | Cat Essentials - 10 Minutes |                            |                            | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics                           |
