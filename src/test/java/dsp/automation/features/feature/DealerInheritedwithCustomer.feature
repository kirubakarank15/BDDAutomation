@API
Feature: Creating Dealer Inherited Subscription in two Levels with NonInherited Customer Level Subscription
  This feature is to Validate creation of Dealer Inherited subscription in two Levels with Different Customer level subscription

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the Customer Level for DealerInheritedwithNonInheritedSubscription
    Then Set DealerInheritedwithNonInheritedSubscription for Customer Level with serialNumber,"<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | parentId | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the Dealer Level for DealerInheritedwithNonInheritedSubscription
    Then Set DealerInheritedwithNonInheritedSubscription for Dealer Level with serialNumber,"<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | parentId | make | siteId | typeId | level  | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    529 | Dealer | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the CAT Level for DealerInheritedSubscription
    Then Set DealerInheritedwithNonInheritedSubscription for CAT Level with serialNumber,parentId,"<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>",startTime,endTime for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | make | siteId | typeId | level | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | null   |    529 | CAT   | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database for DealerInheritedwithNonInheritedSubscription
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for DealerInheritedwithNonInheritedSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for DealerInheritedwithNonInheritedSubscription
