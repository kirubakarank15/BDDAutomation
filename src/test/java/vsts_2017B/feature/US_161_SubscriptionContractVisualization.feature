@US_161 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Subscription Pricing Value
  This feature is to Verify Subscription Pricing values are displayed for Subscriptions

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |

  #communication mode for dual mode
  @CatProfile @US_161 @TC_310 @Postitive
  Scenario Outline: To Verify Subscription Widget and its fields in DSP as CAT Login - #passed
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    Then Verify in UI "SubscriptionPricingValue", "PromotionName","DiscountAmount", "ContractPeriodDropdown" and "AutoRenewCheckbox" options are displayed for all Subscriptions for supported "<Applications>"

    Examples: 
      | DealerCode | Device Type | S/N      | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | E250       | PLE641      | AUT10011 | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | H160       | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | N030       |             |          | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | M610       |             |          |                  |                        |                           |                             |                     |
      | B330       |             |          |                  |                        |                           |                             |                     |

  @CatProfile @US_161 @TC_313 @Postitive
  Scenario Outline: To Verify Subscription pricing values for assets in DSP as CAT Login - #failed for dualmode asset,Bug#902
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    Then Verify in UI SubscriptionPricingValues for all Base and Add-on subscriptions are displayed for supported Applications
    And Verify the Subscription pricing values are matching with Zuora product catalog

    Examples: 
      | DealerCode | Device Type | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subsscription | Additional Services |
      | E250       | PLE641      | VisionLink       |                        |                           | Cat Basic - 10 Minutes       | Onboard Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)               |                     |
      | N030       |             | My.Cat.Com       |                        |                           | Cat Daily                    |                     |
      | M610       |             |                  |                        |                           |                              |                     |
      | B330       |             |                  |                        |                           |                              |                     |

  @CatProfile @US_161 @TC_315 @Postitive
  Scenario Outline: To Verify Subscription pricing values for already subscribed assets as Cat Login - #passed
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Base Subscription>","<Additional Services>"
    Then Verify in UI SubscriptionPricingValues for already subscribed subscription are not displayed for supported "<Applications>"
    And Verify in UI SubscriptionPricingValues for the remanining subscriptions are displayed for supported "<Applications>"

    Examples: 
      | DealerCode | Device Type | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Base Subscription      | Additional Services |
      | E250       | PLE641      | VisionLink       |                        |                           |                             | Cat Basic - 10 Minutes | Onboard Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                        |                     |
      | N030       |             | My.Cat.Com       |                        |                           |                             |                        | Cat Daily           |
      | M610       |             |                  |                        |                           |                             |                        |                     |
      | B330       |             |                  |                        |                           |                             |                        |                     |

  @CatProfile @US_161 @TC_317 @Postitive
  Scenario Outline: To verify Subscription pricing values for PLWEB application when inherited from Customer level in Cat login - #passed
    When Set in UI "<DealerCode>"
    And enter or modify Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>" inherited from customer level
    Then Verify in UI Subscription Pricing Values are displayed for all subscriptions at Dealer level only for PLWEB application alone

    Examples: 
      | Services        | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | DealerCode |
      | ProductLink Web | Advisor(EC24-54)       | Advisor(EC24-54)          | Advisor(EC24-54)            | E250       |
      |                 |                        |                           |                             | H160       |
      |                 |                        |                           |                             | N030       |
      |                 |                        |                           |                             | M610       |
      |                 |                        |                           |                             | B330       |

  @CatProfile @US_161 @TC_ @Positive
  Scenario Outline: To verify Subscription pricing values for PLWEB application when inherited from Dealer level in Cat login - #passed
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>" inherited from Dealer level
    Then Verify in UI Subscription Pricing Values are displayed for all subscriptions at Dealer level only for PLWEB application alone

    Examples: 
      | Services        | Cat Level Subscription | Dealer Level Subscription | DealerCode |
      | ProductLink WEB | Aide (EC4-14-T)        | Aide (EC4-14-T)           | E250       |
      |                 |                        |                           | H160       |
      |                 |                        |                           | N030       |
      |                 |                        |                           | M610       |
      |                 |                        |                           | B330       |

  #couple of sub's rates cross check in DB
  @CatProfile @US_161 @TC_319 @Positive
  Scenario Outline: To verify Subscription pricing values for VisionLink application as Cat login - #passed
    When Set in UI "<DealerCode>"
    When Set Subscription details as "<Services>,<Customer Level Subscription>,<Additional Services>"
    Then Verify in UI Subscription Pricing values are displayed for all subscriptions at Customer level dropdown for VisionLink application alone

    Examples: 
      | Services   | Customer Level Subscription | Additional Services | DealerCode |
      | VisionLink | Cat Basic - 10 Minutes      | Onboard Analytics   | E250       |
      | VisionLinK |                             |                     | H160       |
      |            |                             |                     | N030       |
      |            |                             |                     | M610       |
      |            |                             |                     | B330       |

  @CatProfile @US_161 @TC_321 @Postitive
  Scenario Outline: To verify Subscription pricing values for My.Cat.Com application as Cat login - #passed
    When Set in UI "DealerCode=<DealerCode>"
    And Set Subscription details as "Services=<Services>,<Customer Level Subscription>"
    Then Verify in UI Subscription Pricing values are displayed for all subscriptions at Customer level dropdown for My.Cat.Com application alone

    Examples: 
      | Services   | Customer Level Subscription | DealerCode |
      | My.Cat.Com | Cat Daily                   | E250       |
      |            |                             | H160       |
      |            |                             | N030       |
      |            |                             | M610       |
      |            |                             | B330       |

  @CatProfile @US_161 @TC_452 @Negative
  Scenario Outline: To Verify Subscription pricing values are not displayed when only cat level subscription is selected  - #passed
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>,<Cat Level Subscription>"
    Then Verify in UI Subscription Pricing Values are not displayed at Cat level

    Examples: 
      | Services        | Cat Level Subscription | DealerCode |
      | ProductLink Web | Aide(EC41-14)          | E250       |
      |                 |                        | H160       |
      |                 |                        | N030       |
      |                 |                        | M610       |
      |                 |                        | B330       |

  @CatProfile @US_161 @TC_455 @Negative
  Scenario Outline: To Verify Subscription pricing values are not displayed for Onboard analytics Add on Subscription for PLWEB as Cat login - #passed
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>,<Customer Level Subscription>,<Dealer Level Subscription>,<Cat Level Subscription>,<Additional Services>"
    Then Verify in UI Subscription Pricing Values are not displayed at Onboard Analytics

    Examples: 
      | Services        | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Service | DealerCode |
      | ProductLink Web | Aide(EC4-14)                | Aide(EC4-14)              | Advisor(EC24-54)       | Onboard Analytics  | E250       |
      |                 |                             |                           |                        |                    | H160       |
      |                 |                             |                           |                        |                    | N030       |
      |                 |                             |                           |                        |                    | M610       |
      |                 |                             |                           |                        |                    | B330       |

  @CatProfile @US_161 @TC_ @Negative
  Scenario Outline: To Verify Subscription pricing values are not displayed for Onboard analytics Add on for VisionLink application as Cat login - #passed
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>,<Customer Level Subscription>,<Additional Services>"
    Then Verify in UI Subscription Pricing Values are not displayed at Onboard Analytics

    Examples: 
      | Services   | Customer Level Subscription | Additional Services | DealerCode |
      | VisionLink | Cat Basic - 10 Minutes      | Onboard Analytics   | E250       |
      |            |                             |                     | H160       |
      |            |                             |                     | N030       |
      |            |                             |                     | M610       |
      |            |                             |                     | B330       |

  #for dealer login Vl onboard analytics is not applicable
  @DealerProfile @US_161 @TC_ @Postitive
  Scenario Outline: To Verify Subscription Widget and its fields in DSP as Dealer Login
    When set Subscription details as "<Services>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    Then Verify in UI "SubscriptionPricingValue", "PromotionName","DiscountAmount", "ContractPeriodDropdown" and "AutoRenewCheckbox" options are displayed for all Subscriptions for supported "<Applications>"

    Examples: 
      | Services         | Dealer          | Customer       | Base Subscription      | Additional Services |
      | VisionLink       |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | My.Cat.Com       |                 |                | Cat Daily              |                     |
      |                  |                 |                |                        |                     |
      |                  |                 |                |                        |                     |

  @DealerProfile @US_161 @TC_ @Postitive
  Scenario Outline: To Verify Subscription pricing values for assets in DSP as Dealer Login
    When set Subscription details as "<Services>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    Then Verify in UI SubscriptionPricingValues for all Base and Add-on subscriptions are displayed for supported Applications
    And Verify the Subscription pricing values are matching with Zuora product catalog

    Examples: 
      | DealerCode | Device Type | Services         | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | E250       | PLE641      | VisionLink       |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | N030       |             | My.Cat.Com       |                           | Cat Daily                   |                     |
      | M610       |             |                  |                           |                             |                     |
      | B330       |             |                  |                           |                             |                     |

  @DealerProfile @US_161 @TC_ @Postitive
  Scenario Outline: To Verify Subscription pricing values for already subscribed assets as Dealer Login
    When set Subscription details as "<Services>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    Then Verify in UI SubscriptionPricingValues for already subscribed subscription are not displayed for supported "<Applications>"
    And Verify in UI SubscriptionPricingValues for the remanining subscriptions are displayed for supported "<Applications>"

    Examples: 
      | DealerCode | Device Type | Services         | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | E250       | PLE641      | VisionLink       |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | N030       |             | My.Cat.Com       |                           | Cat Daily                   | Cat Daily           |
      | M610       |             |                  |                           |                             |                     |
      | B330       |             |                  |                           |                             |                     |

  @DealerProfile @US_161 @TC_ @Postitive
  Scenario Outline: To verify Subscription pricing values for PLWEB application when inherited from Customer level in Dealer login
    When set Subscription details as "<Services>","<Customer Level Subscription>" inherited from customer level
    Then Verify in UI Subscription Pricing Values are displayed for all subscriptions at Dealer level only for PLWEB application alone

    Examples: 
      | Services        | Customer Level Subscription | DealerCode |
      | ProductLink WEB | Aide (EC4-14-T)             | E250       |
      |                 |                             | H160       |
      |                 |                             | N030       |
      |                 |                             | M610       |
      |                 |                             | B330       |

  @DealerProfile @US_161 @TC_319 @Positive
  Scenario Outline: To verify Subscription pricing values for VisionLink application as Dealer login
    When set Subscription details as "<Services>","<Customer Level Subscription>","<Additional Services>"
    Then Verify in UI Subscription Pricing values are displayed for all subscriptions at Customer level dropdown for VisionLink application alone

    Examples: 
      | Services   | Customer Level Subscription | Additional Services | DealerCode |
      | VisionLink | Cat Basic - 10 Minutes      | Onboard Analytics   | E250       |
      | VisionLinK |                             |                     | H160       |
      |            |                             |                     | N030       |
      |            |                             |                     | M610       |
      |            |                             |                     | B330       |

  @DealerProfile @US_161 @TC_321 @Postitive
  Scenario Outline: To verify Subscription pricing values for My.Cat.Com application as Dealer login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "<Services>","<Customer Level Subscription>"
    Then Verify in UI Subscription Pricing values are displayed for all subscriptions at Customer level dropdown for My.Cat.Com application alone

    Examples: 
      | Services   | Customer Level Subscription | DealerCode |
      | My.Cat.Com | Cat Daily                   | E250       |
      |            |                             | H160       |
      |            |                             | N030       |
      |            |                             | M610       |
      |            |                             | B330       |
      
        @CatProfile @US_161 @TC_526 @Negative
  Scenario Outline: To Verify Subscription pricing values are not displayed for Onboard analytics Add on for VisionLink application as Dealer login
    When Set in UI "<DealerCode>"
    And Set Subscription details as "<Services>,<Customer Level Subscription>,<Additional Services>"
    Then Verify in UI Subscription Pricing Values are not displayed at Onboard Analytics

    Examples: 
      | Services   | Customer Level Subscription | Additional Services | DealerCode |
      | VisionLink | Cat Basic - 10 Minutes      | Onboard Analytics   | E250       |
      |            |                             |                     | H160       |
      |            |                             |                     | N030       |
      |            |                             |                     | M610       |
      |            |                             |                     | B330       |
