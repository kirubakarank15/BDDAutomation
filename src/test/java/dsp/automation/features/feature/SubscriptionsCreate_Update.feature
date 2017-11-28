@API
Feature: Creation and Updation of All Inheritance Subscriptions for the OnboardedAsset
  This feature is to Validate Creation and Updation of All Inheritance Subscriptions for the OnboardedAsset

  ##CATLevelSubscription Create
  @CATLevelSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for the CATLevelSubscription
    Then Set CATLevelSubscription with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance |
      | null     | CAT  | CFV00150     | null   |    527 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT          |              201 | CatLevel    |

  @CATLevelSubscriptionDB
  Scenario Outline: Validate CATLevelSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##CATLevelSubscription Update
  @CATLevelSubscriptionUpdationAPI
  Scenario Outline: Delete CATLevel Subscription
    Then Delete CATLevelSubscription with "<cancelReason>","<level>","<Inheritance>","<ExpectedDeleteResponse>" endTime

    Examples: 
      | cancelReason | level | Inheritance | ExpectedDeleteResponse |
      | End of Term  | CAT   | CatLevel    |                    200 |

  @CATLevelSubscriptionDB @Positive
  Scenario Outline: Validate CATLevelSubscription cancelled for CAT Level in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##CustInheritedSubscription Create
  @CustInheritedSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for CustInheritedSubscription
    Then Set CustInheritedSubscription with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level    | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance   |
      | null     | CAT  | CFV00150     | null   |    527 | CUSTOMER | Owned     |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | CustInherited |
      |          | CAT  | CFV00150     | null   |    527 | Dealer   | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | CustInherited |
      |          | CAT  | CFV00150     | null   |    527 | CAT      | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT          |              201 | CustInherited |

  @CustInheritedSubscriptionDB
  Scenario Outline: Validate CustInheritedSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##CustInheritedSubscription Update
  @CustInheritedSubscriptionUpdationAPI
  Scenario Outline: Delete CustomerInheritedSubscription
    Then Delete CustInheritedSubscription with "<cancelReason>","<level>","<Inheritance>","<ExpectedDeleteResponse>" endTime

    Examples: 
      | cancelReason | level    | Inheritance   | ExpectedDeleteResponse |
      | End of Term  | Customer | CustInherited |                    500 |
      | End of Term  | Customer | CustInherited |                    200 |
      | End of Term  | CAT      | CustInherited |                    200 |
      | End of Term  | Dealer   | CustInherited |                    200 |
      | End of Term  | Customer | CustInherited |                    200 |

  @CustInheritedSubscriptionDB @Positive
  Scenario Outline: Validate CustomerInheritedSubscription cancelled for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##CustInheritedWithCatSubscription Create
  @CustInheritedWithCatCustLevelSubscriptioncreationAPI @Positive
  Scenario Outline: Validate Subscription is set for CustInheritedwithCATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription with startTime,endTime, "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance          |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned     |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | CustInheritedWithCat |
      |          | CFV00150     | CAT  | null   |    527 | Dealer   | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | CustInheritedWithCat |
      | null     | CFV00150     | CAT  | null   |    529 | CAT      | Owned     | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT          |              201 | CustInheritedWithCat |

  @CustInheritedWithCatSubscriptionDB @Positive
  Scenario Outline: Validate CustInheritedwithCATLevelSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #CustInheritedWithCatSubscription Update
  @CustInheritedWithCatSubscriptionUpdationAPI
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription
    Then Delete CustInheritedwithCATLevelSubscription with "<cancelReason>","<level>","<Inheritance>","<ExpectedDeleteResponse>" endTime

    Examples: 
      | cancelReason | level    | Inheritance          | ExpectedDeleteResponse |
      | End of Term  | Customer | CustInheritedWithCat |                    500 |
      | End of Term  | Customer | CustInheritedWithCat |                    200 |
      | End of Term  | CAT      | CustInheritedWithCat |                    200 |
      | End of Term  | Dealer   | CustInheritedWithCat |                    200 |
      | End of Term  | Customer | CustInheritedWithCat |                    200 |

  @CustInheritedWithCatSubscriptionDB
  Scenario Outline: Validate CustInheritedwithCATLevelSubscription Cancelled for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##DealerInheritedSubscription Create
  @DealerInheritedSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for DealerInheritedSubscription
    Then Set DealerInheritedSubscription with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime,"<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level  | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance     |
      | null     | CFV00150     | CAT  | null   |    527 | Dealer | Owned     | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | DealerInherited |
      |          | CFV00150     | CAT  | null   |    527 | CAT    | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT          |              201 | DealerInherited |

  @DealerInheritedSubscriptionDB @Positive
  Scenario Outline: Validate DealerInheritedSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##DealerInheritedSubscription Update
  @DealerInheritedSubscriptionUpdationAPI
  Scenario Outline: Delete DealerInherited Subscription
    Then Delete DealerInheritedSubscription with "<cancelReason>","<level>","<Inheritance>","<ExpectedDeleteResponse>" endTime

    Examples: 
      | cancelReason | level  | Inheritance     | ExpectedDeleteResponse |
      | End of Term  | Dealer | DealerInherited |                    500 |
      | End of Term  | Dealer | DealerInherited |                    200 |
      | End of Term  | CAT    | DealerInherited |                    200 |
      | End of Term  | Dealer | DealerInherited |                    200 |

  @DealerInheritedSubscriptionDB @Positive
  Scenario Outline: Validate DealerInheritedSubscription is set in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##DealerInheritedWithCustSubscription Create
  @DealerInheritedWithCustSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for DealerInheritedwithCustSubscription
    Then Set DealerInheritedwithCustSubscription with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime,"<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance             |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned     |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | DealerInheritedWithCust |
      | null     | CFV00150     | CAT  | null   |    529 | Dealer   | Owned     | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | DealerInheritedWithCust |
      |          | CFV00150     | CAT  | null   |    529 | CAT      | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT          |              201 | DealerInheritedWithCust |

  @DealerInheritedWithCustSubscriptionDB @Positive
  Scenario Outline: Validate DealerInheritedwithCustSubscription is set in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #DealerInheritedWithCustSubscription Updates
  @DealerInheritedWithCustCatLevelSubscriptionUpdationAPI @Positive
  Scenario Outline: Delete DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription with "<cancelReason>","<level>","<Inheritance>","<ExpectedDeleteResponse>" endTime

    Examples: 
      | cancelReason | level    | Inheritance             | ExpectedDeleteResponse |
      | End of Term  | Dealer   | DealerInheritedWithCust |                    500 |
      | End of Term  | Dealer   | DealerInheritedWithCust |                    200 |
      | End of Term  | CAT      | DealerInheritedWithCust |                    200 |
      | End of Term  | Dealer   | DealerInheritedWithCust |                    200 |
      | End of Term  | Customer | DealerInheritedWithCust |                    200 |

  @DealerInheritedWithCustSubscriptionDB @Positive
  Scenario Outline: Validate Subscriptions are set for the two Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##NonInheritedSubscription Create
  @NonInheritedSubscriptionSubscriptioncreationAPI
  Scenario Outline: Validate Subscription set for NonInheritedSubscription
    Then Set NonInheritedSubscription with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>","<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance  |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | NonInherited |
      | null     | CFV00150     | CAT  | null   |    511 | Dealer   | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | NonInherited |
      | null     | CFV00150     | CAT  | null   |    529 | CAT      | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT          |              201 | NonInherited |

  @NonInheritedSubscriptionDB @Positive
  Scenario Outline: Validate NonInheritedSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##NonInheritedSubscription Update
  @NonInheritedSubscriptionSubscriptionUpdationAPI
  Scenario Outline: Delete NonInheritedSubscription
    Then Delete NonInheritedSubscription with "<cancelReason>","<level>","<Inheritance>","<ExpectedDeleteResponse>" endTime

    Examples: 
      | cancelReason | level    | Inheritance  | ExpectedDeleteResponse |
      | End of Term  | Dealer   | NonInherited |                    200 |
      | End of Term  | CAT      | NonInherited |                    200 |
      | End of Term  | Customer | NonInherited |                    200 |

  @NonInheritedSubscriptionDB @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |
