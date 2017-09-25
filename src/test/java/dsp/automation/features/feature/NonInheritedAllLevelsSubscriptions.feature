@API
Feature: Creating NonInherited Subscriptions in all Levels
  This feature is to Validate creation of NonInherited subscriptions in all Levels

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscription set for the Customer Level for NonInheritedsubscription
    Then Set NonInheritedsubscription for Customer Level with serialNumber,startTime,endTime, "<parentId>","<make>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>","<dcn>","<billingtUserAccountId>" for CustomerLevel

    Examples: 
      | parentId | make | siteId | typeId | level    | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    527 | CUSTOMER | Owned  |   2969473160 | Customer         | TD00                   | Dealer                     | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscription set for the Dealer Level for NonInherited subscriptions
    Then Set NonInheritedsubscription Dealer Level with serialNumber,"<parentId>","<make>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>","<dcn>","<billingtUserAccountId>",startTime,endTime for Dealerlevel

    Examples: 
      | parentId | make | siteId | typeId | level  | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    511 | Dealer | Owned  | TD00         | Dealer           | CAT                    | CAT                        | 059956 | null                  |

  @Sanity @Regression @Positive
  Scenario Outline: : Validate Subscription set for the CAT Level for NonInherited subscriptions
    Then Set NonInheritedsubscription CATLevel with serialNumber,startTime,endTime,"<parentId>","<make>","<siteId>","<typeId>","<level>","<origin>","<organization>","<organizationType>","<associatedOrganization>","<associatedOrganizationType>" ,"<dcn>","<billingtUserAccountId>" for CATLevel

    Examples: 
      | parentId | make | siteId | typeId | level | origin | organization | organizationType | associatedOrganization | associatedOrganizationType | dcn    | billingtUserAccountId |
      | null     | CAT  | null   |    529 | CAT   | Owned  | CAT          | CAT              | CAT                    | CAT                        | 059956 |                123456 |

  @Sanity @Regression @Positive
  Scenario: Validate Subscriptions are set for the all Levels in Database
    Then Retrieve the Values of Subscription_id in AssetSubscription and Table for NonInheritedSubscription
    And Retrieve the Values of Subscription_id in AssetSubscriptionHistory Table for NonInheritedSubscription
