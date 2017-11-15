@API
Feature: Creation and Updation of NonInherited Subscriptions in all Levels
  This feature is to Validate Creation and Updation of NonInherited subscriptions in all Levels

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscription set for the Customer Level for NonInheritedsubscription
    Then Set NonInheritedsubscription for Customer Level with startTime,endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>","<dcn>","<billingtUserAccountId>" for CustomerLevel

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscription set for the Dealer Level for NonInherited subscriptions
    Then Set NonInheritedsubscription Dealer Level with "<parentId>","<make>","<serialNumber>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>","<dcn>","<billingtUserAccountId>",startTime,endTime for Dealerlevel

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level  | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    511 | Dealer | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscription set for the CAT Level for NonInherited subscriptions
    Then Set NonInheritedsubscription CATLevel with endTime,"<parentId>","<make>","<serialNumber>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" for CATLevel

    Examples: 
      | parentId | serialNumber | make | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CFV00150     | CAT  | null   |    529 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for NonInheritedSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for NonInheritedSubscription

    Examples: 
      | AssetId |
      |   50885 |

  #@Sanity @Regression @Negative
  #Scenario Outline: NonInherited Subscription without deleting the ChildLevel Subscription
  #  Then Delete tNonInheritedSubscription for Customer Level with "<cancelReason>","<level>" endTime without deleting the ChildLevel Subscription and Validate the ErrorMsg
  # Examples:
  #   | cancelReason | level      |
  #   | End of Term  | Customer   |
  @Sanity @Regression @Positive
  Scenario Outline: Delete NonInherited Subscription by deleting the CAT-ChildLevel Subscription
    Then Delete NonInheritedSubscription for CAT Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level |
      | End of Term  | CAT   |

  @Sanity @Regression @Positive
  Scenario Outline: Delete NonInherited Subscription by deleting the Dealer-ChildLevel Subscription
    Then Delete NonInheritedSubscription for Dealer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level  |
      | End of Term  | Dealer |

  @Sanity @Regression @Positive
  Scenario Outline: Delete NonInherited Subscription by deleting the Customer-Level Subscription
    Then Delete NonInheritedSubscription Customer Level with "<cancelReason>","<level>" endTime and Validate the SuccessMsg

    Examples: 
      | cancelReason | level    |
      | End of Term  | Customer |

  @Sanity @Regression @Positive
  Scenario Outline: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscription and Table for CancelledNonInheritedSubscription
    And Retrieve the Values of Subscription_id "<AssetId>" in AssetSubscriptionHistory Table for CancelledNonInheritedSubscription

    Examples: 
      | AssetId |
      |   50885 |
