Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL131.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer            | Cat               |
      | PL131       | NULL | PRODUCT LINK WEB  | Locator,Manual PM           | Locator,Manual PM | Locator,Manual PM |
      | PL131       | NULL | VISION_LINK       | Cat Locator - 6 Hours       |                   |                   |
      | PL131       | NULL | MY.CAT.COM        | Cat Daily                   |                   |                   |
      | PL131       | NULL | EQUIPMENT_TRACKER | Cat Daily                   |                   |                   |
