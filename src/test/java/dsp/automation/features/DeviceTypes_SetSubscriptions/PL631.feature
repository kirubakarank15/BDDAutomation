Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                     | Dealer Level Subscription   | Cat Level Subscription      |
      | PL631       | NULL | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                                     | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |
      | PL631       | NULL | VISION LINK       | Cat Basic - 4 Hours,Cat Basic - Hourly,Cat Essentials - 4 Hours |                             |                             |
      | PL631       | NULL | MY.CAT.COM        | Cat Daily                                                       |                             |                             |
      | PL631       | NULL | EQUIPMENT TRACKER | Cat Daily                                                       |                             |                             |

  Scenario Outline: To verify the addon servvices for the device type PL631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>,<Dealer Level Subscription>,<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL631       | NULL | VISION LINK | Cat Basic - 4 Hours         |                           |                        | VisionLink Load and Cycle Project Monitoring |

      
       Scenario Outline: To check whether the user is able to set the subscriptions for the deivce type PL631 with all the combinations
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Device Type>","<S/N >","<Services>","<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<Device Type>","<S/N >","<Services>","<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription><Additional Services>" in My Worklist page

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services |
      | PL631       | NULL | VISION LINK       | Cat Basic - 4 Hours        |                           |                        |                     |
      | PL631       | NULL | VISION LINK       | Cat Basic - Hourly     |                           |                        |                     |
      | PL631       | NULL | VISION LINK       | Cat Essentials - 4 Hours    |                           |                        |                     |
      | PL631       | NULL | VISION LINK       | Cat Essentials - 10 Minutes |                           |                        |                     |
      | PL631       | NULL | MY.CAT.COM        | Cat Daily                   |                           |                        |                     |
      | PL631       | NULL | EQUIPMENT TRACKER | Cat Daily                   |                           |                        |                     |
      