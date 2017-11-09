Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether the user is able to set the subscriptions for the deivce type PL240B with all the combinations
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Device Type>","<S/N >","<Services>","<Customer>","<Dealer>","<Cat>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<Device Type>","<S/N >","<Services>","<Customer>","<Dealer>","<Cat>" in My Worklist page

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      | PL240B      | NULL | PRODUCT LINK WEB  | Manual PM                   | Manual PM                 | Manual PM              |
      | PL240B      | NULL | PRODUCT LINK WEB  | Locator                     | Locator                   | Locator                |
      | PL240B      | NULL | VISION LINK       | Cat Locator - 6 Hours       |                           |                        |
      | PL240B      | NULL | MY.CAT.COM        | Cat Daily                   |                           |                        |
      | PL240B      | NULL | EQUIPMENT TRACKER | Cat Daily                   |                           |                        |
