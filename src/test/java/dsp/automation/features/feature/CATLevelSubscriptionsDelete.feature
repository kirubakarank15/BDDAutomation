@API1
Feature: Update CATLevel Subscriptions for the Onboarded Asset
  This feature is to Validate Deletion of CATLevel subscriptions for the Onboarded Asset

  @Sanity @Regression @Positive
  Scenario Outline: Delete CATLevel Subscription
    Then Delete the  CATLevel Subscription with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions cancelled for CAT Level in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CancelledCATLevelSubscriptions
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CancelledCATLevelSubscriptions
