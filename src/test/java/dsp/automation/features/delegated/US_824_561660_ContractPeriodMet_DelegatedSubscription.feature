@2017B.2 @US_824 @US_561660 @DelegatedSubscription @EDOwnershipChange
Feature: Verify Delegated Subscription for ContractPeriodMet
  This Feature is to validate ContractPeriodMet for Delegated Subscription

  ##Manual Execution
  ##ContractPeriodMet for Delegated Subscription for CustInheritedSubscription
  @CatProfile @CustomerProfile @DealerProfile @CustInheritedSubscription @AllDeviceTypes @Positive
  Scenario Outline: Validate for ContractPeriodMet for Delegated Subscription in CustInheritedSubscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" with "<AutoRenew>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel            | AutoRenew |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Vital(EC1-4)   | Vital(EC1-4)        | No        |
      | RAM000211 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Advisor (EC24 - 54) | Yes       |
    When Validate AssetSubscription Table for "<S/N>" for CustInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for CustInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for CustInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Subscription Delegated from DealerLevel to Cust,Dealer,CAT,DealerUser,CustUser
    And Update ContractPeriod for "<S/N>" for CurrentDate
    Then Validate AssetSubscription Table for "<S/N>" for CustInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for CustInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for CustInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Verify the ContractEndDate in CurrentTerms Popup for Active Subscription

    Examples: 
      | Status | S/N       | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel    |
      | Active | RAM000210 | Cancelled      | ProductLinkWeb | None                  | None                | None                |
      | Active | RAM000211 | Active         | ProductLinkWeb | Vital(EC1-4)          | Aide (EC4-14 )      | Advisor (EC24 - 54) |

  ##ContractPeriodMet for Delegated Subscription for DealerInheritedSubscription
  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedSubscription @AllDeviceTypes @Positive
  Scenario Outline: Validate for ContractPeriodMet for Delegated Subscription in DealerInheritedSubscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" with "<AutoRenew>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel      | AutoRenew |
      | RAM000210 | ProductLinkWeb |               | Aide (EC4-14 ) | Aide (EC4-14) | No        |
      | RAM000211 | ProductLinkWeb |               | Vital(EC1-4)   | Vital(EC1-4)  | Yes       |
    When Validate AssetSubscription Table for "<S/N>" for DealerInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for DealerInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for DealerInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Subscription Delegated from DealerLevel to Cust,Dealer,CAT,DealerUser,CustUser
    And Update ContractPeriod for "<S/N>" for CurrentDate
    Then Validate AssetSubscription Table for "<S/N>" for DealerInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for DealerInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for DealerInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Verify the ContractEndDate in CurrentTerms Popup for Active Subscription

    Examples: 
      | Status | S/N       | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | Active | RAM000210 | Cancelled      | ProductLinkWeb | None                  | None                | None             |
      | Active | RAM000211 | Active         | ProductLinkWeb |                       | Vital(EC1-4)        | Vital(EC1-4)     |

  ##ContractPeriodMet for Delegated Subscription for DealerInheritedWithCustSubscription
  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedWithCustSubscription @AllDeviceTypes @Positive
  Scenario Outline: Validate for ContractPeriodMet for Delegated Subscription in DealerInheritedWithCustSubscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" with "<AutoRenew>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel     | Catlevel        | AutoRenew |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14)   | Aide (EC4-14)   | No        |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14) | Aide (EC4-14-T) | Aide (EC4-14-T) | Yes       |
    When Validate AssetSubscription Table for "<S/N>" for DealerInheritedWithCustSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for DealerInheritedWithCustSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for DealerInheritedWithCustSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Subscription Delegated from DealerLevel to Cust,Dealer,CAT,DealerUser,CustUser
    And Update ContractPeriod for "<S/N>" for CurrentDate
    Then Validate AssetSubscription Table for "<S/N>" for DealerInheritedWithCustSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for DealerInheritedWithCustSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for DealerInheritedWithCustSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Verify the ContractEndDate in CurrentTerms Popup for Active Subscription

    Examples: 
      | Status | S/N       | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | Active | RAM000210 | Cancelled      | ProductLinkWeb | None                  | None                | None             |
      | Active | RAM000211 | Active         | ProductLinkWeb | Aide (EC4-14 )        | Aide (EC4-14-T)     | Aide (EC4-14-T)  |
 #Fix the test data
  ##ContractPeriodMet for Delegated Subscription for CustInheritedwithCatSubscription
  @CatProfile @CustomerProfile @DealerProfile @CustInheritedwithCatSubscription @AllDeviceTypes @Positive
  Scenario Outline: Validate for ContractPeriodMet for Delegated Subscription in CustInheritedwithCatSubscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" with "<AutoRenew>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel     | Catlevel        | AutoRenew |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Vital(EC1-4)   | Aide (EC4-14)   | No        |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14) | Aide (EC4-14-T) | Aide (EC4-14-T) | Yes       |
    When Validate AssetSubscription Table for "<S/N>" for CustInheritedwithCatSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for CustInheritedwithCatSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for CustInheritedwithCatSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Subscription Delegated from DealerLevel to Cust,Dealer,CAT,DealerUser,CustUser
    And Update ContractPeriod for "<S/N>" for CurrentDate
    Then Validate AssetSubscription Table for "<S/N>" for CustInheritedwithCatSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for CustInheritedwithCatSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for CustInheritedwithCatSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Verify the ContractEndDate in CurrentTerms Popup for Active Subscription

    Examples: 
      | Status | S/N       | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | Active | RAM000210 | Cancelled      | ProductLinkWeb | None                  | None                | Aide (EC4-14)             |
      | Active | RAM000211 | Active         | ProductLinkWeb | Aide (EC4-14 )        | Aide (EC4-14-T)     | Aide (EC4-14-T)  |
#Fix the cat level test data
  ##ContractPeriodMet for Delegated Subscription for NonInheritedSubscription
  @CatProfile @CustomerProfile @DealerProfile @CustInheritedwithCatSubscription @AllDeviceTypes @Positive
  Scenario Outline: Validate for ContractPeriodMet for Delegated Subscription in NonInheritedSubscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" with "<AutoRenew>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel     | Catlevel        | AutoRenew |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14)   | Aide (EC4-14-T)   | No        |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14) | Aide (EC4-14-T) | Aide (EC4-14-T) | Yes       |
    When Validate AssetSubscription Table for "<S/N>" for NonInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for NonInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for NonInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Subscription Delegated from DealerLevel to Cust,Dealer,CAT,DealerUser,CustUser
    And Update ContractPeriod for "<S/N>" for CurrentDate
    Then Validate AssetSubscription Table for "<S/N>" for NonInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for NonInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for NonInheritedSubscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Verify the ContractEndDate in CurrentTerms Popup for Active Subscription

    Examples: 
      | Status | S/N       | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | Active | RAM000210 | Cancelled      | ProductLinkWeb | None                  | None                | None             |
      | Active | RAM000211 | Active         | ProductLinkWeb | Aide (EC4-14 )        | Aide (EC4-14-T)     | Aide (EC4-14-T)  |
# keep test data as like delegated from CAT Level 