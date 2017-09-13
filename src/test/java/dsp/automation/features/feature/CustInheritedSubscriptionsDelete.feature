@API1
Feature: Update Customer Inherited Subscriptions in all Levels
  This feature is to Validate Deletion of Customer Inherited subscriptions in all Levels

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete CustomerInherited Subscription without deleting the ChildLevel Subscription
  #  Then Delete the Subscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #   | cancelReason | level |
  #   | End of Term  | CAT   |
  
  @Sanity @Regression @Positive
  Scenario Outline: Delete CustomerInherited Subscription by deleting the CAT-ChildLevel Subscription
    Then Delete the Subscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete CustomerInherited Subscription by deleting the Dealer-ChildLevel Subscription
    Then Delete the Subscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete CustomerInherited Subscription by deleting the Customer-Level Subscription
    Then Delete the Subscription for Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCustInheritedSubscriptions
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCustInheritedSubscriptions
