@API
Feature: Creating Dealer Inherited Subscription in two Levels with no Customer Level Subscription
  This feature is to Validate creation of Dealer Inherited subscription in two Levels

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the Dealer Level for DealerInheritedSubscription
    Then Set DealerInheritedSubscription for Dealer Level with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime for DealerInheritedSubscriptions

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level  | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    527 | Dealer | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the CAT Level for DealerInheritedSubscription
    Then Set DealerInheritedSubscription for CAT Level with parentId,"<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>",startTime,endTime for DealerInheritedSubscriptions

    Examples: 
      | make | serialNumber | siteId | typeId | level | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | CFV00150     | null   |    527 | CAT   | Inherited | CAT          | CAT              | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database for DealerInheritedSubscription
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for DealerInheritedSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for DealerInheritedSubscription

    Examples: 
      | AssetId |
      |   50885 |
