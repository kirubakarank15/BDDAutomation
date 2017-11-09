Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether the user is able to set the subscriptions for the deivce type PL542 with all the combinations
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Device Type>","<S/N >","<Services>","<Customer>","<Dealer>","<Cat>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<Device Type>","<S/N >","<Services>","<Customer>","<Dealer>","<Cat><Additional Services>" in My Worklist page

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services |
      | PL542       | NULL | VISION LINK       | Cat Basic - Hourly          |                           |                        |                     |
      | PL542       | NULL | VISION LINK       | Cat Basic - 10 Minutes      |                           |                        |                     |
      | PL542       | NULL | VISION LINK       | Cat Essentials - Hourly     |                           |                        |                     |
      | PL542       | NULL | VISION LINK       | Cat Essentials - 10 Minutes |                           |                        |                     |
      | PL542       | NULL | MY.CAT.COM        | Cat Daily                   |                           |                        |                     |
      | PL542       | NULL | EQUIPMENT TRACKER | Cat Daily                   |                           |                        |                     |
