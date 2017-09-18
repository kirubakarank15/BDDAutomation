@API
Feature: Creating Customer Inherited Subscriptions in all Levels
  This feature is to Validate creation of Customer Inherited subscriptions in all Levels

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the CustomerLevel for CustInheritedSubscription
    Then Set CustInheritedSubscription for Customer Level with serialNumber,startTime,endTime, "<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" and retrive the ParentID

    Examples: 
      | parentId | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the DealerLevel CustInheritedSubscription
    Then Set CustInheritedSubscription for Dealer Level with serialNumber,parentId,"<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime

    Examples: 
      | make | siteId | typeId | level  | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | null   |    527 | Dealer | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the CATLevel CustInheritedSubscription
    Then Set CustInheritedSubscription for CAT Level with serialNumber,parentId,"<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>",startTime,endTime

    Examples: 
      | make | siteId | typeId | level | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | null   |    527 | CAT   | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CustInheritedSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CustInheritedSubscription
