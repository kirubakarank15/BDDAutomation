@US_163 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Contract Period and Automatic Renewal Options
  This feature is to Verify Contract Period, Automatic Renew functionality and its fields

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @CatProfile @US_163 @TC_527 @Postitive
  Scenario Outline: To Verify the UI position of ContractPeriod and AutoRenew Option in CAT login
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify in UI "ContractPeriod_dropdown.position", "AutoRenew_checkbox.position" is below the Promotion details
    And Verify in UI "ContractPeriod_dropdown.contains" the "<Values>"
    And Verify in UI "ContractPeriod_dropdown.value=No Contract" by default

    Examples: 
      | Dealercode | Values      |
      | B330       | No Contract |
      | E250       | 1 Year      |
      | H160       | 2 Year      |
      | N030       | 3 Year      |
      | M610       |             |

  @DealerProfile @US_163 @TC_529 @Positive
  Scenario Outline: To Verify the UI position of ContractPeriod and AutoRenew Option in Dealer login
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify in UI "ContractPeriod_dropdown.position", "AutoRenew_checkbox.position" is below the Promotion details
    And Verify in UI "ContractPeriod_dropdown.contains" the "<Values>"
    And Verify in UI "ContractPeriod_dropdown.value=No Contract" by default

    Examples: 
      | Dealercode | Values      |
      | B330       | No Contract |
      | E250       | 1 Year      |
      | H160       | 2 Year      |
      | N030       | 3 Year      |
      | M610       |             |

  @CatProfile @US_163 @TC_530 @Positive
  Scenario: To Verify the AutoRenew option is not enabled when No Contract period is selected in CAT Login
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And Verify in UI "ContractPeriod.dropdown=<value>"
    Then Verify in UI "AutoRenew_checkbox.selection=false"
      | value       |
      | No contract |

  @DealerProfile @US_163 @TC_531 @Positive
  Scenario: To Verify the AutoRenew option is not enabled when No Contract period is selected in Dealer Login
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And Verify in UI "ContractPeriod.dropdown=<value>"
    Then Verify in UI "AutoRenew_checkbox.selection=false"
      | value       |
      | No contract |

  @CatProfile @US_163 @TC_532 @Positive
  Scenario: To Verify the AutoRenew option is enabled when Contract Period is 1,2,3 years in CAT login
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And Verify in UI "ContractPeriod.dropdown=<value>"
    Then Verify in UI "AutoRenew_checkbox=Checked" by default after selecting Contract period as 1,2,3 years
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @DealerProfile @US_163 @TC_533 @Positive
  Scenario: To Verify  AutoRenew option is enabled when Contract Period is 1,2,3 years in Dealerlogin
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And Verify in UI "ContractPeriod.dropdown=<value>"
    And Verify in UI "AutoRenew_checkbox=Checked" by default after selecting Contract period as 1,2,3 years
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @CatProfile @US_163 @TC_534 @Positive
  Scenario: To Verify the AutoRenew functionality when the checkbox is unchecked in CAT login
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown=<value>"
    Then Verify in UI "AutoRenew_checkbox=Unchecked"
    And Verify in UI AutoRenewal is opted out
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @DealerProfile @US_163 @TC_535 @Positive
  Scenario: To Verify the AutoRenew functionality when the checkbox is unchecked in Dealer login
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown=<value>"
    Then Verify in UI "AutoRenew_checkbox=Unchecked"
    And Verify in UI AutoRenewal is opted out
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @CatProfile @US_163 @TC_614 @Positive
  Scenario: To Vefiry Contract Period and Auto renew option are not displayed when only CAT level subscription and Onboard Analytics is selected
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "S/N =<S/N>" in My Worklist Page
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Additional Services  =<Additional Services>"
    Then Verify in UI "ContractPeriod_dropdown.isDisplayed=false", "AutoRenew_checkbox.isDisplayed=true"
      | Services         | Cat           | Additional Services |
      | Product Link Web | Aide (EC4-14) | Onboard Analytics   |
      #whenever subscription is selected at cat level contract period and automatic renew options should not be displayed
