@API
Feature: Creating Dealer Inherited Subscription in two Levels with NonInherited Customer Level Subscription
  This feature is to Validate creation of Dealer Inherited subscription in two Levels with Different Customer level subscription

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the Customer Level for DealerInheritedwithNonInheritedSubscription
    Then Set DealerInheritedwithNonInheritedSubscription for Customer Level with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the Dealer Level for DealerInheritedwithNonInheritedSubscription
    Then Set DealerInheritedwithNonInheritedSubscription for Dealer Level with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level  | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    529 | Dealer | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the CAT Level for DealerInheritedSubscription
    Then Set DealerInheritedwithNonInheritedSubscription for CAT Level with parentId,"<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>",startTime,endTime for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | make | serialNumber | siteId | typeId | level | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | CFV00150     | null   |    529 | CAT   | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database for DealerInheritedwithNonInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for DealerInheritedwithNonInheritedSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for DealerInheritedwithNonInheritedSubscription

    Examples: 
      | AssetId |
      |   50885 |
