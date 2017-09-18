@API
Feature: Update Customer Inherited Subscriptions with NonInherited CAT LevelSubscription
  This feature is to Validate Deletion of Customer Inherited subscriptions with NonInherited CAT LevelSubscription

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete CustInheritedSubscription without deleting the ChildLevel Subscription
  #  Then Delete CustInheritedSubscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #   | cancelReason | level |
  #   | End of Term  | Customer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription by deleting the CAT-ChildLevel Subscription
    Then Delete CustInheritedwithCATLevelSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription by deleting the Dealer-ChildLevel Subscription
    Then Delete CustInheritedwithCATLevelSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription by deleting the Customer-Level Subscription
    Then Delete CustInheritedwithCATLevelSubscription for Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCustInheritedwithCATLevelSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCustInheritedwithCATLevelSubscription
