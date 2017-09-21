@US_162 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Applicable Promotion Value
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "SerialNumber =<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "SerialNumber =<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |

  @CatProfile @US_162 @TC_495 @Postitive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Customer level(Inherited to Dealer and Cat) for PLWEB
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Device Type | S/N      | Services         | Cat             | Dealer          | Customer       |
      | E250       | PLE641      | AUT10011 |                  |                 |                 |                |
      | H160       | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Aide(EC4-14-T) |
      | N030       |             |          |                  |                 |                 |                |
      | M610       |             |          |                  |                 |                 |                |
      | B330       |             |          |                  |                 |                 |                |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Dealer level(Inherited to cat) for PLWEB
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly
    And Verify the values of PromotionName and Discount from Zuora API

    #check from API values - added
    Examples: 
      | DealerCode | Device Type | S/N      | Services         | Cat             | Dealer          | Customer |
      | E250       | PLE641      | AUT10011 |                  |                 |                 |          |
      | H160       | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | None     |
      | N030       |             |          |                  |                 |                 |          |
      | M610       |             |          |                  |                 |                 |          |
      | B330       |             |          |                  |                 |                 |          |

  @CatProfile @US_162 @TC_508 @Negative
  Scenario Outline: To Verify PromotionName and DiscountName are not displayed when only CAT level is selected for PLWEB
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are not displayed

    Examples: 
      | DealerCode | Services        | Cat                |
      | E250       | ProductLink Web | Aide(EC4-14)       |
      | H160       | ProductLink Web | Advisor(EC24-54)   |
      | N030       | ProductLink Web | Advisor(EC24-54-T) |
      | M610       | ProductLink Web | Vitals(EC1-4)      |
      | B330       |                 |                    |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected for Visionlink in cat login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Base Subscription=<Base Subscription>,Additional Services=<Additional Subscriptio>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    #for diff dealers check with diff sub combinations - added
    Examples: 
      | DealerCode | Services   | Base Subscription           | Additional Services                          |
      | E250       | VisionLink | Cat Basic - Hourly          | VisionLink Load and Cycle Project Monitoring |
      | H160       | VisionLink | Cat Basic - Houly           |                                              |
      | N030       | VisionLink | Cat Essentials - Hourly     |                                              |
      | M610       | VisionLink | Cat Essentials - 10 Minutes |                                              |
      | B330       | VisionLink | Cat Basic - 10 Minutes      |                                              |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Customer level for My.Cat.Com Application in Cat login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Base Subscription=<Base Subscription>,Additional Services=<Additional Subscriptio>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services   | Base Subscription |
      | E250       | My.Cat.Com | Cat Daily         |
      | H160       |            |                   |
      | N030       |            |                   |
      | M610       |            |                   |
      | B330       |            |                   |

  @CatProfile @US_162 @TC_504 @Postitive
  Scenario Outline: To Verify PromotionName and DiscountAmount are displayed after changing existing subscription for an asset in CAT profile
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription

    Examples: 
      | DealerCode | Device Type | Services         | Cat           | Dealer        | Customer     | Base Subscription      | Additional Subscription |
      | E250       | PLE641      | VisionLink       |               |               |              | Cat Basic - 10 Minutes | Onbaord Analytics       |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14) | Aide (EC4-14) | Aide(EC4-14) |                        |                         |
      | N030       |             | My.Cat.Com       |               |               |              | Cat Daily              |                         |
      | M610       |             |                  |               |               |              |                        |                         |
      | B330       |             |                  |               |               |              |                        |                         |

  #while cancelling the subscription
  #change the subscription concurrently and check the promo value - added
  Scenario Outline: To verify PromotionName and DiscountAmount values are changing concurrently based on change in subscription
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI PromotionName and Discountamount values should be changed concurrently based on selected subscription values
    And Verify the values of PromotionName and Discountamount in Zuora API

    Examples: 
      | DealerCode | Device Type | Services         | Cat           | Dealer        | Customer     | Base Subscription      | Additional Subscription |
      | E250       | PLE641      | VisionLink       |               |               |              | Cat Basic - 10 Minutes | Onbaord Analytics       |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14) | Aide (EC4-14) | Aide(EC4-14) |                        |                         |
      | N030       |             | My.Cat.Com       |               |               |              | Cat Daily              |                         |
      | M610       |             |                  |               |               |              |                        |                         |
      | B330       |             |                  |               |               |              |                        |                         |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To verify PromotionName and DiscountAmount are not be displayed after cancelling the asset subscription in cat login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI PromotionName and DiscountAmount should not be displayed after cancelling the asset subscription

    Examples: 
      | DealerCode | Services         | Cat           | Dealer        | Customer     | Base Subscription      | Additional Subscription |
      | E250       | VisionLink       |               |               |              | Cat Basic - 10 Minutes | Onbaord Analytics       |
      | H160       | Product Link Web | Aide (EC4-14) | Aide (EC4-14) | Aide(EC4-14) |                        |                         |
      | N030       | My.Cat.Com       |               |               |              | Cat Daily              |                         |
      | M610       |                  |               |               |              |                        |                         |
      | B330       |                  |               |               |              |                        |                         |

  @CatProfile @US_162 @TC_506 @Positive
  Scenario: To Verify PromotionName and DiscountAmount are not displayed for already subscribed assets in CAT login
    When Set in UI "DealerCode=<DealerCode>"
    And search Asset details as "SerialNumber =<SerialNumber>" in My Worklist Page
    Then Verify in UI PromtionName and DiscountAmount are not displayed for already subscribed assets

  @CatProfile @US_162 @TC_509 @Negative
  Scenario Outline: To Verify PromotionName and DiscountAmount should not get updated after selecting Onboard Analytics Add on for PLWEB as Cat login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Customer=<Customer>,Dealer=<Dealer>,Cat=<Cat>,Additional Services  =<Additional Services>"
    Then Verify in UI PromotionName and Discount should not updated after selecting Onboard Analytics

    Examples: 
      | DealerCode | Services        | Customer     | Dealer       | Cat          | Additional Services |
      | E250       | ProductLink Web | Aide(EC4-14) | Aide(EC4-14) | Aide(EC4-14) | Onboard Analytics   |

  #when only onboard analytics is selected already subscribed asset
  @CatProfile @US_162 @TC_ @Negative
  Scenario Outline: To Verify PromotionName and DiscountAmount should not get updated after selecting Onboard Analytics Add on for VisionLink as Cat login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI PromotionName and Discount should not updated after selecting Onboard Analytics

    Examples: 
      | DealerCode | Services   | Base Subcscription     | Additional Services                          |
      | E250       | VisionLink | Cat Basic - 10 Minutes | VisionLink Load and Cycle Project Monitoring |
      | H160       |            |                        |                                              |
      | N030       |            |                        |                                              |
      | M610       |            |                        |                                              |
      | B330       |            |                        |                                              |

  @DealerProfile @US_162 @TC_ @Postitive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Customer level(Inherited to Dealer) for PLWEB
    When enter or modify Subscription details as "Services=<Services>,Dealer =<Dealer>,Customer =<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services         | Dealer          | Customer       |
      | E250       |                  |                 |                |
      | H160       | Product Link Web | Aide (EC4-14-T) | Aide(EC4-14-T) |
      | N030       |                  |                 |                |
      | M610       |                  |                 |                |
      | B330       |                  |                 |                |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Dealer level for PLWEB
    When enter or modify Subscription details as "Services=<Services>,Dealer =<Dealer>,Customer =<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | Services         | Dealer          | Customer |
      |                  |                 |          |
      | Product Link Web | Aide (EC4-14-T) | None     |
      |                  |                 |          |
      |                  |                 |          |
      |                  |                 |          |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected for Visionlink in Dealer login
    When enter or modify Subscription details as "Services=<Services>,Base Subscription=<Base Subscription>,Additional Services=<Additional Subscriptio>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services   | Base Subscription      | Additional Services                          |
      | E250       | VisionLink | Cat Basic - 10 Minutes | VisionLink Load and Cycle Project Monitoring |
      | H160       |            |                        |                                              |
      | N030       |            |                        |                                              |
      | M610       |            |                        |                                              |
      | B330       |            |                        |                                              |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected for My.Cat.Com Application in Cat login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Base Subscription=<Base Subscription>,Additional Services=<Additional Subscriptio>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services   | Base Subscription |
      | E250       | My.Cat.Com | Cat Daily         |
      | H160       |            |                   |
      | N030       |            |                   |
      | M610       |            |                   |
      | B330       |            |                   |

  @DealerProfile @US_162 @TC_ @Postitive
  Scenario Outline: To Verify PromotionName and DiscountAmount are displayed after changing existing subscription for an asset in Dealer profile
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription

    Examples: 
      | Services         | Dealer        | Customer     | Base Subscription      | Additional Subscription |  |
      | VisionLink       |               |              | Cat Basic - 10 Minutes | Onbaord Analytics       |  |
      | Product Link Web | Aide (EC4-14) | Aide(EC4-14) |                        |                         |  |
      | My.Cat.Com       |               |              | Cat Daily              |                         |  |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To verify PromotionName and DiscountAmount values are changing concurrently based on change in subscription in Dealer Login
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI PromotionName and Discountamount values should be changed concurrently based on selected subscription values
    And Verify the values of PromotionName and Discountamount in Zuora API

    Examples: 
      | DealerCode | Services         | Dealer        | Customer     | Base Subscription      | Additional Subscription |
      | E250       | VisionLink       |               |              | Cat Basic - 10 Minutes | Onbaord Analytics       |
      | H160       | Product Link Web | Aide (EC4-14) | Aide(EC4-14) |                        |                         |
      | N030       | My.Cat.Com       |               |              | Cat Daily              |                         |
      | M610       |                  |               |              |                        |                         |
      | B330       |                  |               |              |                        |                         |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To verify PromotionName and DiscountAmount are not be displayed after cancelling the asset subscription in Dealer login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI PromotionName and DiscountAmount should not be displayed after cancelling the asset subscription

    Examples: 
      | DealerCode | Services         | Dealer        | Customer     | Base Subscription      | Additional Subscription |
      | E250       | VisionLink       |               |              | Cat Basic - 10 Minutes | Onbaord Analytics       |
      | H160       | Product Link Web | Aide (EC4-14) | Aide(EC4-14) |                        |                         |
      | N030       | My.Cat.Com       |               |              | Cat Daily              |                         |
      | M610       |                  |               |              |                        |                         |
      | B330       |                  |               |              |                        |                         |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario: To Verify PromotionName and DiscountAmount are not displayed for already subscribed assets in Dealer profile
    When search Asset details as "SerialNumber =<SerialNumber>" in My Worklist Page
    Then Verify in UI PromtionName and DiscountAmount are not displayed for already subscribed assets
