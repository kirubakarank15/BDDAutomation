Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE742.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                                                   | Dealer | Cat |
      | PLE742      | NULL | VISION_LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |        |     |
      | PLE742      | NULL | MY.CAT.COM        | Cat Daily                                                                                     |        |     |
      | PLE742      | NULL | EQUIPMENT_TRACKER | Cat Daily                                                                                     |        |     |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscriptiokiokon>,<Dealer Level Subscription>,<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer | Cat | Additional Services                                                                  |
      | PLE742      | NULL | VISION_LINK | Cat Basic - Hourly          |        |     | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      | NULL | VISION_LINK | Cat Basic - 10 Minutes      |        |     | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      | NULL | VISION_LINK | Cat Essentials - Hourly     |        |     | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE742      | NULL | VISION_LINK | Cat Essentials - 10 Minutes |        |     | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
