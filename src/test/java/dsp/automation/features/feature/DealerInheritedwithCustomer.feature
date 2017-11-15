@API
Feature: Creation and Updation of Dealer Inherited Subscription in two Levels with NonInherited Customer Level Subscription
  This feature is to Validate Creation and Updation of Dealer Inherited subscription in two Levels with Different Customer level subscription

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

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete DealerInherited Subscription without deleting the ChildLevel Subscription for DealerInheritedwithCustSubscription
  #  Then Delete DealerInheritedwithCustSubscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #  | cancelReason | level |
  #  | End of Term  | Customer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the CAT-ChildLevel Subscription for DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the Dealer-ChildLevel Subscription for DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete DealerInherited Subscription by deleting the Dealer-ChildLevel Subscription for DealerInheritedwithCustSubscription
    Then Delete DealerInheritedwithCustSubscription for Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the two Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CancelledDealerInheritedwithCustSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for CancelledDealerInheritedwithCustSubscription

    Examples: 
      | AssetId |
      |   50885 |
