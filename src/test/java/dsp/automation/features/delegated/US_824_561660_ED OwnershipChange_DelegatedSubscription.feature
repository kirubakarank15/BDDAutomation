@2017B.2 @US_824 @US_561660 @DelegatedSubscription @EDOwnershipChange
Feature: Verify Delegated Subscription for EDOwnershipChange
  This Feature is to validate the creation and updation of Delegated Subscription for EDOwnershipChange

  ##Manual Execution
  ##EdOwnerShipChange for CustInheritedSubcription from CustLevel to Cust ,Dealer, CAT, DealerUser, CustUser
    @CatProfile @CustomerProfile @DealerProfile @EDOwnershipchangetoAllLevels @Positive
  Scenario Outline: Set CustInheritedSubscription for various Asset in DSP MyWorklist Page
    Given Onboard Asset in DSP
    And Enter Customer record with same UCID and different DCN
    When Set CustInheritedSubscription for "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
    Then Verify Subscription successfully set for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Validate AssetSubscription table "<S/N>" for Subscription  Creation
    And Validate AssetSubscriptionHistory Table "<S/N>" for Subscription Creation

    Examples: 
      | S/N       | Services       | Customerlevel       | Dealerlevel         | Catlevel            | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel    |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)        | Vital(EC1-4)        | Vital(EC1-4)        | Vital(EC1-4)         | Vital(EC1-4)        | Vital(EC1-4)        |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14 )      | Aide (EC4-14 )      | Aide (EC4-14 )      | Aide (EC4-14 )       | Aide (EC4-14 )      | Aide (EC4-14 )      |
      | RAM000212 | ProductLinkWeb | Advisor (EC24 - 54) | Advisor (EC24 - 54) | Advisor (EC24 - 54) | Advisor (EC24 - 54)  | Advisor (EC24 - 54) | Advisor (EC24 - 54) |

