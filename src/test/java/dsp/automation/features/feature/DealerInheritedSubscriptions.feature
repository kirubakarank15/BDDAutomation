@API1
Feature: Creating Dealer Inherited Subscriptions in two Levels with no Customer Level Subscription
  This feature is to Validate creation of Dealer Inherited subscriptions in two Levels

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the Dealer Level for DealerInheritedSubscriptions
    Then Set the Subscription for Dealer Level with serialNumber,"<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime for DealerInheritedSubscriptions

    Examples: 
      | parentId | make | siteId | typeId | level  | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    527 | Dealer | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscriptions are set for the CAT Level for DealerInheritedSubscriptions
    Then Set the Subscription for CAT Level with serialNumber,parentId,"<make>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>",startTime,endTime for DealerInheritedSubscriptions

    Examples: 
      | make | siteId | typeId | level | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | null   |    527 | CAT   | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database for DealerInheritedSubscriptions
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for DealerInheritedSubscriptions
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for DealerInheritedSubscriptions

    
    
 