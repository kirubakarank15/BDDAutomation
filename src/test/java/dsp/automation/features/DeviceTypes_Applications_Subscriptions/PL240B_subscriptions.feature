Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL240B.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      | PL240B       | NULL | PRODUCT LINK WEB  | Locator,Manual PM           | Locator,Manual PM         | Locator,Manual PM      |
      | PL240B       | NULL | VISION LINK       | Cat Locator - 6 Hours       |                           |                        |
      | PL240B       | NULL | MY.CAT.COM        | Cat Daily                   |                           |                        |
      | PL240B       | NULL | EQUIPMENT TRACKER | Cat Daily                   |                           |                        |
