Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE640.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                                                                              | Dealer Level Subscription                                                                                                | Cat Level Subscription                                                                                                   |
      | PLE640      | NULL | PRODUCT LINK WEB  | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) |
      | PLE640      | NULL | PRODUCT LINK WEB  | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite                                                           | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite                                                           | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite                                                           |
      | PLE640      | NULL | MY.CAT.COM        | Cat Daily                                                                                                                |                                                                                                                          |                                                                                                                          |
      | PLE640      | NULL | EQUIPMENT TRACKER | Cat Daily                                                                                                                |                                                                                                                          |                                                                                                                          |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscriptiokiokon>,<Dealer Level Subscription>,<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services         | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services |
      | PLE640      | NULL | PRODUCT LINK WEB | Vitals (EC1-4)              | Vitals (EC1-4)            | Vitals (EC1-4)         | Onboard Analytics   |
      | PLE640      | NULL | PRODUCT LINK WEB | Aide (EC4-14)               | Aide (EC4-14))            | Aide (EC4-14)          | Onboard Analytics   |
      | PLE640      | NULL | PRODUCT LINK WEB | Aide (EC4-14-T              | Aide (EC4-14-T            | Aide (EC4-14-T         | Onboard Analytics   |
      | PLE640      | NULL | PRODUCT LINK WEB | Advisor (EC24-54            | Advisor (EC24-54          | Advisor (EC24-54       | Onboard Analytics   |
      | PLE640      | NULL | PRODUCT LINK WEB | Advisor (EC24-104)          | Advisor (EC24-104)        | Advisor (EC24-104)     | Onboard Analytics   |
      | PLE640      | NULL | PRODUCT LINK WEB | Advisor (EC24-204)          | Advisor (EC24-204)        | Advisor (EC24-204)     | Onboard Analytics   |
      | PLE640      | NULL | PRODUCT LINK WEB | Advisor (EC24-54-T)         | Advisor (EC24-54-T)       | Advisor (EC24-54-T)    | Onboard Analytics   |
