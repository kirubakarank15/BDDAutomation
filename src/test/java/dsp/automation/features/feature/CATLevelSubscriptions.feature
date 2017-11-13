@API
Feature: Creating CATLevel Subscription for the OnboardedAsset
  This feature is to Validate creation of CATLevelsubscriptions for the OnboardedAsset

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscription is set for the CATLevelSubscription
    Then Set CATLevelSubscription for CATLevel with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" and retrive the ParentID

    Examples: 
      | parentId | make | serialNumber | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | CFV00150     | null   |    527 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CATLevelSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for CATLevelSubscription

    Examples: 
      | AssetId |
      |   50885 |
