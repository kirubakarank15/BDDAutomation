Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether the user is able to set the subscriptions for the deivce type 161 with all the combinations
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Device Type>","<S/N >","<Services>","<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<Device Type>","<S/N >","<Services>","<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>" in My Worklist page

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription         | Dealer Level Subscription | Cat Level Subscription |
      | PL161       | NULL | VISION LINK       | Cat Locator (Prepaid With Hardware) |                           |                        |
      | PL161       | NULL | MY.CAT.COM        | Cat Daily                           |                           |                        |
      | PL161       | NULL | EQUIPMENT_TRACKER | Cat Daily                           |                           |                        |
