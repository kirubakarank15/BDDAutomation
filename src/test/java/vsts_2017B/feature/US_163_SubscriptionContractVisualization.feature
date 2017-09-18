@US_163 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Contract Period and Automatic Renewal Options
  This feature is to Verify Contract Period, Automatic Renew functionality and its fields

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "SerialNumber =<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "SerialNumber =<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |
      |              |
      |              |
      |              |
      |              |

  @CatProfile @US_163 @TC_527 @Postitive
  Scenario Outline: To Verify the UI position and values of ContractPeriod and AutoRenew Option in CAT login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI ContractPerioddropdown, AutoRenewcheckbox is below the Promotion details
    And Verify in UI ContractPeriod dropdown contains the "<Values>"
    And Verify in UI ContractPeriod dropdown value should be No Contract by default

    Examples: 
      | Dealercode | Values      | Services        | Cat          | Dealer       | Customer     | Base Subscription      | Additional Services |
      | B330       | No Contract | ProductLink Web | Aide(EC4-14) | Aide(EC4-14) | Aide(EC4-14) |                        |                     |
      | E250       | 1 Year      | VisionLink      |              |              |              | Cat Basic - 10 Minutes | Onbaord Analytics   |
      | H160       | 2 Year      | My.Cat.Com      |              |              |              | Cat Daily              |                     |
      | N030       | 3 Year      |                 |              |              |              |                        |                     |
      | M610       |             |                 |              |              |              |                        |                     |

  @CatProfile @US_163 @TC_530 @Positive
  Scenario Outline: To Verify the AutoRenew option is not enabled when No Contract period is selected in CAT Login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI AutoRenew option is not enabled when No Contract is selected

    Examples: 
      | Dealercode | Services        | Cat          | Dealer       | Customer     | Base Subscription      | Additional Services |
      | B330       | ProductLink Web | Aide(EC4-14) | Aide(EC4-14) | Aide(EC4-14) |                        |                     |
      | E250       | VisionLink      |              |              |              | Cat Basic - 10 Minutes | Onbaord Analytics   |
      | H160       | My.Cat.Com      |              |              |              | Cat Daily              |                     |
      | N030       |                 |              |              |              |                        |                     |
      | M610       |                 |              |              |              |                        |                     |

  @CatProfile @US_163 @TC_532 @Positive
  Scenario Outline: To Verify the AutoRenew option is enabled when Contract Period is 1,2,3 years in CAT login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    Then Verify in UI AutoRenew option is enabled by default for 1,2,3 years contract period

    Examples: 
      | Dealercode | Services        | Cat          | Dealer       | Customer     | Base Subscription      | Additional Services |
      | B330       | ProductLink Web | Aide(EC4-14) | Aide(EC4-14) | Aide(EC4-14) |                        |                     |
      | E250       | VisionLink      |              |              |              | Cat Basic - 10 Minutes | Onbaord Analytics   |
      | H160       | My.Cat.Com      |              |              |              | Cat Daily              |                     |
      | N030       |                 |              |              |              |                        |                     |
      | M610       |                 |              |              |              |                        |                     |

  @CatProfile @US_163 @TC_534 @Positive
  Scenario Outline: To Verify the AutoRenew functionality when the checkbox is unchecked in CAT login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And Uncheck the Autorenew checkbox after selecting Contract Period as "Value=<value>"
    And click "Review&Submit" button or link
    Then Verify in Payment Preview Popup AutoRenew option is Opted Out

    Examples: 
      | Dealercode | Services        | Cat          | Dealer       | Customer     | Base Subscription      | Additional Services | Value  |
      | B330       | ProductLink Web | Aide(EC4-14) | Aide(EC4-14) | Aide(EC4-14) |                        |                     | 1 year |
      | E250       | VisionLink      |              |              |              | Cat Basic - 10 Minutes | Onbaord Analytics   | 2 year |
      | H160       | My.Cat.Com      |              |              |              | Cat Daily              |                     | 3 year |
      | N030       |                 |              |              |              |                        |                     |        |
      | M610       |                 |              |              |              |                        |                     |        |

  @CatProfile @US_163 @TC_614 @Negative
  Scenario Outline: To Vefiry Contract Period and Auto renew option are not displayed when only CAT level subscription is selected
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>"
    Then Verify in UI ContractPeriod and AutoRenew options are not displayed

    Examples: 
      | Services         | Cat           | Additional Services |
      | Product Link Web | Aide (EC4-14) | Onboard Analytics   |

  @CatProfile @US_163 @TC_ @Neagtive
  Scenario Outline: To Verify Contract Period and Auto Renew option are not displayed when Onboard Analytics Add on for PLWEB is selected
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Additional Service=<Additional Service>"
    Then Verify in UI ContractPeriod and AutoRenew options are not displayed

    Examples: 
      | DealerCode | Services         | Cat          | Dealer       | Customer     | Additional Service                           |
      | B330       | Product Link web | Aide(EC4-14) | Aide(EC4-14) | Aide(EC4-14) | VisionLink Load and Cycle Project Monitoring |
      | E250       |                  |              |              |              |                                              |
      | H160       |                  |              |              |              |                                              |
      | N030       |                  |              |              |              |                                              |
      | M610       |                  |              |              |              |                                              |
