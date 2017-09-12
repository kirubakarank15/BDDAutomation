@US_163 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Contract Period and Automatic Renewal Options
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @CatProfile @US_163 @TC_527 @Postitive
  Scenario Outline: To Verify the UI position of ContractPeriod and AutoRenew Option in CAT login
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ContractPeriod_dropdown.position", "AutoRenew_checkbox.position" is below the Promotion details
    And Verify in UI "ContractPeriod_dropdown.contains" the "<Values>"
    And Verify in UI No Contract option has to be displayed by default

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
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify in UI "ContractPeriod_dropdown.position", "AutoRenew_checkbox.position" is below the Promotion details
    And Verify in UI "ContractPeriod_dropdown.contains" the "<Values>"
    And Verify in UI No Contract option has to be displayed by default

    Examples: 
      | Dealercode | Values      |
      | B330       | No Contract |
      | E250       | 1 Year      |
      | H160       | 2 Year      |
      | N030       | 3 Year      |
      | M610       |             |

  @CatProfile @US_163 @TC_530 @Positive
  Scenario: To Verify the AutoRenew option not selectable when No Contract period is selected in CAT Login
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown.value=No Contract"
    Then Verify in UI "AutoRenew_checkbox.selection=false"

  @DealerProfile @US_163 @TC_531 @Positive
  Scenario: To Verify the AutoRenew option not selectable when No Contract period is selected in Dealer Login
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown.value=No Contract"
    Then Verify in UI "AutoRenew_checkbox.selection=false"

  @CatProfile @US_163 @TC_532 @Positive
  Scenario: To Verify the AutoRenew option is selectable when Contract Period is 1,2,3 years in CAT login
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown.value=<value>"
    Then Verify in UI "AutoRenew_checkbox.selection=Checked"
    And Verify in UI "AutoRenew_checkbox.selection=true" by default after selecting Contract period as 1,2,3 years
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @DealerProfile @US_163 @TC_533 @Positive
  Scenario: To Verify  AutoRenew option is selectable when Contract Period is 1,2,3 years in Dealerlogin
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown.value=<value>"
    Then Verify in UI "AutoRenew_checkbox.selection=Checked"
    And Verify in UI "AutoRenew_checkbox.selection=Checked" by default after selecting Contract period as 1,2,3 years
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @CatProfile @US_163 @TC_534 @Positive
  Scenario: To Verify the AutoRenew option when the checkbox is unchecked in CAT login
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown.value=<value>"
    Then Verify in UI "AutoRenew_checkbox.selection=Unchecked"
    And Verify in UI AutoRenewal is opted out
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |

  @DealerProfile @US_163 @TC_535 @Positive
  Scenario: To Verify the AutoRenew option when the checkbox is unchecked in Dealer login
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    And Verify in UI "ContractPeriod_dropdown.value=<value>"
    Then Verify in UI "AutoRenew_checkbox.selection=Unchecked"
    And Verify in UI AutoRenewal is opted out
      | value  |
      | 1 year |
      | 2 year |
      | 3 year |
