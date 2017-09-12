@US_162 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Applicable Promotion Value
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @CatProfile @US_162 @TC_495 @Postitive
  Scenario Outline: To Verify applicable PromotionName and DiscountAmount for the selected subscription in Payment Preview popup in CAT profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" for the selected Subscription in Payment Preview popup
    And Verify the values of "ApplicablePromotionName", "DiscountAmount" for the selected Subscription are retrieved from Zuora Promotion App correctly.

    Examples: 
      | DealerCode | Serial Number | Subscriptions | Applications     |
      | B330       |               |               | VisionLink       |
      | E250       |               |               | Product Link Web |
      | H160       |               |               | My.Cat.com       |
      | N030       |               |               |                  |
      | M610       |               |               |                  |

  @DealerProfile @US_162 @TC_499 @Postitive
  Scenario Outline: To Verify applicable PromotionName and DiscountAmount for the selected subscription in Payment Preview popup in Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" for the selected Subscription in Payment Preview popup
    And Verify the values of "ApplicablePromotionName", "DiscountAmount" for the selected Subscription are retrieved from Zuora Promotion App correctly.

    Examples: 
      | DealerCode | Serial Number | Subscriptions | Applications     |
      | B330       |               |               | VisionLink       |
      | E250       |               |               | Product Link Web |
      | H160       |               |               | My.Cat.com       |
      | N030       |               |               |                  |
      | M610       |               |               |                  |

  @CatProfile @US_162 @TC_500 @Postitive
  Scenario Outline: To Verify updated values of applicable promotionName and DiscountAmount if change in subscription happened in CAT profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Change the subscription for the asset
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" for the selected Subscription are updated accordingly in Payment Preview popup
    And Verify the values of "ApplicablePromotionName", "DiscountAmount" for the selected Subscription are retrieved from Zuora Promotion App correctly.

    Examples: 
      | DealerCode | Serial Number | Subscriptions | Applications     |
      | B330       |               |               | VisionLink       |
      | E250       |               |               | Product Link Web |
      | H160       |               |               | My.Cat.com       |
      | N030       |               |               |                  |
      | M610       |               |               |                  |

  @DealerProfile @US_162 @TC_501 @Postitive
  Scenario Outline: To Verify updated values of applicable PromotionName and DiscountAmount if change in subscription happened in Dealer Profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Change the subscription for the asset
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" for the selected Subscription are updated accordingly in Payment Preview popup
    And Verify the values of "ApplicablePromotionName", "DiscountAmount" for the selected Subscription are retrieved from Zuora Promotion App correctly.

    Examples: 
      | DealerCode | Serial Number | Subscriptions | Applications     |
      | B330       |               |               | VisionLink       |
      | E250       |               |               | Product Link Web |
      | H160       |               |               | My.Cat.com       |
      | N030       |               |               |                  |
      | M610       |               |               |                  |

  @CatProfile @US_162 @TC_502 @Postitive
  Scenario Outline: To Verify PromotionName and DiscountAmount are displayed while setting a new subscription for an asset in CAT profile
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" for the new Subscription in Payment Preview popup

  @DealerProfile @US_162 @TC_503 @Postitive
  Scenario Outline: To Verify PromotionName and DiscountName are displayed while setting a new subscription for an asset in Dealer Profile
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" for the new Subscription in Payment Preview popup

  @CatProfile @US_162 @TC_504 @Postitive
  Scenario Outline: To Verify PromotionName and DiscountName are displayed while changing existing subscription for an asset in CAT profile
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" while changing an existing Subscription in Payment Preview popup

  @DealerProfile @US_162 @TC_505 @Positive
  Scenario Outline: To Verify PromotionName and DiscountName are displayed while changing existing subscription for an asset in Dealer Profile
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=true","DiscountAmount.isDisplayed=true" while changing an existing Subscription in Payment Preview popup

  @CatProfile @US_162 @TC_506 @Positive
  Scenario Outline: To Verify PromotionName and DiscountName are not displayed for already subscribed assets in CAT profile
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=false","DiscountAmount.isDisplayed=false" for already subscribed assets

  @DealerProfile @US_162 @TC_507 @Positive
  Scenario Outline: To Verify PromotionName and DiscountName are not displayed for already subscribed assets in Dealer profile
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ApplicablePromotionName.isDisplayed=false","DiscountAmount.isDisplayed=false" for already subscribed assets

  @CatProfile @US_162 @TC_508 @Negative
  Scenario Outline: To Verify PromotionName and DiscountName are not displayed when only CAT level is selected
    And Logged in CATProfile as "<DealerCode>"
    When Cat user selected some subscription at Cat level
    Then Verify in UI "ApplicablePromotionName.isDisplayed=false","DiscountAmount.isDisplayed=false" for the asset

  @CatProfile @US_162 @TC_509 @Negative
  Scenario Outline: To Verify PromotionName and DiscountName are not displayed for Onboard Analytics after selecting cat level subscription
    And Logged in CATProfile as "<DealerCode>"
    When Cat user selected some subscription at Cat level
    Then Verify in UI "ApplicablePromotionName.isDisplayed=false","DiscountAmount.isDisplayed=false" for Onboard Analytics after selecting cat level subscription
