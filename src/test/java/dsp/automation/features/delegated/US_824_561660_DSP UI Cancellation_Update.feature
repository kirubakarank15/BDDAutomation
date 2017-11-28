@2017B.2 @US_824 @US_561660 @DelegatedSubscription
Feature: Verify Delegated Subscription for Cancellation/Update from DSP UI
  This Feature is to validate Cancellation/Update of Delegated Subscriptions from DSP UI

  ##Manual Execution
  ##DSP UI Updation /Cancellation for Delegate Subscription for CustInheritedSubscription
  @CatProfile @CustomerProfile @DealerProfile @CustInheritedSubscriptionUpdate @Positive
  Scenario Outline: Validate Updation for CustomerlevelSubscription for Delegated Subscription
    Given CustInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel  | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)   | Vital(EC1-4)   | Vital(EC1-4)   |
      | E250       | RAM000211 | ProductLinkWeb | Aide (EC4-14 ) | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When CustInheritedSubscription "<DelegateFrom>" to Cust,dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Update CustInherited Subscription
    Then Validate AssetSubscription table "<S/N>" Updated for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" Updated for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" Updated for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | DelegateFrom | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | CustLevel    | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Aide (EC4-14 )       | Aide (EC4-14 )      | Aide (EC4-14 )   |
      | CustLevel    | RAM000211 | Active | Cancelled, Active | ProductLinkWeb | Aide (EC4-14-T )     | Aide (EC4-14-T )    | Aide (EC4-14-T ) |

  @CatProfile @CustomerProfile @DealerProfile @CustInheritedSubscriptionCancel @Positive
  Scenario Outline: Validate Cancellation for CustInheritedSubscription for Delegated Subscription
    When Cancel CustInherited Subscription
    Then Validate AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | S/N       | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
      | RAM000211 | Cancelled      | ProductLinkWeb | None                 | None                | None             |

  ##DSP UI Updation /Cancellation for Delegate Subscription for CustInheritedWithCat Subscription
  @CatProfile @CustomerProfile @DealerProfile @CustInheritedSubscriptionWithCatUpdate @Positive
  Scenario Outline: Validate Updation for CustInheritedWithCat Subscription for Delegated Subscription
    Given CustInheritedWithCat Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel  | Dealerlevel    | Catlevel            |
      | TD00       | RAM000210 | ProductLinkWeb | Vital(EC1-4)   | Vital(EC1-4)   | Aide (EC4-14 )      |
      | TD99       | RAM000211 | ProductLinkWeb | Aide (EC4-14 ) | Aide (EC4-14 ) | Advisor (EC24 - 54) |
    When CustInheritedWithCat Subscription "<DelegateFrom>" to Cust,dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Update CustInheritedWithCat Subscription
    Then Validate AssetSubscription table "<S/N>" Updated for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" Updated for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" Updated for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | DelegateFrom | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel     |
      | CustLevel    | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Aide (EC4-14 )       | Aide (EC4-14 )      | Aide (EC4-14-T )     |
      | CustLevel    | RAM000211 | Active | Cancelled, Active | ProductLinkWeb | Advisor (EC24 - 54)  | Advisor (EC24 - 54) | Advisor (EC24 - 104) |

  @CatProfile @CustomerProfile @DealerProfile @CustInheritedSubscriptionCancel @Positive
  Scenario Outline: Validate Cancellation for CustInheritedWithCat Subscription for Delegated Subscription
    When Cancel CustInheritedWithCat Subscription
    Then Validate AssetSubscription table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CustInheritedWithCatSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | S/N       | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
      | RAM000211 | Cancelled      | ProductLinkWeb | None                 | None                | None             |

  ##DSP UI Updation /Cancellation for Delegate Subscription for DealerInherited Subscription
  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedSubscriptionUpdate @Positive
  Scenario Outline: Validate Updation for DealerInherited Subscription for Delegated Subscription
    Given DealerInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb |               | Vital(EC1-4)   | Vital(EC1-4)   |
      | M610       | RAM000211 | ProductLinkWeb |               | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When DealerInheritedSubscription "<DelegateFrom>" to Cust,dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription table "<S/N>" for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Update DealerInherited Subscription
    Then Validate AssetSubscription table "<S/N>" Updated for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" Updated for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" Updated for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | DelegateFrom | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel     |
      | CustLevel    | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Aide (EC4-14 )       | Aide (EC4-14 )      | Aide (EC4-14-T )     |
      | CustLevel    | RAM000211 | Active | Cancelled, Active | ProductLinkWeb | Advisor (EC24 - 54)  | Advisor (EC24 - 54) | Advisor (EC24 - 104) |

  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedSubscriptionCancel @Positive
  Scenario Outline: Validate Cancellation for DealerInherited Subscription  for Delegated Subscription
    When Cancel DealerInherited Subscription
    Then Validate AssetSubscription table "<S/N>" for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | S/N       | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
      | RAM000211 | Cancelled      | ProductLinkWeb | None                 | None                | None             |

  ##DSP UI Updation /Cancellation for Delegate Subscription for DealerInheritedWithCust Subscription
  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedWithCustSubscriptionUpdate @Positive
  Scenario Outline: Validate Updation for DealerInheritedWithCust Subscription for Delegated Subscription
    Given DealerInheritedWithCust Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel    | Catlevel       |
      | TD00       | RAM000210 | ProductLinkWeb |               | Vital(EC1-4)   | Vital(EC1-4)   |
      | M610       | RAM000211 | ProductLinkWeb |               | Aide (EC4-14 ) | Aide (EC4-14 ) |
    When DealerInheritedWithCustSubscription "<DelegateFrom>" to Cust,dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Update DealerInheritedWithCustSubscription
    Then Validate AssetSubscription table "<S/N>" Updated for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" Updated for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" Updated for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | DelegateFrom | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel     |
      | CustLevel    | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Aide (EC4-14 )       | Aide (EC4-14 )      | Aide (EC4-14-T )     |
      | CustLevel    | RAM000211 | Active | Cancelled, Active | ProductLinkWeb | Advisor (EC24 - 54)  | Advisor (EC24 - 54) | Advisor (EC24 - 104) |

  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedWithCustSubscriptionCancel @Positive
  Scenario Outline: Validate Cancellation for DealerInheritedWithCustSubscription for Delegated Subscription
    When Cancel DealerInheritedWithCust Subscription
    Then Validate AssetSubscription table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | S/N       | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
      | RAM000211 | Cancelled      | ProductLinkWeb | None                 | None                | None             |

  ##DSP UI Updation /Cancellation for Delegate Subscription for CATLevel Subscription
  @CatProfile @CustomerProfile @DealerProfile @CATLevelSubscriptionUpdate @Positive
  Scenario Outline: Validate Updation for CATLevel Subscription for Delegated Subscription
    Given CATLevel Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel | Catlevel             |
      | TD00       | RAM000210 | ProductLinkWeb |               |             | Aide (EC4-14)        |
      | M610       | RAM000211 | ProductLinkWeb |               |             | Advisor (EC24 - 104) |
    When CATLevelSubscription "<DelegateFrom>" to Cust,dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription table "<S/N>" for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Update DealerInheritedWithCustSubscription
    Then Validate AssetSubscription table "<S/N>" Updated for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" Updated for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" Updated for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | DelegateFrom | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel    |
      | CustLevel    | RAM000210 | Active | Cancelled, Active | ProductLinkWeb |                      |                     | Aide (EC4-14-T )    |
      | CustLevel    | RAM000211 | Active | Cancelled, Active | ProductLinkWeb |                      |                     | Advisor (EC24 - 54) |

  @CatProfile @CustomerProfile @DealerProfile @CATLevelSubscriptionCancel @Positive
  Scenario Outline: Validate Cancellation for CATLevelSubscription for Delegated Subscription
    When Cancel CATLevel Subscription
    Then Validate AssetSubscription table "<S/N>" for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for CATLevelSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | S/N       | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
      | RAM000211 | Cancelled      | ProductLinkWeb | None                 | None                | None             |

  ##DSP UI Updation /Cancellation for Delegate Subscription for NonInherited Subscription
  @CatProfile @CustomerProfile @DealerProfile @NonInheritedSubscriptionUpdate @Positive
  Scenario Outline: Validate Updation for NonInherited Subscription for Delegated Subscription
    Given NonInherited Subscription set for "<Dealercode>", "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
      | Dealercode | S/N       | Services       | Customerlevel | Dealerlevel     | Catlevel             |
      | TD00       | RAM000210 | ProductLinkWeb | Aide (EC4-14) | Aide (EC4-14-T) | Advisor (EC24 - 54)  |
      | M610       | RAM000211 | ProductLinkWeb | Vital(EC1-4)  | Aide (EC4-14)   | Advisor (EC24 - 104) |
    When NonInheritedSubscription "<DelegateFrom>" to Cust,dealer,CAT,DealerUser,CustUser
    And Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<Status>"
    And Update NonInherited Subscription
    Then Validate AssetSubscription table "<S/N>" Updated for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" Updated for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" Updated for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | DelegateFrom | S/N       | Status | ExpectedStatus    | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel    |
      | CustLevel    | RAM000210 | Active | Cancelled, Active | ProductLinkWeb | Vital(EC1-4)         | Aide (EC4-14)       | Advisor (EC24 - 104 |
      | CustLevel    | RAM000211 | Active | Cancelled, Active | ProductLinkWeb | Aide (EC4-14)        | Aide (EC4-14-T)     | Advisor (EC24 - 54) |

  @CatProfile @CustomerProfile @DealerProfile @NonInheritedSubscriptionCancel @Positive
  Scenario Outline: Validate Cancellation for NonInheritedSubscription for Delegated Subscription
    When Cancel NonInherited Subscription
    Then Validate AssetSubscription table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCat,delegatedCustUser,delegatedDealerUser with "<ExpectedStatus>"
    And Validate the "<Services>", "<ExpectedCustomelevel>", "<ExpectedDealerlevel>", "<ExpectedCatlevel>"

    Examples: 
      | S/N       | ExpectedStatus | Services       | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel |
      | RAM000210 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
      | RAM000211 | Cancelled      | ProductLinkWeb | None                 | None                | None             |
