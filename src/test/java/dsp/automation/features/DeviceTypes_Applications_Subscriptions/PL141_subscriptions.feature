
Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL141.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer  | Cat     |
      | PL141       | NULL | PRODUCT LINK WEB  | Locator                     | Locator | Locator |
      | PL141       | NULL | VISION LINK       | Cat Locator - 6 Hours       |         |         |
      | PL141       | NULL | MY.CAT.COM        | Cat Daily                   |         |         |
      | PL141       | NULL | EQUIPMENT TRACKER | Cat Daily                   |         |         |

##NO Add on