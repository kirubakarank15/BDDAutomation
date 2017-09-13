@US_161 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Subscription Pricing Value
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @CatProfile @US_161 @TC_310 @Postitive
  Scenario Outline: To Verify Subscription Widget and its fields in DSP as CAT profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True", "DiscountCode.isDisplayed=True", "ContractPeriod_DropDown.isDisplayed=True" and "AutoRenew_Checkbox.isDisplayed=True" options should be displayed for all "<Subscriptions>" for supported "<Applications>"

    Examples: 
      | Broswer | DealerCode | Serial Number | Subscriptions | Applications     |
      | IE      | B330       |               |               | VisionLink       |
      | Chrome  | E250       |               |               | Product Link Web |
      | Chrome  | H160       |               |               | My.Cat.com       |
      | Chrome  | N030       |               |               |                  |
      | Chrome  | M610       |               |               |                  |

  @DealerProfile @US_161 @TC_312 @Postitive
  Scenario Outline: To Verify Subscription Widget and its fields in DSP as Dealer profile
    When Navigate to "MY WORKList"
    And Logged in Dealerprofile as "<Dealercode>"
    When Search Asset details as "Serial number" in My Worklist Page
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True", "DiscountCode.isDisplayed=True", "ContractPeriod_DropDown.isDisplayed=True" and "AutoRenew_Checkbox.isDisplayed=True" options should be displayed for all "<Subscriptions>" for supported "<Applications>"

    Examples: 
      | Dealercode | Serial Number | Subscriptions | Applications     |
      | B330       |               |               | VisionLink       |
      | E250       |               |               | Product Link Web |
      | H160       |               |               | My.Cat.Com       |
      | N030       |               |               |                  |
      | M610       |               |               |                  |

  @CatProfile @US_161 @TC_313 @Postitive
  Scenario Outline: To Verify Subscription pricing values for assets in DSP as CAT profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Cat user is viewing the subscription selection dropdown for an newly onboarded asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=true" for all Base and Add-on subscriptions of that asset for supported "<Applications>"
    And verify the Subscription pricing values are matching with Zuora product catalog

    Examples: 
      | Dealercode | Serial Number | Applications     |
      | B330       |               | VisionLink       |
      | E250       |               | Product Link Web |
      | H160       |               | My.Cat.Com       |
      | N030       |               |                  |
      | M610       |               |                  |

  @DealerProfile @US_161 @TC_314 @Postitive
  Scenario Outline: To Verify Subscription pricing values for assets in DSP as Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Dealer user is viewing the subscription selection dropdown for an newly onboarded asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=true" for all Base and Add-on subscriptions of that asset for supported "<Applications>"
    And verify the Subscription pricing values are matching with Zuora product catalog

    Examples: 
      | Dealercode | Serial Number | Applications     |
      | B330       |               | VisionLink       |
      | E250       |               | Product Link Web |
      | H160       |               | My.Cat.Com       |
      | N030       |               |                  |
      | M610       |               |                  |

  @CatProfile @US_161 @TC_315 @Postitive
  Scenario Outline: To Verify Subscription pricing values for already subscribed assets as Cat profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Cat user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=false" for the current subscription combination of that asset for supported "<Applications>"
    And Verify in UI "SubscriptionPricingValue.isDisplayed=false" for the remanining subscriptions for supported Applications "<Applications>"

    Examples: 
      | Dealercode | Serial Number | Applications     |
      | B330       |               | VisionLink       |
      | E250       |               | Product Link Web |
      | H160       |               | My.Cat.Com       |
      | N030       |               |                  |
      | M610       |               |                  |

  @DealerProfile @US_161 @TC_316 @Postitive
  Scenario Outline: To Verify Subscription pricing values for already subscribed assets as Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Dealer user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=false" for the current subscription combination of that asset for supported "<Applications>"
    And Verify in UI "SubscriptionPricingValue.isDisplayed=True" for the remanining subscriptions for supported Applications "<Applications>"

    Examples: 
      | Dealercode | Serial Number | Applications     |
      | B330       |               | VisionLink       |
      | E250       |               | Product Link Web |
      | H160       |               | My.Cat.Com       |
      | N030       |               |                  |
      | M610       |               |                  |

  @CatProfile @US_161 @TC_317 @Postitive
  Scenario Outline: To verify Subscription pricing values for PLWEB application alone as Cat profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<DealerCode>"
    When Cat user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True" for all subscriptions at Dealer level only for "<PLWEB>" application alone

  @DealerProfile @US_161 @TC_318 @Postitive
  Scenario Outline: To verify Subscription pricing values for PLWEB application alone as Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<DealerCode>"
    When Dealer user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True" for all subscriptions at Dealer level only for "<PLWEB>" application alone

  @CatProfile @US_161 @TC_319 @Positive
  Scenario Outline: To verify Subscription pricing values for VisionLink application alone as Cat profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<DealerCode>"
    When Cat user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True" for all subscriptions at Customer level dropdown for "<VisionLink>" application alone

  @DealerProfile @US_161 @TC_320 @Positive
  Scenario Outline: To verify Subscription pricing values for VisionLink application alone as Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<DealerCode>"
    When Dealer user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True" for all subscriptions at Customer level dropdown for "<VisionLink>" application alone

  @CatProfile @US_161 @TC_321 @Postitive
  Scenario Outline: To verify Subscription pricing values for My.Cat.Com application alone as Cat profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<DealerCode>"
    When Cat user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True" for all subscriptions at Customer level dropdown for "<My.Cat.Com>" application alone

  @DealerProfile @US_161 @TC_322 @Postitive
  Scenario Outline: To verify Subscription pricing values for My.Cat.Com application alone as Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<DealerCode>"
    When Dealer user is viewing the subscription selection dropdown for an asset with "<Serial Number>"
    Then Verify in UI "SubscriptionPricingValue.isDisplayed=True" for all subscriptions at Customer level dropdown for "<My.Cat.Com>" application alone

  @CatProfile @US_161 @TC_452 @Positive
  Scenario: To Verify Subscription pricing values are not displayed when only cat level subscription is selected
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<DealerCode>"
    When Cat user is trying to set subscription for Only CAT level for PLWEB application
    Then Verify in UI "Subscription pricing values.isDisplayed=false" at cat level

  @CatProfile @US_161 @TC_455 @Positive
  Scenario: To Verify Subscription pricing values are not displayed for Onboard analytics after selecting cat level subscription
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<DealerCode>"
    When Cat user selected some subscription at Cat level
    Then Verify in UI "Subscription pricing values.isDisplayed=false" for Onboard analytics after selecting cat level subscription
