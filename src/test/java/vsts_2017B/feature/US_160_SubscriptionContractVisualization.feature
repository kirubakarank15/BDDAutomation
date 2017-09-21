@US_160 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Applications and Dealer Codes Configurability
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |

  @CatProfile @US_160 @TC_268 @Positive
  Scenario Outline: To Verify the visibility of Subscription Contract Visualization feature for different services for CAT Login
    When Set in UI "<DealerCode>"
    And enter or modify Subscription details as "<Services>,<Cat Level Subscription>,<Dealer Level Subscription>,<Customer Level Subscription>,<Additional Services>"
    Then Verify Subscription Contract Visualization feature should be visible to only "<Services>"

    Examples: 
      | DealerCode | Device Type | Services         | Cat             | Dealer          | Customer                    | Additional Services |
      | E250       | PLE641      | VisionLink       |                 |                 | Cat Basic - 10 Minutes  | Onboard Analytics   |
      | H160       | PLE641      | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)                                 |                     |
      | N030       |             | My.Cat.Com       |                 |                 | Cat Daily                                      | Cat Daily           |
      | M610       |             |                  |                 |                 |                                                |                     |
      | B330       |             |                  |                 |                 |                                                |                     |

  @CatProfile @US_160 @TC_271 @Positive
  Scenario Outline: To Verify Subscription Contract Visualization feature is Configurable for other dealer codes for CAT Login
    When Set in UI "<DealerCode>"
    And enter or modify Subscription details as "<Services>,<Cat Level Subscription>,<Dealer Level Subscription>,<Customer Level Subscription>,<Base Subscription>,<Additional Services>"
    Then Verify Subscription Contract Visualization feature is enabled for all other dealercodes whenever zuora starts supporting billing for those dealers

    Examples: 
      | DealerCode | Device Type | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | TD00       | PLE641      | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | TD99       | PLE641      | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | TD67       |             | My.Cat.Com       |                 |                 |                |                        | Cat Daily           |

  @DealerProfile @US_160 @TC_270 @Positive
  Scenario Outline: To Verify the visibility of Subscription Contract Visualization feature for Dealer Login
    When enter or modify Subscription details as "<Services>,<Dealer>,<Customer>,<Base Subscription>,<Additional Services>"
    Then Verify Subscription Contract Visualization feature should be visible to only "<Applications>"

    Examples: 
      | Services         | Dealer          | Customer       | Base Subscription      | Additional Services |
      | VisionLink       |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | My.Cat.Com       |                 |                |                        | Cat Daily           |
      |                  |                 |                |                        |                     |
      |                  |                 |                |                        |                     |

  @DealerProfile @US_160 @TC_272 @Positive
  Scenario Outline: To Verify Subscription Contract Visualization feature is Configurable for other dealer codes in DSP for Dealer Login
    When enter or modify Subscription details as "<Services>,<Dealer>,<Customer>,<Base Subscription>,<Additional Services>"
    Then Verify Subscription Contract Visualization feature is enabled for all other dealercodes whenever zuora starts supporting billing for those dealers

    Examples: 
      | Services         | Dealer          | Customer       | Base Subscription      | Additional Services |
      | VisionLink       |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | My.Cat.Com       |                 |                |                        | Cat Daily           |
      |                  |                 |                |                        |                     |
      |                  |                 |                |                        |                     |
