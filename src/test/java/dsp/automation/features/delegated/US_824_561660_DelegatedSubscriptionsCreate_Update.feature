 @2017B.2 @US_824 @US_561660 @DelegatedSubscription
Feature: Creation and Updation of All Levels of Subscription and Delegations for the OnboardedAsset
  This feature is to Validate Creation and Updation All Levels of Subscription and Delegations for the OnboardedAsset

  ##CATLevelSubscription Creation , Delegation and Cancellation
  ##CATLevelSubscription Create
  @CATLevelSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for the CATLevelSubscription
    Then Set CATLevelSubscription with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance |
      | null     | CAT  | CFV00150     | null   |    527 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT          |              201 | CatLevel    |

  ##Validate CATLevelSubscription in DB
  @CATLevelSubscriptionDB
  Scenario Outline: Validate CATLevelSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #Delegate Subscription for CATLevelSubscription
  @CATLevelSubscriptioncreationAPI
  Scenario Outline: Validate delegated subscription is set from CAT to All Levels for CATLevelSubscription
    Then Set Delegation for CATLevelSubscription from CAT to AllLevels with startTime, endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedResponse>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level      | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | DelegatedFrom | DelegatedTo | Inheritance | ExpectedResponse |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969473160 | Customer         | CAT                    | CAT                        | 059956 |                123456 | CAT           | Customer    | CatLevel    |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | TD99         | Dealer           | CAT                    | CAT                        | 059956 |                123456 | CAT           | Dealer      | CatLevel    |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT           | CAT         | CatLevel    |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT           | CAT         | CatLevel    |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd003     | Individual       | CAT                    | CAT                        | 059956 |                123456 | CAT           | CustUser    | CatLevel    |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2505     | Individual       | CAT                    | CAT                        | 059956 |                123456 | CAT           | DealerUser  | CatLevel    |              201 |

  ##Validate Delegations for CATLevelSubscription in DB
  @CATLevelSubscriptionDB
  Scenario Outline: Validate Delegated Subscription set in Database for CATLevelSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Creation
  @CATLevelSubscriptionSubDTO
  Scenario Outline: To Validate the Subscriptions published in Subscription Topic
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATMode for serialNumber published with Active Status
    And Validate CATMode for serialNumber published with Cancelled Status
    And Validate CATLevelSubscription for CAT Level published with Active Status
    And Validate CATLevelSubscription from CAT delegated to Customer,Dealer,CustUser,DealerUser published with Active Status
    But Validate CATLevelSubscription for CAT Level should not be published in SubDTO for Delegation

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##CATLevelSubscription and Delegation Cancellation
  @CATLevelDelegatedSubCancelAPI
  Scenario Outline: Delete CATLevelSubscription and Delegations
    Then Delete CATLevelSubscription and Delegations for CATLevelSubscription with "<cancelReason>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedDeleteResponse>"endTime

    Examples: 
      | cancelReason | DelegatedFrom | DelegatedTo | Inheritance | ExpectedDeleteResponse |
      | End of Term  | CAT           |             | CatLevel    |                    500 |
      | End of Term  | CAT           | DealerUser  | CatLevel    |                    200 |
      | End of Term  | CAT           | CustUser    | CatLevel    |                    200 |
      | End of Term  | CAT           | Dealer      | CatLevel    |                    200 |
      | End of Term  | CAT           | Customer    | CatLevel    |                    200 |
      | End of Term  | CAT           |             | CatLevel    |                    200 |

  ##Validate CATMode in DB
  @CATLevelSubscriptionDB
  Scenario Outline: Validate Delegated and Parent Subscription Cancelled in Database for CATLevelSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Cancellation
  @CATLevelSubscriptionSubDTO
  Scenario Outline: To Validate the Subscriptions published in Subscription Topic
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATLevelSubscription for CAT Level published with Cancelled Status
    And Validate CustInheritedSubscription from CAT delegated to Customer,Dealer,CustUser,DealerUser published with Cancelled Status
    And Validate CATMode for serialNumber published with Active Status

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##Validate Provisioning Topic once
  ##CustInheritedSubscription Creation , Delegation and Cancellation
  ##CustInheritedSubscription Create
  @CustInheritedSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for CustInheritedSubscription
    Then Set CustInheritedSubscription with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level    | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance   |
      | null     | CAT  | CFV00150     | null   |    527 | CUSTOMER | Owned     |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | CustInherited |
      |          | CAT  | CFV00150     | null   |    527 | Dealer   | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | CustInherited |
      |          | CAT  | CFV00150     | null   |    527 | CAT      | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT          |              201 | CustInherited |

  ##Validate CustInheritedSubscription in DB
  @CustInheritedSubscriptionDB
  Scenario Outline: Validate CustInheritedSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #Delegate Subscription for CustInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedSubscription
  @CustInheritedSubscriptionDelegationcreationAPI
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedSubscription
    Then Set Delegation for CustInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedResponse>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level      | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | DelegatedFrom | DelegatedTo | Inheritance   | ExpectedResponse |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969481315 | Customer         |             2969473160 | Customer                   | 022225 | null                  | Customer      | Customer    | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | TD99         | Dealer           |             2969473160 | Customer                   | 059956 | null                  | Customer      | Dealer      | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | CAT         | CustInherited |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | CAT         | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd003     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | CustUser    | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2505     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | DealerUser  | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969476541 | Customer         | TD00                   | Dealer                     |  16345 | null                  | Dealer        | Customer    | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | N030         | Dealer           | TD00                   | Dealer                     | 059956 | null                  | Dealer        | Dealer      | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | daggupn      | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | CustInherited |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | daggupn      | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd004     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CustUser    | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2504     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | DealerUser  | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969479173 | Customer         | CAT                    | CAT                        |  00604 | null                  | CAT           | Customer    | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | M610         | Dealer           | CAT                    | CAT                        | 059956 | null                  | CAT           | Dealer      | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | CustInherited |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd001     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | CustUser    | CustInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | e250dlrauto3 | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | DealerUser  | CustInherited |              201 |

  ##Validate Delegations for CustInheritedSubscription in DB
  @CustInheritedSubscriptionDB
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table
    And Validate no record exists in DB for CAT Delegation

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Creation
  @CustInheritedSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATMode for serialNumber published with Active Status
    And Validate CATMode for serialNumber published with Cancelled Status
    And Validate CustInheritedSubscription for Customer,Dealer,CAT Level published with Active Status
    And Validate CustInheritedSubscription from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Active Status
    But Validate CustInheritedSubscription for CAT Level should not be published in SubDTO for Delegation

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##CustInheritedSubscription and Delegation Cancellation
  @CustInheritedSubscriptionCancelAPI
  Scenario Outline: Delete CustInheritedSubscription and Delegations
    Then Delete CustInheritedSubscription and Delegations for CustInheritedSubscription with "<cancelReason>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedDeleteResponse>"endTime

    Examples: 
      | cancelReason | DelegatedFrom | DelegatedTo | Inheritance   | ExpectedDeleteResponse |
      | End of Term  | Customer      |             | CustInherited |                    500 |
      | End of Term  | Customer      | DealerUser  | CustInherited |                    200 |
      | End of Term  | Customer      | CustUser    | CustInherited |                    200 |
      | End of Term  | Customer      | Dealer      | CustInherited |                    200 |
      | End of Term  | Customer      | Customer    | CustInherited |                    200 |
      | End of Term  | Customer      |             | CustInherited |                    200 |
      | End of Term  | Dealer        |             | CustInherited |                    500 |
      | End of Term  | Dealer        | DealerUser  | CustInherited |                    200 |
      | End of Term  | Dealer        | CustUser    | CustInherited |                    200 |
      | End of Term  | Dealer        | Dealer      | CustInherited |                    200 |
      | End of Term  | Dealer        | Customer    | CustInherited |                    200 |
      | End of Term  | Dealer        |             | CustInherited |                    200 |
      | End of Term  | CAT           |             | CustInherited |                    500 |
      | End of Term  | CAT           | DealerUser  | CustInherited |                    200 |
      | End of Term  | CAT           | CustUser    | CustInherited |                    200 |
      | End of Term  | CAT           | Dealer      | CustInherited |                    200 |
      | End of Term  | CAT           | Customer    | CustInherited |                    200 |
      | End of Term  | CAT           |             | CustInherited |                    200 |
      | End of Term  | Customer      |             | CustInherited |                    200 |

  ##Validate CATMode in DB
  @CustInheritedSubscriptionDB
  Scenario Outline: Validate delegated subscription Cancelled from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Cancellation
  @CustInheritedSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CustInheritedSubscription for Customer,Dealer,CAT Level published with Cancelled Status
    And Validate CustInheritedSubscription from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Cancelled Status
    And Validate CATMode for serialNumber published with Active Status

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##Validate Provisioning Topic once
  ##DealerInheritedSubscription Creation , Delegation and Cancellation
  ##DealerInheritedSubscription Create
  @DealerInheritedSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for DealerInheritedSubscription
    Then Set DealerInheritedSubscription with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime,"<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level  | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance     |
      | null     | CFV00150     | CAT  | null   |    527 | Dealer | Owned     | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | DealerInherited |
      |          | CFV00150     | CAT  | null   |    527 | CAT    | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT          |              201 | DealerInherited |

  #Validate DealerInheritedSubscription in DB
  @DealerInheritedSubscriptionDB
  Scenario Outline: Validate DealerInheritedSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #Delegate Subscription for DealerInheritedSubscription
  #Delegate Subscription for DealerInheritedSubscription from Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedSubscription
  @DealerInheritedSubscriptionDelegationcreationAPI
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedSubscription
    Then Set Delegation for DealerInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedResponse>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level      | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | DelegatedFrom | DelegatedTo | Inheritance     | ExpectedResponse |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969481315 | Customer         | TD00                   | Dealer                     | 022225 | null                  | Dealer        | Customer    | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | TD99         | Dealer           | TD00                   | Dealer                     | 059956 | null                  | Dealer        | Dealer      | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | madadl       | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | DealerInherited |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | madadl       | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd003     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CustUser    | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2504     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | DealerUser  | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969475766 | Customer         | CAT                    | CAT                        |  87609 | null                  | CAT           | Customer    | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | N030         | Dealer           | CAT                    | CAT                        | 059956 | null                  | CAT           | Dealer      | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | daggupn      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | DealerInherited |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | daggupn      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd004     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | CustUser    | DealerInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2505     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | DealerUser  | DealerInherited |              201 |

  ##Validate Delegations for DealerInheritedSubscription in DB
  @DealerInheritedSubscriptionDB
  Scenario Outline: Validate delegated subscription is set from Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table
    And Validate no record exists in DB for CAT Delegation

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Creation
  @DealerInheritedSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATMode for serialNumber published with Active Status
    And Validate CATMode for serialNumber published with Cancelled Status
    And Validate DealerInheritedSubscription for Dealer,CAT Level published with Active Status
    And Validate DealerInheritedSubscription from Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Active Status
    But Validate DealerInheritedSubscription for CAT Level should not be published in SubDTO for Delegation

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##DealerInheritedSubscription and Delegation Cancellation
  @DealerInheritedSubscriptionCancelAPI
  Scenario Outline: Delete DealerInheritedSubscription and Delegations
    Then Delete DealerInheritedSubscription and Delegations for DealerInheritedSubscription with "<cancelReason>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedDeleteResponse>"endTime

    Examples: 
      | cancelReason             | DelegatedFrom | DelegatedTo | Inheritance     | ExpectedDeleteResponse |
      | End of Term              | Dealer        |             | DealerInherited |                    500 |
      | Cust Product Transferred | Dealer        | DealerUser  | DealerInherited |                    200 |
      | Automatic downgrade      | Dealer        | CustUser    | DealerInherited |                    200 |
      | Automatic downgrade      | Dealer        | Dealer      | DealerInherited |                    200 |
      | Cust Product Transferred | Dealer        | Customer    | DealerInherited |                    200 |
      | End of Term              | Dealer        |             | DealerInherited |                    200 |
      | End of Term              | CAT           |             | DealerInherited |                    500 |
      | Cust Product Transferred | CAT           | DealerUser  | DealerInherited |                    200 |
      | Automatic downgrade      | CAT           | CustUser    | DealerInherited |                    200 |
      | Automatic downgrade      | CAT           | Dealer      | DealerInherited |                    200 |
      | Automatic downgrade      | CAT           | Customer    | DealerInherited |                    200 |
      | End of Term              | CAT           |             | DealerInherited |                    200 |
      | End of Term              | Dealer        |             | DealerInherited |                    200 |

  ##Validate CATMode in DB
  @DealerInheritedSubscriptionDB
  Scenario Outline: Validate delegated subscription Cancelled from Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  ##validate Subscription Topic for Cancellation
  @DealerInheritedSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate DealerInheritedSubscription for Dealer,CAT Level published with Cancelled Status
    And Validate DealerInheritedSubscription from Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Cancelled Status
    And Validate CATMode for serialNumber published with Active Status

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##Validate Provisioning Topic once
  ##CustInheritedWithCatSubscription Creation , Delegation and Cancellation
  ##CustInheritedWithCatSubscription Create
  @CustInheritedWithCatSubscriptioncreationAPI @Test
  Scenario Outline: Validate Subscription is set for CustInheritedwithCATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription with startTime,endTime, "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance          |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned     |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | CustInheritedWithCat |
      |          | CFV00150     | CAT  | null   |    527 | Dealer   | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | CustInheritedWithCat |
      | null     | CFV00150     | CAT  | null   |    529 | CAT      | Owned     | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT          |              201 | CustInheritedWithCat |

  #Validate CustInheritedWithCatSubscription in DB
  @CustInheritedWithCatSubscriptionDB @Test
  Scenario Outline: Validate CustInheritedwithCATLevelSubscription is set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #Delegate Subscription for CustInheritedWithCatSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedWithCatSubscription
  @CustInheritedWithCatSubscriptionDelegationcreationAPI @Test
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedSubscription
    Then Set Delegation for CustInheritedWithCatSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedResponse>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level      | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | DelegatedFrom | DelegatedTo | Inheritance          | ExpectedResponse |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969481315 | Customer         |             2969473160 | Customer                   | 022225 | null                  | Customer      | Customer    | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | TD99         | Dealer           |             2969473160 | Customer                   | 059956 | null                  | Customer      | Dealer      | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | daggupn      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | CAT         | CustInheritedWithCat |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | daggupn      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | CAT         | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd004     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | CustUser    | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2504     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | DealerUser  | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969479173 | Customer         | TD00                   | Dealer                     |  00604 | null                  | Dealer        | Customer    | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | M610         | Dealer           | TD00                   | Dealer                     | 059956 | null                  | Dealer        | Dealer      | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | madadl       | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | CustInheritedWithCat |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | madadl       | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd001     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CustUser    | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | e250dlrauto3 | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | DealerUser  | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Customer   | Delegated |   2969475766 | Customer         | CAT                    | CAT                        |  87609 | null                  | CAT           | Customer    | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Dealer     | Delegated | N030         | Dealer           | CAT                    | CAT                        | 059956 | null                  | CAT           | Dealer      | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | dariss       | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | CustInheritedWithCat |              500 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | dariss       | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | custd003     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | CustUser    | CustInheritedWithCat |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | azue2505     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | DealerUser  | CustInheritedWithCat |              201 |

  ##Validate Delegations for CustInheritedWithCatSubscription in DB
  @CustInheritedWithCatSubscriptionDB @Test
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedWithCatSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table
    And Validate no record exists in DB for CAT Delegation

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  ##validate Subscription Topic for Creation
  @CustInheritedWithCatSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATMode for serialNumber published with Active Status
    And Validate CATMode for serialNumber published with Cancelled Status
    And Validate CustInheritedWithCatSubscription for Customer,Dealer,CAT Level published with Active Status
    And Validate CustInheritedWithCatSubscription from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Active Status
    But Validate CustInheritedWithCatSubscription for CAT Level should not be published in SubDTO for Delegation

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##CustInheritedWithCatSubscription and Delegation Cancellation
  @CustInheritedSubscriptionCancelAPI
  Scenario Outline: Delete CustInheritedWithCatSubscription and Delegations
    Then Delete CustInheritedWithCatSubscription and Delegations for CustInheritedWithCatSubscription with "<cancelReason>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedDeleteResponse>"endTime

    Examples: 
      | cancelReason                   | DelegatedFrom | DelegatedTo | Inheritance          | ExpectedDeleteResponse |
      | End of Term                    | Customer      |             | CustInheritedWithCat |                    500 |
      | VisionLink store action failed | Customer      | DealerUser  | CustInheritedWithCat |                    200 |
      | Automatic downgrade            | Customer      | CustUser    | CustInheritedWithCat |                    200 |
      | End of Term                    | Customer      | Dealer      | CustInheritedWithCat |                    200 |
      | Cust Product Transferred       | Customer      | Customer    | CustInheritedWithCat |                    200 |
      | End of Term                    | Customer      |             | CustInheritedWithCat |                    200 |
      | End of Term                    | Dealer        |             | CustInheritedWithCat |                    500 |
      | VisionLink store action failed | Dealer        | DealerUser  | CustInheritedWithCat |                    200 |
      | Automatic downgrade            | Dealer        | CustUser    | CustInheritedWithCat |                    200 |
      | End of Term                    | Dealer        | Dealer      | CustInheritedWithCat |                    200 |
      | Cust Product Transferred       | Dealer        | Customer    | CustInheritedWithCat |                    200 |
      | End of Term                    | Dealer        |             | CustInheritedWithCat |                    200 |
      | End of Term                    | CAT           |             | CustInheritedWithCat |                    500 |
      | VisionLink store action failed | CAT           | DealerUser  | CustInheritedWithCat |                    200 |
      | Automatic downgrade            | CAT           | CustUser    | CustInheritedWithCat |                    200 |
      | End of Term                    | CAT           | Dealer      | CustInheritedWithCat |                    200 |
      | Cust Product Transferred       | CAT           | Customer    | CustInheritedWithCat |                    200 |
      | End of Term                    | CAT           |             | CustInheritedWithCat |                    200 |
      | End of Term                    | Customer      |             | CustInheritedWithCat |                    200 |

  ##Validate CATMode in DB
  @CustInheritedWithCatSubscriptionDB
  Scenario Outline: Validate delegated subscription Cancelled from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for CustInheritedWithCatSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  ##validate Subscription Topic for Cancellation
  @CustInheritedWithCatSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CustInheritedWithCatSubscription for Customer,Dealer,CAT Level published with Cancelled Status
    And Validate CustInheritedWithCatSubscription from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Cancelled Status
    And Validate CATMode for serialNumber published with Active Status

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##Validate Provisioning Topic
  ##DealerInheritedWithCustSubscription Creation , Delegation and Cancellation
  ##DealerInheritedWithCustSubscription Create
  @DealerInheritedWithCustSubscriptioncreationAPI
  Scenario Outline: Validate Subscription is set for DealerInheritedwithCustSubscription
    Then Set DealerInheritedwithCustSubscription with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime,"<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance             |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned     |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | DealerInheritedWithCust |
      | null     | CFV00150     | CAT  | null   |    529 | Dealer   | Owned     | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | DealerInheritedWithCust |
      |          | CFV00150     | CAT  | null   |    529 | CAT      | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT          |              201 | DealerInheritedWithCust |

  ##Validate DealerInheritedWithCustSubscription in DB
  @DealerInheritedWithCustSubscriptionDB
  Scenario Outline: Validate DealerInheritedwithCustSubscription is set in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  #Delegate Subscription for DealerInheritedWithCustSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedWithCustSubscription
  @DealerInheritedWithCustSubscriptionDelegationcreationAPI
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedWithCustSubscription
    Then Set Delegation for DealerInheritedWithCustSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedResponse>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level      | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | DelegatedFrom | DelegatedTo | Inheritance             | ExpectedResponse |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969481315 | Customer         |             2969473160 | Customer                   | 022225 | null                  | Customer      | Customer    | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | TD99         | Dealer           |             2969473160 | Customer                   | 059956 | null                  | Customer      | Dealer      | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | CAT         | DealerInheritedWithCust |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | krishd4      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | CAT         | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd003     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | CustUser    | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2505     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | DealerUser  | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Customer   | Delegated |   2969475766 | Customer         | TD00                   | Dealer                     |  87609 | null                  | Dealer        | Customer    | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Dealer     | Delegated | M610         | Dealer           | TD00                   | Dealer                     | 059956 | null                  | Dealer        | Dealer      | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | dagguppn     | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | DealerInheritedWithCust |              500 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | dagguppn     | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | custd001     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CustUser    | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | azue2504     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | DealerUser  | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Customer   | Delegated |   2969476541 | Customer         | CAT                    | CAT                        |  16345 | null                  | CAT           | Customer    | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Dealer     | Delegated | B330         | Dealer           | CAT                    | CAT                        | 059956 | null                  | CAT           | Dealer      | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | sundacr      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | DealerInheritedWithCust |              500 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | sundacr      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | custd004     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | CustUser    | DealerInheritedWithCust |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | e250dlrauto3 | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | DealerUser  | DealerInheritedWithCust |              201 |

  ##Validate Delegations for DealerInheritedWithCustSubscription in DB
  @DealerInheritedWithCustSubscriptionDB
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedWithCustSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table
    And Validate no record exists in DB for CAT Delegation

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Creation
  @DealerInheritedWithCustSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATMode for serialNumber published with Active Status
    And Validate CATMode for serialNumber published with Cancelled Status
    And Validate DealerInheritedWithCustSubscription for Customer,Dealer,CAT Level published with Active Status
    And Validate DealerInheritedWithCustSubscription from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Active Status
    But Validate DealerInheritedWithCustSubscription for CAT Level should not be published in SubDTO for Delegation

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##DealerInheritedWithCustSubscription and Delegation Cancellation
  @DealerInheritedWithCustSubscriptionCancelAPI
  Scenario Outline: Delete DealerInheritedWithCustSubscription and Delegations
    Then Delete DealerInheritedWithCustSubscription and Delegations for DealerInheritedWithCustSubscription with "<cancelReason>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedDeleteResponse>"endTime

    Examples: 
      | cancelReason                   | DelegatedFrom | DelegatedTo | Inheritance             | ExpectedDeleteResponse |
      | End of Term                    | Customer      |             | DealerInheritedWithCust |                    500 |
      | VisionLink store action failed | Customer      | DealerUser  | DealerInheritedWithCust |                    200 |
      | Automatic downgrade            | Customer      | CustUser    | DealerInheritedWithCust |                    200 |
      | End of Term                    | Customer      | Dealer      | DealerInheritedWithCust |                    200 |
      | Cust Product Transferred       | Customer      | Customer    | DealerInheritedWithCust |                    200 |
      | End of Term                    | Customer      |             | DealerInheritedWithCust |                    200 |
      | End of Term                    | Dealer        |             | DealerInheritedWithCust |                    500 |
      | VisionLink store action failed | Dealer        | DealerUser  | DealerInheritedWithCust |                    200 |
      | Automatic downgrade            | Dealer        | CustUser    | DealerInheritedWithCust |                    200 |
      | End of Term                    | Dealer        | Dealer      | DealerInheritedWithCust |                    200 |
      | Cust Product Transferred       | Dealer        | Customer    | DealerInheritedWithCust |                    200 |
      | End of Term                    | Dealer        |             | DealerInheritedWithCust |                    200 |
      | End of Term                    | CAT           |             | DealerInheritedWithCust |                    500 |
      | VisionLink store action failed | CAT           | DealerUser  | DealerInheritedWithCust |                    200 |
      | Automatic downgrade            | CAT           | CustUser    | DealerInheritedWithCust |                    200 |
      | End of Term                    | CAT           | Dealer      | DealerInheritedWithCust |                    200 |
      | Cust Product Transferred       | CAT           | Customer    | DealerInheritedWithCust |                    200 |
      | End of Term                    | CAT           |             | DealerInheritedWithCust |                    200 |
      | End of Term                    | Dealer        |             | DealerInheritedWithCust |                    200 |

  ##Validate CATMode in DB
  @DealerInheritedWithCustSubscriptionDB
  Scenario Outline: Validate delegated subscription Cancelled from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for DealerInheritedWithCustSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  #validate Subscription Topic for Cancellation
  @DealerInheritedWithCustCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate DealerInheritedWithCustSubscription  for Customer,Dealer,CAT Level published with Cancelled Status
    And Validate DealerInheritedWithCustSubscription  from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Cancelled Status
    And Validate CATMode for serialNumber published with Active Status

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##Validate in Provisioning Topic
  ##NonInheritedSubscription Creation , Delegation and Cancellation
  ##NonInheritedSubscription Create
  @NonInheritedSubscriptionSubscriptioncreationAPI
  Scenario Outline: Validate Subscription set for NonInheritedSubscription
    Then Set NonInheritedSubscription with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>","<dcn>","<billingtUserAccountId>","<RequestLevel>","<ExpectedResponse>","<Inheritance>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | RequestLevel | ExpectedResponse | Inheritance  |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  | Customer     |              201 | NonInherited |
      | null     | CFV00150     | CAT  | null   |    511 | Dealer   | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  | Dealer       |              201 | NonInherited |
      | null     | CFV00150     | CAT  | null   |    529 | CAT      | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 | CAT          |              201 | NonInherited |

  ## Validate NonInheritedSubscription in DB
  @NonInheritedSubscriptionDB
  Scenario Outline: Validate NonInheritedSubscription is set in Database
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Delegate Subscription for NonInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for NonInheritedSubscription
  @NonInheritedSubscriptionDelegationcreationAPI
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for NonInheritedSubscription
    Then Set Delegation for NonInheritedSubscription from Customer,Dealer and CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels with startTime, endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedResponse>"

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level      | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId | DelegatedFrom | DelegatedTo | Inheritance  | ExpectedResponse |
      |          | CAT  | CFV00150     | null   |    527 | Customer   | Delegated |   2969481315 | Customer         |             2969473160 | Customer                   | 022225 | null                  | Customer      | Customer    | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Dealer     | Delegated | TD99         | Dealer           |             2969473160 | Customer                   | 059956 | null                  | Customer      | Dealer      | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | ramaia1      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | Dealer      | NonInherited |              500 |
      |          | CAT  | CFV00150     | null   |    527 | CAT        | Delegated | ramaia1      | CAT              |             2969473160 | Customer                   | 059956 | null                  | Customer      | Dealer      | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | custd003     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | CustUser    | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    527 | Individual | Delegated | azue2505     | Individual       |             2969473160 | Customer                   | 059956 | null                  | Customer      | DealerUser  | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    511 | Customer   | Delegated |   2969479173 | Customer         | TD00                   | Dealer                     | 00604  | null                  | Dealer        | Customer    | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    511 | Dealer     | Delegated | B330         | Dealer           | TD00                   | Dealer                     | 059956 | null                  | Dealer        | Dealer      | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    511 | CAT        | Delegated | dariss       | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | NonInherited |              500 |
      |          | CAT  | CFV00150     | null   |    511 | CAT        | Delegated | dariss       | CAT              | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CAT         | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    511 | Individual | Delegated | custd004     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | CustUser    | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    511 | Individual | Delegated | azue2504     | Individual       | TD00                   | Dealer                     | 059956 | null                  | Dealer        | DealerUser  | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Customer   | Delegated |   2969475766 | Customer         | CAT                    | CAT                        | 87609 | null                  | CAT           | Customer    | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Dealer     | Delegated | H160         | Dealer           | CAT                    | CAT                        | 059956 | null                  | CAT           | Dealer      | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | daggupn      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | NonInherited |              500 |
      |          | CAT  | CFV00150     | null   |    529 | CAT        | Delegated | daggupn      | CAT              | CAT                    | CAT                        | 059956 | null                  | CAT           | CAT         | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | custd001     | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | CustUser    | NonInherited |              201 |
      |          | CAT  | CFV00150     | null   |    529 | Individual | Delegated | e250dlrauto3 | Individual       | CAT                    | CAT                        | 059956 | null                  | CAT           | DealerUser  | NonInherited |              201 |

  ##Validate Delegations for NonInheritedSubscription in DB
  @NonInheritedSubscriptionDB
  Scenario Outline: Validate delegated subscription is set from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for NonInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table
    And Validate no record exists in DB for CAT Delegation

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  ##validate Subscription Topic for Creation
  @NonInheritedSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate CATMode for serialNumber published with Active Status
    And Validate CATMode for serialNumber published with Cancelled Status
    And Validate NonInheritedSubscription for Customer,Dealer,CAT Level published with Active Status
    And Validate NonInheritedSubscription from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Active Status
    But Validate NonInheritedSubscription for CAT Level should not be published in SubDTO for Delegation

    Examples: 
      | serialNumber |
      | CFV00150     |

  ##NonInheritedSubscription and Delegation Cancellation
  @NonInheritedSubscriptionCancelAPI
  Scenario Outline: Delete NonInheritedSubscription and Delegations
    Then Delete NonInheritedSubscription and Delegations for NonInheritedSubscription with "<cancelReason>","<DelegatedFrom>","<DelegatedTo>","<Inheritance>","<ExpectedDeleteResponse>"endTime

    Examples: 
      | cancelReason                   | DelegatedFrom | DelegatedTo | Inheritance  | ExpectedDeleteResponse |
      | End of Term                    | Customer      |             | NonInherited |                    500 |
      | VisionLink store action failed | Customer      | DealerUser  | NonInherited |                    200 |
      | Automatic downgrade            | Customer      | CustUser    | NonInherited |                    200 |
      | End of Term                    | Customer      | Dealer      | NonInherited |                    200 |
      | Cust Product Transferred       | Customer      | Customer    | NonInherited |                    200 |
      | End of Term                    | Customer      |             | NonInherited |                    200 |
      | End of Term                    | Dealer        |             | NonInherited |                    500 |
      | VisionLink store action failed | Dealer        | DealerUser  | NonInherited |                    200 |
      | Automatic downgrade            | Dealer        | CustUser    | NonInherited |                    200 |
      | End of Term                    | Dealer        | Dealer      | NonInherited |                    200 |
      | Cust Product Transferred       | Dealer        | Customer    | NonInherited |                    200 |
      | End of Term                    | Dealer        |             | NonInherited |                    200 |
      | End of Term                    | CAT           |             | NonInherited |                    500 |
      | VisionLink store action failed | CAT           | DealerUser  | NonInherited |                    200 |
      | Automatic downgrade            | CAT           | CustUser    | NonInherited |                    200 |
      | End of Term                    | CAT           | Dealer      | NonInherited |                    200 |
      | Cust Product Transferred       | CAT           | Customer    | NonInherited |                    200 |
      | End of Term                    | CAT           |             | NonInherited |                    200 |

  ##Validate CATMode in DB
  @NonInheritedSubscriptionDB
  Scenario Outline: Validate delegated subscription Cancelled from Customer,Dealer,CAT to Customer,Dealer,CAT,CustUser and DealerUser Levels for NonInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscription Table
    And Retrieve the Values of Subscription_id "<AssetId>","<Sub_id>" in AssetSubscriptionHistory Table

    Examples: 
      | AssetId | Sub_id |
      |   50885 |    527 |

  ##Manual Validation
  ##validate Subscription Topic for Cancellation
  @NonInheritedSubscriptionCreationDelegationSubDTO
  Scenario Outline: To Validate the Subscriptions published in SubDTO
    Given Login to IntServiceBus
    When Search "<serialNumber>" in SubDTO
    Then Validate NonInheritedSubscription  for Customer,Dealer,CAT Level published with Cancelled Status
    And Validate NonInheritedSubscription  from Customer,Dealer,CAT delegated to Customer,Dealer,CustUser,DealerUser published with Cancelled Status
    And Validate CATMode for serialNumber published with Active Status

    Examples: 
      | serialNumber |
      | CFV00150     |
