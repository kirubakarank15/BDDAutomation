@API1
Feature: Update DealerInherited Subscriptions in two Levels with NonInherited Customer Level Subscription
  This feature is to Validate Deletion of DealerInherited subscriptions in two Levels with NonInherited Customer Level Subscription

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete DealerInherited Subscription without deleting the ChildLevel Subscription for DealerInheritedwithCustSubscription
  #  Then Delete DealerInheritedwithCustSubscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #  | cancelReason | level |
  #  | End of Term  | Customer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the CAT-ChildLevel Subscription for DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the Dealer-ChildLevel Subscription for DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the Dealer-ChildLevel Subscription for DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription for Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the two Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledDealerInheritedwithCustSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledDealerInheritedwithCustSubscription
