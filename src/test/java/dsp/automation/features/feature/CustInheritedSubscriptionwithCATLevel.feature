@API1
Feature: Creating Customer Inherited Subscriptions with NonInherited CAT LevelSubscription
  This feature is to Validate creation of Customer Inherited subscriptions with NonInherited CAT LevelSubscription

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the CustomerLevel for CustInheritedwithCATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription for Customer Level with serialNumber,startTime,endTime, "<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" and retrive the ParentID

    Examples: 
      | parentId | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the DealerLevel CustInheritedwithCATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription for Dealer Level with serialNumber,parentId,"<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime

    Examples: 
      | make | siteId | typeId | level  | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | null   |    527 | Dealer | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscription is set for the CATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription for CATLevel with serialNumber,startTime,endTime, "<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>"

    Examples: 
      | parentId | make | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    529 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CustInheritedwithCATLevelSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CustInheritedwithCATLevelSubscription
