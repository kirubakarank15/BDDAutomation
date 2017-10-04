Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE640.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services                | Customer Level Subscription                                                                   | Dealer Level Subscription                                      | Cat  Level Subscription                                        |
      | PLE642      | NULL | PRODUCT LINK WEB        | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite,ECA Over Site                  | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite | ECA Batch Data Service (E C24 ECA),ECA Data Collector,SC2 Lite |
      | PLE642      | NULL | VISION LINK             | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                                                                |                                                                |
      | PLE642      | NULL | MY.CAT.COM              | Cat Daily                                                                                     |                                                                |                                                                |
      | PLE642      | NULL | EQUIPMENT TRACKER       | Cat Daily                                                                                     |                                                                |                                                                |
      | PLE642      | NULL | PRODUCT LINK GENERATION | Base,Comp,Custom                                                                              | Base,Comp,Custom                                               | Base,Comp,Custom                                               |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscriptiokiokon>,<Dealer Level Subscription>,<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                                  |
      | PLE642      | NULL | VISION LINK | Cat Basic - Hourly          |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE642      | NULL | VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE642      | NULL | VISION LINK | Cat Essentials - Hourly     |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE642      | NULL | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
