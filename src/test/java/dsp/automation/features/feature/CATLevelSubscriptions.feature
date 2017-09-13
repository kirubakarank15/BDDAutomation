@API
Feature: Creating CATLevel Subscription for the OnboardedAsset
  This feature is to Validate creation of CATLevelsubscriptions for the OnboardedAsset

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscription is set for the CATLevelSubscription
    Then Set the Subscription for CATLevel with serialNumber,startTime,endTime, "<parentId>","<make>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" and retrive the ParentID

    Examples: 
      | parentId | make | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    527 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for CATLevelSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for CATLevelSubscription