##remove Then action for all the cases
  Scenario Outline: Perform Delegation from Cust Level to Cust ,Dealer, CAT, DealerUser, CustUser
    Given Asset With UCID , DCN1 for "<S/N>"
    When Subscription delegated from Cust to Cust ,Dealer, CAT, DealerUser, CustUser
    Then Validate in PLWeb delegated subscription is viewed in Webview Assignment for the Delegated Customer
    And Validate AssetSubscription table "<S/N>" for CustInheritedSubscription, delegatedCustomer,delgatedDealer, delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate AssetSubscriptionHistory Table "<S/N>" for delegatedCustomer,delgatedDealer, delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer, delgatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription entry with Active Status

    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

  Scenario Outline: Perform ED Ownership Change from UCID1 , DCN1 to UCID1 , DCN2
    When EDOwnershipChange is perfomed for "<S/N>"
    Then Validate EDOwnership Changed from DCN1 to DCN2 in DSP UI
    And Validate in  AssetSubscription table "<S/N>" for CustInheritedSubscription,delegatedCustomer,delgatedDealer,delegatedCAT Subscription carry forward from DCN1 to DCN2
    And Validate in AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscription, DelegatedCustomer,delgatedDealer,delegatedCAT, Subscription carry forward from DCN1 to DCN2
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delgatedDealer,delegatedCAT Subscription with DCN1 with Cancelled Status
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscription,delegatedCustomer,delgatedDealer,delegatedCAT Subscription with DCN2 with Active Status
   

    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

  ##EdOwnerShipChange for DealerInheritedSubscriptionwithCust from Cust Level to Cust ,Dealer, CAT, DealerUser, CustUser 
  @CatProfile @CustomerProfile @DealerProfile @DealerInheritedSubscriptionWithCust @EDOwnershipchangetoAllLevels @Positive
  Scenario Outline: Set DealerInheritedSubscriptionWithCust for various Asset in DSP MyWorklist Page
    Given Onboard Asset in DSP
    And Enter Customer record with same UCID and different DCN
    When Set Subscription for "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
    Then Verify Subscription successfully set for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Validate AssetSubscription table "<S/N>" for Subscription Creation
    And Validate AssetSubscriptionHistory Table "<S/N>" for Subscription Creation

    Examples: 
      | S/N       | Services       | Customerlevel       | Dealerlevel           | Catlevel              | ExpectedCustomelevel | ExpectedDealerlevel   | ExpectedCatlevel      |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)        | Aide (EC4-14 )        | Aide (EC4-14 )        | Vital(EC1-4)         | Aide (EC4-14 )        | Aide (EC4-14 )        |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14 )      | Aide (EC4-14-T )      | Aide (EC4-14-T )      | Aide (EC4-14 )       | Aide (EC4-14-T )      | Aide (EC4-14-T )      |
      | RAM000212 | ProductLinkWeb | Advisor (EC24 - 54) | Advisor (EC24 - 54-T) | Advisor (EC24 - 54-T) | Advisor (EC24 - 54)  | Advisor (EC24 - 54-T) | Advisor (EC24 - 54-T) |

  Scenario Outline: Perform Delegation from Cust Level to Cust ,Dealer, CAT, DealerUser, CustUser 
    Given Asset With UCID , DCN1 for "<S/N>"
    When Subscription delegated from Dealer Level to Cust ,Dealer, CAT, DealerUser, CustUser 
    Then Validate in PLWeb delegated subscription is viewed in Webview Assignment for the Delegated Customer
    And Validate AssetSubscription table "<S/N>" for DealerInheritedSubscriptionwithCustSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate AssetSubscriptionHistory Table "<S/N>" for DealerInheritedSubscriptionwithCustSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscriptionDealerInheritedSubscriptionwithCustSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
  

    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

  Scenario Outline: Perform ED Ownership Change from UCID , DCN1 to UCID , DCN2
    When EDOwnershipChange is perfomed for "<S/N>"
    Then Validate EDOwnership Changed from DCN1 to DCN2 in DSP UI
    And Validate in AssetSubscription table "<S/N>" for DealerInheritedSubscriptionwithCust for CustLevel carry forward from DCN1 to DCN2
    And Validate in AssetSubscriptionHistory table "<S/N>" for DealerInheritedSubscriptionwithCust for CustLevel carry forward from DCN1 to DCN2
    And Validate in AssetSubscription table "<S/N>" DealerLevel, Catlevel Subscription remains unchanged
    And Validate in AssetSubscriptionHistory table "<S/N>" DealerLevel, Catlevel Subscription remains unchanged
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser with DCN1 with Cancelled Status
    And Validate Subscription Topic "<S/N>" for DealerInheritedWithCustSubscription,delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser with DCN2 with Active Status
    

    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

 
  ##EdOwnerShipChange for CustInheritedSubscriptionwithCAT from CustLevel to Cust ,Dealer, CAT, DealerUser, CustUser 
  @CatProfile @CustomerProfile @DealerProfile @CustInheritedSubscriptionwithCAT @EDOwnershipchangetoAllLevels @Positive
  Scenario Outline: Set CustInheritedSubscriptionWithCAT for various Asset in DSP MyWorklist Page
    Given Onboard Asset in DSP
    And Enter Customer record with same UCID and different DCN
    When Set CustInheritedSubscriptionWithCAT for "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
    Then Verify Subscription successfully set for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Validate AssetSubscription table "<S/N>" for Subscription Creation
    And Validate AssetSubscriptionHistory Table "<S/N>" for Subscription Creation

    Examples: 
      | S/N       | Services       | Customerlevel       | Dealerlevel         | Catlevel              | ExpectedCustomelevel | ExpectedDealerlevel | ExpectedCatlevel      |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)        | Vital(EC1-4)        | Aide (EC4-14 )        | Vital(EC1-4)         | Vital(EC1-4)        | Aide (EC4-14 )        |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14 )      | Aide (EC4-14 )      | Advisor (EC24 - 54)   | Aide (EC4-14 )       | Aide (EC4-14 )      | Advisor (EC24 - 54)   |
      | RAM000212 | ProductLinkWeb | Advisor (EC24 - 54) | Advisor (EC24 - 54) | Advisor (EC24 - 54-T) | Advisor (EC24 - 54)  | Advisor (EC24 - 54) | Advisor (EC24 - 54-T) |

  Scenario Outline: Perform Delegation from Cust Level to Cust ,Dealer, CAT, DealerUser, CustUser 
    Given Asset With UCID , DCN1 for "<S/N>"
    When Subscription delegated from Cust to Cust ,Dealer, CAT, DealerUser, CustUser
    Then Validate in PLWeb delegated subscription is viewed in Webview Assignment for the Delegated Customer
    And Validate AssetSubscription table "<S/N>" for CustInheritedSubscriptionwithCATSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate AssetSubscriptionHistory Table "<S/N>" for CustInheritedSubscriptionwithCATSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscriptionwithCATSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
 
    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |
