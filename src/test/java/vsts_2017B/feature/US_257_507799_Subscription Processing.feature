@2017B @US_257 @US_507799 @SubscriptionProcessing
Feature: SubscriptionProcessing in zuora

  @DealerUserProfile @CATUserProfile @FunctionalPositive1
  Scenario: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"
    And "DealerUserProfile.login =True,Subscriptions.Selected= True,Promotions.Selected =True,contract period.Selected =True,AutoPeriod.Selected =True" in My Worklist Page
      | Role              |
      | DealerUserProfile |
      | CATUserProfile    |

  @DealerUserProfile @FunctionalPositive2
  Scenario: Login to validate in Zuora for subscriptions, Promotions, contract period ,AutoRenew Submitted in DSP with DealerUserProfile
    When Subcription should be set Successfully in My Worklist Page
    And login to Zuora to verify subscriptions, Promotions, contract period and AutoPeriod
    Then "Zuora Subscription = DSP Subscription,Zuora Promotions =DSP Promotions,Zuora Contract Period = DSP Contract Period,Zuora Auto Renew = DSP Auto Renew" should be created in Zuora

  @CATUserProfile @FunctionalPositive3
  Scenario: Login to validate in Zuora for subscriptions, Promotions, contract period ,AutoRenew Submitted in DSP with CATUserProfile
    When Subcription should be set Successfully in My Worklist Page
    And login to Zuora to verify subscriptions, Promotions, contract period and AutoPeriod
    Then "Zuora Subscription = DSP Subscription,Zuora Promotions =DSP Promotions,Zuora Contract Period = DSP Contract Period,Zuora Auto Renew = DSP Auto Renew" should be created in Zuora
