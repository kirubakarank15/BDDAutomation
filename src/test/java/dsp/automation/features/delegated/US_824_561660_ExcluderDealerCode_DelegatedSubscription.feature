@2017B.2 @US_824 @US_561660 @DelegatedSubscription @EDOwnershipChange
Feature: Verify Delegated Subscription for ExcluderDealerCode Subscription
  This Feature is to validate the creation and updation of Delegated Subscription for ExcluderDealerCode Subscription

  ##Manual Execution
  ##Exclude CustLevel Subscription of CustInheritedSubscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCustLevelSubscription @LeastSubscription @higherSubscription @Positive
  Scenario Outline: Exclude CustomerlevelSubscription from CustInheritedSubscription
    Given CustInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel  | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)   | Vital(EC1-4)   | Vital(EC1-4)   |
      | TD00       | RAM000210 | ProductLinkWeb | Aide (EC4-14 ) | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When Subscription delegated from CustLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for Custlevel
    Then Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled         | ProductLinkWeb | None                 | None                | None             |
      | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Vital(EC1-4)         | Vital(EC1-4)        | Vital(EC1-4)     |

  ##Exclude DealerLevel Subscription of CustInheritedSubscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeDealerLevelSubscription @Positive
  Scenario Outline: Exclude DealerlevelSubscription from CustInheritedSubscription
    Given CustInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel  | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb | Aide (EC4-14 ) | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When Subscription delegated from DealerLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for DealerLevel
    Then Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Vital(EC1-4)         | Vital(EC1-4)        | Vital(EC1-4)     |

  ##Exclude CATLevel Subscription of CustInheritedSubscription[test for my observation as negative, where CAT level is independent of other Level impacts]
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCATLevelSubscription @Positive
  Scenario Outline: Exclude CATlevelSubscription from CustInheritedSubscription
    Given CustInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel  | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb | Aide (EC4-14 ) | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When Subscription delegated from CATLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CATLevel
    Then Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                 | None                | None             |

  ##Exclude CustLevel Subscription of DealerInheritedWithCust Subscription[ need to Check with Vivek ]
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCustLevelSubscription @Positive
  Scenario Outline: Exclude CustlevelSubscription from DealerInheritedWithCust Subscription
    Given DealerInheritedWithCust Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When Subscription delegated from CustLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CustLevel
    Then Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate DealerLevel, CATLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                 | Aide (EC4-14 )      | Aide (EC4-14 )   |

  ##Exclude DealerLevel Subscription of DealerInheritedWithCust Subscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeDealerLevelSubscription @Positive
  Scenario Outline: Exclude DealerlevelSubscription from DealerInheritedWithCust Subscription
    Given DealerInheritedWithCust Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel      | Catlevel         |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14-T ) | Aide (EC4-14-T ) |
    When Subscription delegated from DealerLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for DealerLevel
    Then Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region
# [ move to Vitals] - review Comment Fixed
    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | Vital(EC1-4)                  | Vital(EC1-4)                 | Vital(EC1-4)              |

  ##Exclude CATLevel Subscription of DealerInheritedWithCust Subscription[Keep for Observation]
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCatLevelSubscription @Positive
  Scenario Outline: Exclude CATlevelSubscription from DealerInheritedWithCust Subscription
    Given DealerInheritedWithCust Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel      | Catlevel         |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14-T ) | Aide (EC4-14-T ) |
    When Subscription delegated from CATLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CATLevel
    Then Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate CustLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | Vital(EC1-4)         | None                | None             |

  ##Exclude CustLevel Subscription of CustInheritedWithCat Subscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCustLevelSubscription @Positive
  Scenario Outline: Exclude CustlevelSubscription from CustInheritedWithCat Subscription
    Given CustInheritedWithCat Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel  | Catlevel         |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Vital(EC1-4) | Aide (EC4-14-T ) |
    When Subscription delegated from CustLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CustLevel
    Then Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate CATLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                 | None                | Aide (EC4-14-T ) |

  ##Exclude DealerLevel Subscription of CustInheritedWithCat Subscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeDealerLevelSubscription @Positive
  Scenario Outline: Exclude DealerlevelSubscription from CustInheritedWithCat Subscription
    Given CustInheritedWithCat Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel  | Catlevel         |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Vital(EC1-4) | Aide (EC4-14-T ) |
    When Subscription delegated from DealerLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for DealerLevel
    Then Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate CATLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                 | None                | Aide (EC4-14-T ) |

  ##Exclude CATLevel Subscription of CustInheritedWithCat Subscription [ check for my case]
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCATLevelSubscription @Positive
  Scenario Outline: Exclude CATlevelSubscription from CustInheritedWithCat Subscription
    Given CustInheritedWithCat Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel  | Catlevel         |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Vital(EC1-4) | Aide (EC4-14-T ) |
    When Subscription delegated from CATLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CATLevel
    Then Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate CustLevel, DealerLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | Vital(EC1-4)         | Vital(EC1-4)        | None             |

  ##Exclude CustLevel Subscription of NonInherited Subscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCustLevelSubscription @Positive
  Scenario Outline: Exclude CustLevelSubscription from NonInheritedSubscription
    Given NonInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel            |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14 ) | Advisor (EC24 - 54) |
    When Subscription delegated from CustLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CustLevel
    Then Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate DealerLevel,CatLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel    |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                 | Aide (EC4-14 )      | Advisor (EC24 - 54) |

  ##Exclude DealerLevel Subscription of NonInherited Subscription
  @CatProfile @CustomerProfile @DealerProfile @ExcludeDealerLevelSubscription @Positive
  Scenario Outline: Exclude DealerlevelSubscription from NonInheritedSubscription
    Given NonInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel      | Catlevel            |
      | TD00       | RAM000210 | ProductLinkWeb | Aide (EC4-14) | Aide (EC4-14 -T) | Advisor (EC24 - 54) |
    When Subscription delegated from DealerLevel to Cust,dealer,CAT,DealerUser, CustUser
    And Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for DealerLevel
    Then Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate DealerLevel,CatLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel    |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | None                 | None                | Advisor (EC24 - 54) |

  ##Exclude CATLevel Subscription of NonInherited Subscription [ my check]
  @CatProfile @CustomerProfile @DealerProfile @ExcludeCATLevelSubscription @Positive
  Scenario Outline: Exclude CATlevelSubscription from NonInheritedSubscription
    Given NonInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel      | Catlevel            |
      | TD00       | RAM000210 | ProductLinkWeb | Aide (EC4-14) | Aide (EC4-14 -T) | Advisor (EC24 - 54) |
    When Subscription delegated from CATLevel to Cust,dealer,CAT,DealerUser, CustUser
    Then Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Exclude DealercodeSubscription for CATLevel
    Then Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"
    And Validate DealerLevel,CatLevel Subscriptions remains unchanged
    And Validate "<S/N>" Moved to Subscription No Longer Available for this region

    Examples: 
      | S/N       | Status | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Active | Cancelled      | ProductLinkWeb | Aide (EC4-14)        | Aide (EC4-14-T)     | None             |
