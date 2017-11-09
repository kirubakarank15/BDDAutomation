@US_162 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Applicable Promotion Value - #API is not ready still
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |

  @CatProfile @US_162 @TC_495 @Postitive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Customer level(Inherited to Dealer and Cat) for PLWEB
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Device Type | S/N      | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription |
      | E250       | PLE641      | AUT10011 |                  |                        |                           |                             |
      | H160       | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Aide(EC4-14-T)              |
      | N030       |             |          |                  |                        |                           |                             |
      | M610       |             |          |                  |                        |                           |                             |
      | B330       |             |          |                  |                        |                           |                             |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Dealer level(Inherited to cat) for PLWEB
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly
    And Verify the values of PromotionName and Discount from Zuora API

    #check from API values - added
    Examples: 
      | DealerCode | Device Type | S/N      | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription |
      | E250       | PLE641      | AUT10011 |                  |                        |                           |                             |
      | H160       | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | None                        |
      | N030       |             |          |                  |                        |                           |                             |
      | M610       |             |          |                  |                        |                           |                             |
      | B330       |             |          |                  |                        |                           |                             |

  @CatProfile @US_162 @TC_508 @Negative
  Scenario Outline: To Verify PromotionName and DiscountName are not displayed when only CAT level is selected for PLWEB
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are not displayed

    Examples: 
      | DealerCode | Services        | Cat Level Subscription |
      | E250       | ProductLink Web | Aide(EC4-14)           |
      | H160       | ProductLink Web | Advisor(EC24-54)       |
      | N030       | ProductLink Web | Advisor(EC24-54-T)     |
      | M610       | ProductLink Web | Vitals(EC1-4)          |
      | B330       |                 |                        |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected for Visionlink in cat login
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>,<Customer Level Subscription>,<Additional Services>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    #for diff dealers check with diff sub combinations - added
    Examples: 
      | DealerCode | Services   | Customer Level Subscription | Additional Services                          |
      | E250       | VisionLink | Cat Basic - Hourly          | VisionLink Load and Cycle Project Monitoring |
      | H160       | VisionLink | Cat Basic - Houly           |                                              |
      | N030       | VisionLink | Cat Essentials - Hourly     |                                              |
      | M610       | VisionLink | Cat Essentials - 10 Minutes |                                              |
      | B330       | VisionLink | Cat Basic - 10 Minutes      |                                              |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Customer level for My.Cat.Com Application in Cat login
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>,<Customer Level Subscription>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services   | Customer Level Subscription |
      | E250       | My.Cat.Com | Cat Daily                   |
      | H160       |            |                             |
      | N030       |            |                             |
      | M610       |            |                             |
      | B330       |            |                             |

  @CatProfile @US_162 @TC_504 @Postitive
  Scenario Outline: To Verify PromotionName and DiscountAmount are displayed after changing existing subscription for an asset in CAT profile
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription

    Examples: 
      | DealerCode | Device Type | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | E250       | PLE641      | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onbaord Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14)          | Aide (EC4-14)             | Aide(EC4-14)                |                     |
      | N030       |             | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | M610       |             |                  |                        |                           |                             |                     |
      | B330       |             |                  |                        |                           |                             |                     |

  #while cancelling the subscription - added
  #change the subscription concurrently and check the promo value - added
  Scenario Outline: To verify PromotionName and DiscountAmount values are changing concurrently based on change in subscription
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>"
    Then Verify in UI PromotionName and Discountamount values should be changed concurrently based on selected subscription values
    And Verify the values of PromotionName and Discountamount in Zuora API

    Examples: 
      | DealerCode | Device Type | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | E250       | PLE641      | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onbaord Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14)          | Aide (EC4-14)             | Aide(EC4-14)                |                     |
      | N030       |             | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | M610       |             |                  |                        |                           |                             |                     |
      | B330       |             |                  |                        |                           |                             |                     |

  @CatProfile @US_162 @TC_ @Positive
  Scenario Outline: To verify PromotionName and DiscountAmount are not be displayed after cancelling the asset subscription in cat login
    When Set in UI "DealerCode=<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>"
    Then Verify in UI PromotionName and DiscountAmount should not be displayed after cancelling the asset subscription

    Examples: 
      | DealerCode | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | E250       | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onbaord Analytics   |
      | H160       | Product Link Web | Aide (EC4-14)          | Aide (EC4-14)             | Aide(EC4-14)                |                     |
      | N030       | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | M610       |                  |                        |                           |                             |                     |
      | B330       |                  |                        |                           |                             |                     |

  @CatProfile @US_162 @TC_506 @Positive
  Scenario: To Verify PromotionName and DiscountAmount are not displayed for already subscribed assets in CAT login
    When Set in UI "<DealerCode>"
    And search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify in UI PromtionName and DiscountAmount are not displayed for already subscribed assets

  @CatProfile @US_162 @TC_509 @Negative
  Scenario Outline: To Verify PromotionName and DiscountAmount should not get updated after selecting Onboard Analytics Add on for PLWEB as Cat login
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Customer>","<Dealer>","<Cat>","<Additional Services>"
    Then Verify in UI PromotionName and Discount should not updated after selecting Onboard Analytics

    Examples: 
      | DealerCode | Services        | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services |
      | E250       | ProductLink Web | Aide(EC4-14)                | Aide(EC4-14)              | Aide(EC4-14)           | Onboard Analytics   |

  #when only onboard analytics is selected already subscribed asset - added
  @CatProfile @US_162 @TC_ @Negative
  Scenario Outline: To Verify PromotionName and DiscountAmount should not get updated after selecting Onboard Analytics Add on for VisionLink as Cat login
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>,<Customer Level Subscription>,<Additional Services>"
    Then Verify in UI PromotionName and Discount should not updated after selecting Onboard Analytics

    Examples: 
      | DealerCode | Services   | Customer Level Subscription | Additional Services                          |
      | E250       | VisionLink | Cat Basic - 10 Minutes      | VisionLink Load and Cycle Project Monitoring |
      | H160       |            |                             |                                              |
      | N030       |            |                             |                                              |
      | M610       |            |                             |                                              |
      | B330       |            |                             |                                              |

  @CatProfile @US_162 @TC_ @Negative
  Scenario Outline: To Verify PromotionName and DiscountAmount should not be displayed after selecting onboard analytics for already subscribed asset
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Additional Services>"
    Then Verify in UI PromotionName and Discount should not be displated after selecting Onboard Analytics for already subscribed asset

    Examples: 
      | DealerCode | Services         | Additional Services |
      | E250       | Product Link Web | Onboard Analytics   |
      | H160       | Product Link Web | Onboard Analytics   |
      | N030       | Product Link Web | Onboard Analytics   |
      | M610       | Product Link Web | Onboard Analytics   |
      | B330       | Product Link Web | Onboard Analytics   |

  @DealerProfile @US_162 @TC_ @Postitive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Customer level(Inherited to Dealer) for PLWEB
    When set Subscription details as "<Services>","<Dealer>","<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services         | Dealer Level Subscription | Customer Level Subscription |
      | E250       |                  |                           |                             |
      | H160       | Product Link Web | Aide (EC4-14-T)           | Aide(EC4-14-T)              |
      | N030       |                  |                           |                             |
      | M610       |                  |                           |                             |
      | B330       |                  |                           |                             |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected at Dealer level for PLWEB
    When set Subscription details as "<Services>","<Dealer>","<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | Services         | Dealer Level Subscription | Customer Level Subscription |
      |                  |                           |                             |
      | Product Link Web | Aide (EC4-14-T)           | None                        |
      |                  |                           |                             |
      |                  |                           |                             |
      |                  |                           |                             |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected for Visionlink in Dealer login
    When set Subscription details as "<Services>","<Customer Level Subscriptipn>","<Additional Services>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services   | Customer Level Subscription | Additional Services                          |
      | E250       | VisionLink | Cat Basic - 10 Minutes      | VisionLink Load and Cycle Project Monitoring |
      | H160       |            |                             |                                              |
      | N030       |            |                             |                                              |
      | M610       |            |                             |                                              |
      | B330       |            |                             |                                              |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To Verify Applicable PromotionName and DiscountAmount are displayed once subscription is selected for My.Cat.Com Application in Cat login
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Customer>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription
    And Verify the values of ApplicablePromotionName,DiscountAmount for the selected Subscription are retrieved from Zuora Promotion App correctly

    Examples: 
      | DealerCode | Services   | Customer Level Subscription |
      | E250       | My.Cat.Com | Cat Daily                   |
      | H160       |            |                             |
      | N030       |            |                             |
      | M610       |            |                             |
      | B330       |            |                             |

  @DealerProfile @US_162 @TC_ @Postitive
  Scenario Outline: To Verify PromotionName and DiscountAmount are displayed after changing existing subscription for an asset in Dealer profile
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Dealer>","<Customer>","<Additional Services>"
    Then Verify in UI ApplicablePromotionName,DiscountAmount are displayed for the selected Subscription

    Examples: 
      | Services         | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | VisionLink       |                           | Cat Basic - 10 Minutes      | Onbaord Analytics   |
      | Product Link Web | Aide (EC4-14)             | Aide(EC4-14)                |                     |
      | My.Cat.Com       |                           | Cat Daily                   |                     |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To verify PromotionName and DiscountAmount values are changing concurrently based on change in subscription in Dealer Login
    When set Subscription details as "<Services>","<Dealer>","<Customer>","<Additional Services>"
    Then Verify in UI PromotionName and Discountamount values should be changed concurrently based on selected subscription values
    And Verify the values of PromotionName and Discountamount in Zuora API

    Examples: 
      | DealerCode | Services         | Dealer Level Subscription | Customer Level Subscription | Additional Subscription |
      | E250       | VisionLink       |                           | Cat Basic - 10 Minutes      | Onbaord Analytics       |
      | H160       | Product Link Web | Aide (EC4-14)             | Aide(EC4-14)                |                         |
      | N030       | My.Cat.Com       |                           | Cat Daily                   |                         |
      | M610       |                  |                           |                             |                         |
      | B330       |                  |                           |                             |                         |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario Outline: To verify PromotionName and DiscountAmount are not be displayed after cancelling the asset subscription in Dealer login
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Dealer>","<Customer>","<Additional Services>"
    Then Verify in UI PromotionName and DiscountAmount should not be displayed after cancelling the asset subscription

    Examples: 
      | DealerCode | Services         | Dealer Level Subscription | Customer Level Subscription | Additional Subscription |
      | E250       | VisionLink       |                           | Cat Basic - 10 Minutes      | Onbaord Analytics       |
      | H160       | Product Link Web | Aide (EC4-14)             | Aide(EC4-14)                |                         |
      | N030       | My.Cat.Com       |                           | Cat Daily                   |                         |
      | M610       |                  |                           |                             |                         |
      | B330       |                  |                           |                             |                         |

  @DealerProfile @US_162 @TC_ @Positive
  Scenario: To Verify PromotionName and DiscountAmount are not displayed for already subscribed assets in Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify in UI PromtionName and DiscountAmount are not displayed for already subscribed assets
