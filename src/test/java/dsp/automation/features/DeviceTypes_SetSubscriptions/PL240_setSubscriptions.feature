Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether the user is able to set the subscriptions for the deivce type PL240 with all the combinations
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Device Type>","<S/N >","<Services>","<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<Device Type>","<S/N >","<Services>","<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>" in My Worklist page

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      | PL240       | NULL | VISION LINK       | Cat Basic - Hourly          |                           |                        |
      | PL240       | NULL | VISION LINK       | Cat Basic - 10 Minutes      |                           |                        |
      | PL240       | NULL | MY.CAT.COM        | Cat Daily                   |                           |                        |
      | PL240       | NULL | EQUIPMENT TRACKER | Cat Daily                   |                           |                        |