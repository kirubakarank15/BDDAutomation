@Subscription
Feature: Update DealerInherited Subscriptions in two Levels
  This feature is to Validate Deletion of DealerInherited subscriptions in two Levels

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete DealerInherited Subscription without deleting the ChildLevel Subscription
  #  Then Delete the Subscription for Dealer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #  | cancelReason | level |
  #  | End of Term  | CAT   |
  
  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the CAT-ChildLevel Subscription
    Then Delete the Subscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg for DealerInherited Subscription

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the Dealer-ChildLevel Subscription
    Then Delete the Subscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg for DealerInherited Subscription

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the two Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledDealerInheritedSubscriptions
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledDealerInheritedSubscriptions
