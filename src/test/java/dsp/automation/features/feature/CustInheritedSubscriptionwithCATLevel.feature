@API
Feature: Creation and Updation of Customer Inherited Subscriptions with NonInherited CAT LevelSubscription
  This feature is to Validate Creation and Updation of Customer Inherited subscriptions with NonInherited CAT LevelSubscription

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the CustomerLevel for CustInheritedwithCATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription for Customer Level with startTime,endTime, "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" and retrive the ParentID

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the DealerLevel CustInheritedwithCATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription for Dealer Level with parentId,"<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>", "<organization>","<organizationType>", "<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>" ,"<billingtUserAccountId>",startTime,endTime

    Examples: 
      | make | serialNumber | siteId | typeId | level  | origin    | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | CAT  | CFV00150     | null   |    527 | Dealer | Inherited | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @RAssetIdegression @Positive
  Scenario Outline: Validate Subscription is set for the CATLevelSubscription
    Then Set CustInheritedwithCATLevelSubscription for CATLevel with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>", "<level>", "<origin>" , "<organization>" ,"<organizationType>" ,"<associatedOrganization>" , "<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>"

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    529 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CustInheritedwithCATLevelSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for CustInheritedwithCATLevelSubscription

    Examples: 
      | AssetId |
      |   50885 |

  #@Sanity @Regression @Negative
  #Scenario Outline: Delete CustInheritedSubscription without deleting the ChildLevel Subscription
  #  Then Delete CustInheritedSubscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #   | cancelReason | level |
  #   | End of Term  | Customer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription by deleting the CAT-ChildLevel Subscription
    Then Delete CustInheritedwithCATLevelSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription by deleting the Dealer-ChildLevel Subscription
    Then Delete CustInheritedwithCATLevelSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete CustInheritedwithCATLevelSubscription by deleting the Customer-Level Subscription
    Then Delete CustInheritedwithCATLevelSubscription for Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CancelledCustInheritedwithCATLevelSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for CancelledCustInheritedwithCATLevelSubscription

    Examples: 
      | AssetId |
      |   50885 |
