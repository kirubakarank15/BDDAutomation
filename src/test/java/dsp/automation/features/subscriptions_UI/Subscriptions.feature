@Subscriptions
Feature: To Validate Subscription UI functionalities for different Device Types.

  @Subscription_Sanity @Subscription_Regression1
  Scenario: Navigate to My Worklist
    Given Login into DSP Portal
 
  @Subscription_Sanity
  Scenario Outline: Sanity on Subscription
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Save" button or link
    Then verify the message "New Subscription Applied Successfully" is displayed

    Examples: 
      | Device Type | S/N      | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | PLE641      | AUT10011 | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |

  @Subscription_Regression1
  Scenario Outline: To verify the subscription functionality with different Device Types
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    #Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Save" button or link
    Then verify the message "New Subscription Applied Successfully" is displayed 
    And click "Back" button or link
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>" in My Worklist page

    Examples: 
      | Device Type | S/N      | Services   | Cat | Dealer | Customer | Base Subscription        | Additional Services                               |
      # | PLE631       | AUT10012 | Product Link Web  | Vitals (ES1-0)       | Vitals (ES1-0)         | Vitals (ES1-0)             |                            |                                                   |
      | PLE631      | AUT10013 | VisionLink |     |        |          | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring.True |

  #| PL161        | AUT10014 | Equipment Tracker |                      |                        |                            | Cat Daily                  |                                                   |
  #| PLE641+PL631 | AUT10015 | Product Link Web  | Aide (EC4-14 & S4-0) | Aide (EC4-14-T & S0-0) | Advisor (EC24-54-T & S0-0) |                            |                                                   |
  #| PL641        | AUT10016 | VisionLink        |                      |                        |                            | Cat Essentials - Hourly    | VisionLink Load and Cycle Project Monitoring.True |
  #| PLE640       | AUT10017 | My.Cat.Com        |                      |                        |                            | Cat Daily                  |                                                   |
  #| PL241        | AUT10018 | Product Link Web  | Basic Vitals         | Basic Vitals           | Basic Vitals               | Cat Daily                  |                                                   |
  #| PLE640       | AUT10019 | Product Link Web  | Advisor (EC24-104)   | Advisor (EC24-104)     | Advisor (EC24-54-T)        | Cat Daily                  | Onboard Analytics=True                            |
  @Subscription_Regression
  Scenario Outline: To validate the unsubscribe functionality with different Device Types.
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Customer:=<Customer>"
    And select reason as "Reason=<Reason>" and click "ok" in Cancel Reason Pop Up
    And click "Save" button or link
    Then verify the message "New Subscription Applied Successfully" is displayed
    And click "Back" button or link
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "S/N =<S/N>,Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>" in My Worklist page

    Examples: 
      | Device Type  | S/N      | Services          | Cat | Dealer | Customer | Base Subscription | Reason                               |
      | PLE641       | AUT10011 | Product Link Web  |     |        | None     |                   | Cust Product Transferred             |
      | PLE631       | AUT10012 | Product Link Web  |     |        | None     |                   | End of Term                          |
      | PLE631       | AUT10013 | VisionLink        |     |        |          | None              | Device Removed/Stored for Future Use |
      | PL161        | AUT10014 | Equipment Tracker |     |        |          | None              | Subscription Payment Not Received    |
      | PLE641+PL631 | AUT10015 | Product Link Web  |     |        | None     |                   | Device Not Functioning               |
      | PL641        | AUT10016 | VisionLink        |     |        |          | None              | Device Permanently Removed           |
      | PLE640       | AUT10017 | My.Cat.Com        |     |        |          | None              | Cust Product Transferred             |

  @Subscription_Regression @Negative_Subscritpion
  Scenario Outline: To verify that application is not allowing to set subscription for customer when the asset is
    not associated with any customer

    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "S/N =<S/N>,Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>"
    And verify and accept the select customer warning Pop Up.

    Examples: 
      | Device Type  | S/N      | Services         | Cat                   | Dealer                | Customer              | Base Subscription | Additional Services |
      | PL161        | AUT10004 | Product Link Web |                       |                       | Vitals (EC1-4)        |                   |                     |
      | PLE641+PL631 | AUT10005 | Product Link Web | Vitals (EC1-4 & S1-0) | Vitals (EC1-4 & S1-0) | Vitals (EC1-4 & S0-0) |                   |                     |
