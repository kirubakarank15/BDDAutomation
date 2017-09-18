@US_160 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Applications and Dealer Codes Configurability
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  @CatProfile @US_160 @TC_268 @Positive
  Scenario Outline: To Verify the visibility of Subscription Contract Visualization feature in DSP for CAT Login
    When Search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription Contract Visualization feature should be visible to only "<Applications>"

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | B330       |              | VisionLink       |
      | E250       |              | Product Link Web |
      | H160       |              | My.Cat.Com       |
      | N030       |              |                  |
      | M610       |              |                  |

  @DealerProfile @US_160 @TC_270 @Positive
  Scenario Outline: To Verify the visibility of Subscription Contract Visualization feature in DSP for Dealer Login
    When Search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription Contract Visualization feature should be visible to only "<Applications>"

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | B330       |              | VisionLink       |
      | E250       |              | Product Link Web |
      | H160       |              | My.Cat.Com       |
      | N030       |              |                  |
      | M610       |              |                  |

  @CatProfile @US_160 @TC_271 @Positive
  Scenario Outline: To Verify Subscription Contract Visualization feature is Configurable for other dealer codes in DSP for CAT Login
    When Search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription Contract Visualization feature is enabled for all other dealercodes whenever zuora starts supporting billing for those dealers

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | TD00       |              | VisionLink       |
      | TD99       |              | Product Link Web |
      | TD67       |              | My.Cat.Com       |
      | E350       |              |                  |

  @DealerProfile @US_160 @TC_272 @Positive
  Scenario Outline: To Verify Subscription Contract Visualization feature is Configurable for other dealer codes in DSP for Dealer Login
    When Search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription Contract Visualization feature is enabled for all other dealercodes whenever zuora starts supporting billing for those dealers

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | TD00       |              | VisionLink       |
      | TD99       |              | Product Link Web |
      | TD67       |              | My.Cat.Com       |
      | E350       |              |                  |
