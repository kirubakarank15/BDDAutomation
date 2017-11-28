@2017B.2 @US_824 @US_561660 @DelegatedSubscription @TUDRScenario
Feature: Verify Delegated Subscription for TUDRScenario
  This Feature is to validate TUDRScenario for Delegated Subscription

  ##Manual Execution
  ##TransferScenario for Delegated Subscription
  @CatProfile @CustomerProfile @DealerProfile @Subscriptions @AllDeviceTypes @Delegationlevel @Positive
  Scenario Outline: Validate Transfer Scenario for Delegated Subscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel            |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Advisor (EC24 - 54) |
    When Subscription "<DelegatedFrom>" to Cust,Dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Perform Transfer of Device
    Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage

    Examples: 
      | DelegatedFrom | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | CustLevel     | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                  | None                | None             |

  ##Replacement Scenario for Delegated Subscription for CompatibleSubscriptions
  @CatProfile @CustomerProfile @DealerProfile @CompatibleSubscription @AllDeviceTypes @Delegationlevel @Positive
  Scenario Outline: Validate Replacement Scenario for Delegated Subscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel            |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Advisor (EC24 - 54) |
    When Subscription "<DelegatedFrom>" to Cust,Dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Perform Replacement of Device
    Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage

    Examples: 
      | DelegatedFrom | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel    |
      | CustLevel     | RAM000210 | Active | Active         | ProductLinkWeb | Vital(EC1-4)          | Aide (EC4-14 )      | Advisor (EC24 - 54) |

  #similiar to Downgrade or upgrade , based on Venkat's Comment, commenting this case - REVIEW COMMENT FIXED
  ##Replacement Scenario for Delegated Subscription for NonCompatibleSubscriptions
  #@CatProfile @CustomerProfile @DealerProfile @NonCompatibleSubscription @AllDeviceTypes @Delegationlevel @Positive
  #Scenario Outline: Validate Replacement Scenario for Delegated Subscription
  #Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
  #| S/N       | Services       | Customerlevel  | Dealerlevel    | Catlevel       |
  #| RAM000210 | ProductLinkWeb | Aide (EC4-14 ) | Aide (EC4-14 ) | Aide (EC4-14 ) |
  #| RAM000211 | ProductLinkWeb | Vital(EC1-4)   | Vital(EC1-4)   | Vital(EC1-4)   |
  #When Subscription "<DelegatedFrom>" to Cust,Dealer,CAT,DealerUser,CustUser
  #And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
  #And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
  #And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
  #And Perform Replacement of Device
  #Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
  #And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
  #And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
  #And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
  #
  #Examples:
  #| DelegatedFrom | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
  #| CustLevel     | RAM000210 | Active | Active         | ProductLinkWeb | Vital(EC1-4)          | Vital(EC1-4)        | Vital(EC1-4)     |
  #| DealerLevel   | RAM000211 | Active | Cancelled      | ProductLinkWeb | None                  | None                | None             |
  
  ## REVIEW COMMENT FIXED
  ##Upgrade Scenario for Delegated Subscription for CompatibleSubscriptions
   @CatProfile @CustomerProfile @DealerProfile @CompatibleSubscription @AllDeviceTypes @Delegationlevel @Positive
  Scenario Outline: Validate Upgrade Scenario for Delegated Subscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel            |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Advisor (EC24 - 54) |
      | RAM000211 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Aide (EC4-14 )      |
    When Subscription "<DelegatedFrom>" to Cust,Dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Perform Upgrade of Device
    Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage

    Examples: 
      | DelegatedFrom | S/N       | Status | ExpectedStatus   | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel    |
      | CATLevel      | RAM000210 | Active | Cancelled,Active | ProductLinkWeb | Vital(EC1-4)          | Aide (EC4-14 )      | Advisor (EC24 - 54) |
      | CustLevel     | RAM000210 | Active | Cancelled,Active | ProductLinkWeb | Vital(EC1-4)          | Aide (EC4-14 )      | Aide (EC4-14 )      |

  ## REVIEW COMMENT FIXED
  ##Upgrade Scenario for Delegated Subscription for NonCompatibleSubscriptions
  @CatProfile @CustomerProfile @DealerProfile @CompatibleSubscription @AllDeviceTypes @AllDelegationlevel @Positive
  Scenario Outline: Validate Upgrade Scenario for Delegated Subscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | S/N       | Services       | Customerlevel       | Dealerlevel         | Catlevel            |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)        | Aide (EC4-14 )      | Advisor (EC24 - 54) |
      | RAM000211 | ProductLinkWeb | Advisor (EC24 - 54) | Advisor (EC24 - 54) | Advisor (EC24 - 54) |
    When Subscription "<DelegatedFrom>" Cust to Cust,Dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Perform Upgrade of Device
    Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage

    Examples: 
      | DelegatedFrom | S/N       | Status | ExpectedStatus   | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | CustLevel     | RAM000210 | Active | Cancelled        | ProductLinkWeb | None                  | Vital(EC1-4)        | Vital(EC1-4)     |
      | DealerLevel   | RAM000210 | Active | Cancelled,Active | ProductLinkWeb | Aide (EC4-14 )        | Aide (EC4-14 )      | Aide (EC4-14 )   |

  ## REVIEW COMMENT FIXED
  ##Downgrade Scenario for Delegated Subscription for CompatibleSubscriptions
  @CatProfile @CustomerProfile @DealerProfile @CompatibleSubscription @AllDeviceTypes @AllDelegationlevel @Positive
  Scenario Outline: Validate Downgrade Scenario for Delegated Subscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel            |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Advisor (EC24 - 54) |
      | RAM000211 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Aide (EC4-14 )      |
    When Subscription "<DelegatedFrom>" to Cust,Dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Perform Downgrade of Device
    Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage

    Examples: 
      | DelegatedFrom | S/N       | Status | ExpectedStatus   | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel    |
      | CustLevel     | RAM000210 | Active | Active           | ProductLinkWeb | Vital(EC1-4)          | Aide (EC4-14 )      | Advisor (EC24 - 54) |
      | DealerLevel   | RAM000210 | Active | Cancelled,Active | ProductLinkWeb | Vital(EC1-4)          | Aide (EC4-14 )      | Aide (EC4-14 )      |

  ## REVIEW COMMENT FIXED
  ##Downgrade Scenario for Delegated Subscription for NonCompatibleSubscriptions
  @CatProfile @CustomerProfile @DealerProfile @CompatibleSubscription @AllDeviceTypes @AllDelegationlevel @Positive
  Scenario Outline: Validate Downgrade Scenario for Delegated Subscription
    Given Existing Asset with "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | S/N       | Services       | Customerlevel       | Dealerlevel         | Catlevel            |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)        | Aide (EC4-14 )      | Advisor (EC24 - 54) |
      | RAM000211 | ProductLinkWeb | Advisor (EC24 - 54) | Advisor (EC24 - 54) | Advisor (EC24 - 54) |
    When Subscription "<DelegatedFrom>"to Cust,Dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Perform Downgrade of Device
    Then Validate AssetSubscription Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic for "<S/N>" for Subscription,delegatedCust,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Verify Subscription for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage

    Examples: 
      | DelegatedFrom | S/N       | Status | ExpectedStatus   | Services       | ExpectedCustomerlevel | ExpectedDealerlevel | ExpectedCatLevel |
      | CustLevel     | RAM000210 | Active | Cancelled        | ProductLinkWeb | None                  | Vital(EC1-4)        | Vital(EC1-4)     |
      | CustLevel     | RAM000210 | Active | Cancelled,Active | ProductLinkWeb | Aide (EC4-14 )        | Aide (EC4-14 )      | Aide (EC4-14 )   |
