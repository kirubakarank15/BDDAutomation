@API
Feature: Creation and Updation of Dealer Inherited Subscription in two Levels with no Customer Level Subscription
  This feature is to Validate Creation and Updation of Dealer Inherited subscription in two Levels

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

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete DealerInherited Subscription without deleting the ChildLevel Subscription
  #  Then Delete the Subscription for Dealer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #  | cancelReason | level |
  #  | End of Term  | Dealer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the CAT-ChildLevel Subscription
    Then Delete DealerInheritedSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg for DealerInherited Subscription

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the Dealer-ChildLevel Subscription
    Then Delete DealerInheritedSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg for DealerInherited Subscription

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the two Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CancelledDealerInheritedSubscription
    And Retrieve the Values of Subscription_id  "<AssetId>"in AssetSubscriptionHistory Table for CancelledDealerInheritedSubscription

    Examples: 
      | AssetId |
      |   50885 |