# cust and Deleaer should carry forward from DCN 1 to DCN2, CAt should be untouched with ACtive Status only
# include DB Status withh Cancelled and Active 
  Scenario Outline: Perform ED Ownership Change from UCID , DCN1 to UCID , DCN2
    When EDOwnershipChange is perfomed for "<S/N>"
    Then Validate EDOwnership Changed from DCN1 to DCN2 in DSP UI
    And Validate in AssetSubscription table "<S/N>" for CustInheritedSubscriptionWithCAT for CustLevel, DealerLevel carry forward from DCN1 to DCN2
    And Validate in AssetSubscriptionHistory table "<S/N>" for CustInheritedSubscriptionWithCAT for CustLevel, DealerLevel carry forward from DCN1 to DCN2
    And Validate in AssetSubscription table "<S/N>" CustLevel, Dealerlevel Subscription remains unchanged
    And Validate in AssetSubscriptionHistory table "<S/N>" CustLevel, Dealerlevel Subscription remains unchanged
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscriptionWithCATSubscription,delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser with DCN1 with Cancelled Status
    And Validate Subscription Topic "<S/N>" for CustInheritedSubscriptionWithCATSubscription,delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser with DCN2 with Active Status
    
    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

   ##EdOwnerShipChange for NonInheritedSubscription from CustLevel to Cust ,Dealer, CAT, DealerUser, CustUser
  @CatProfile @CustomerProfile @DealerProfile @NonInheritedSusbcription @EDOwnershipchangetoAllLevels @Positive
  Scenario Outline: Set NonInheritedSubcription for various Asset in DSP MyWorklist Page
    Given Onboard Asset in DSP
    And Enter Customer record with same UCID and different DCN
    When Set NonInheritedSubscription for "<S/N>" ,"<Services>","<Customerlevel>", "<Dealerlevel>","<CatLevel>" in MyWorklistPage
    Then Verify Subscription successfully set for "<S/N>" ,"<Services>","<ExpectedCustomerlevel>", "<ExpectedDealerlevel>","<ExpectedCatLevel>" in MyWorklistPage
    And Validate AssetSubscription table "<S/N>" for Subscription Creation
    And Validate AssetSubscriptionHistory Table "<S/N>" for Subscription Creation

    Examples: 
      | S/N       | Services       | Customerlevel       | Dealerlevel          | Catlevel            | ExpectedCustomelevel | ExpectedDealerlevel  | ExpectedCatlevel     |
      | RAM000210 | ProductLinkWeb | Vital(EC1-4)        | Aide (EC4-14 )       | Aide (EC4-14-T )    | Vital(EC1-4)         | Aide (EC4-14 )       | Aide (EC4-14-T )     |
      | RAM000211 | ProductLinkWeb | Aide (EC4-14 )      | Aide (EC4-14-T )     | Advisor (EC24 - 54) | Aide (EC4-14 )       | Aide (EC4-14-T )     | Advisor (EC24 - 54)  |
      | RAM000212 | ProductLinkWeb | Advisor (EC24 - 54) | Advisor (EC24 - 104) | Advisor (EC24 -204  | Advisor (EC24 - 54)  | Advisor (EC24 - 104) | Advisor (EC24 - 204) |

  Scenario Outline: Perform Delegation from Cust Level to Cust ,Dealer, CAT, DealerUser, CustUser
    Given Asset With UCID , DCN1 for "<S/N>"
    When Subscription delegated from Cust to Cust ,Dealer, CAT, DealerUser, CustUser
    Then Validate in PLWeb delegated subscription is viewed in Webview Assignment for the Delegated Customer
    And Validate AssetSubscription table "<S/N>" for NonInheritedSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate AssetSubscriptionHistory Table "<S/N>" for NonInheritedSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription, delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser Subscription with Active Status
 

    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

# DB status should include
  Scenario Outline: Perform ED Ownership Change from UCID , DCN1 to UCID , DCN2
    When EDOwnershipChange is perfomed for "<S/N>"
    Then Validate EDOwnership Changed from DCN1 to DCN2 in DSP UI
    And Validate in AssetSubscription table "<S/N>" for NonInheritedSubscription for CustLevel carry forward from DCN1 to DCN2
    And Validate in AssetSubscriptionHistory table "<S/N>" for NonInheritedSubscription for CustLevel carry forward from DCN1 to DCN2
    And Validate in AssetSubscription table "<S/N>" Dealerlevel,CATLevel Subscription remains unchanged
    And Validate in AssetSubscriptionHistory table "<S/N>"  Dealerlevel,CATLevel Subscription remains unchanged
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser with DCN1 with Cancelled Status
    And Validate Subscription Topic "<S/N>" for NonInheritedSubscription,delegatedCustomer,delegatedDealer,delegatedCAT,delegatedDealerUser,delegatedCustUser with DCN2 with Active Status
    

    Examples: 
      | S/N       |
      | RAM000210 |
      | RAM000211 |
      | RAM000212 |

# repeat all cases for Different UCID's
 

  