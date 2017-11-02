@API1
Feature: Update NonInherited Subscriptions in all Levels
  This feature is to Validate update of NonInherited subscriptions in all Levels

  #@Sanity @Regression @Negative
  #Scenario Outline: NonInherited Subscription without deleting the ChildLevel Subscription
  #  Then Delete tNonInheritedSubscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #   | cancelReason | level      |
  #   | End of Term  | Customer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete NonInherited Subscription by deleting the CAT-ChildLevel Subscription
    Then Delete NonInheritedSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete NonInherited Subscription by deleting the Dealer-ChildLevel Subscription
    Then Delete NonInheritedSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete NonInherited Subscription by deleting the Customer-Level Subscription
    Then Delete NonInheritedSubscription Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledNonInheritedSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledNonInheritedSubscription
