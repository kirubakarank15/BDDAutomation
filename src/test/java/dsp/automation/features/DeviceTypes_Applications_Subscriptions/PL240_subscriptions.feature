Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL240.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer Level Subscription| CatLevel Subscription |
      | PL240       | NULL | VISION LINK       | Cat Basic - Hourly          |        |     |
      | PL240       | NULL | VISION LINK       | Cat Basic - 10 Minutes      |        |     |
      | PL240       | NULL | MY.CAT.COM        | Cat Daily                   |        |     |
      | PL240       | NULL | EQUIPMENT TRACKER | Cat Daily                   |        |     |
