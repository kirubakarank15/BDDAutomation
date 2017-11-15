@API
Feature: Creation and Updation of CATLevel Subscription for the OnboardedAsset
  This feature is to Validate Creation and Updation of CATLevelsubscriptions for the OnboardedAsset

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

  @Sanity @Regression @Positive
  Scenario Outline: Delete CATLevel Subscription for CATLevel Subscription
    Then Delete CATLevelSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions cancelled for CAT Level in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CancelledCATLevelSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for CancelledCATLevelSubscription

    Examples: 
      | AssetId |
      |   50885 |
