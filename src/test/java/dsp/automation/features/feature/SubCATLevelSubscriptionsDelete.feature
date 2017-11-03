@API
Feature: Update CATLevel Subscriptions for the Onboarded Asset
  This feature is to Validate Deletion of CATLevel subscriptions for the Onboarded Asset

  @Sanity @Regression @Positive
  Scenario Outline: Delete CATLevel Subscription for CATLevel Subscription
    Then Delete CATLevelSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions cancelled for CAT Level in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCATLevelSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCATLevelSubscription