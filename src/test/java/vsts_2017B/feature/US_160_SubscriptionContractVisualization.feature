@US_160 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization - Applications and Dealer Codes Configurability
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @CatProfile @US_160 @TC_268 @Positive
  Scenario Outline: To Verify the visibility of Subscription Contract Visualization feature in DSP for CAT profile
    When Navigate to "MY WORKLIST"
    And Logged in CatProfile  as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify Subscription Contract Visualization feature should be visible to only "<Applications>"

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | B330       |              | VisionLink       |
      | E250       |              | Product Link Web |
      | H160       |              | My.Cat.Com       |
      | N030       |              |                  |
      | M610       |              |                  |

  @DealerProfile @US_160 @TC_270 @Positive
  Scenario Outline: To Verify the visibility of Subscription Contract Visualization feature in DSP for Dealer profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile  as "<Dealercode>"
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify Subscription Contract Visualization feature should be visible to only "<Applications>"

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | B330       |              | VisionLink       |
      | E250       |              | Product Link Web |
      | H160       |              | My.Cat.Com       |
      | N030       |              |                  |
      | M610       |              |                  |

  @CATProfile @US_160 @TC_271 @Positive
  Scenario Outline: To Verify Subscription Contract Visualization feature is Configurable for other dealer codes in DSP for CAT Profile
    When Navigate to "MY WORKLIST"
    And Logged in CATProfile  as "<Dealercode>" other than the Five piloted dealercodes
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify Subscription Contract Visualization feature is enabled for all other dealercodes whenever zuora starts supporting billing for those dealers

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | TD00       |              | VisionLink       |
      | TD99       |              | Product Link Web |
      | TD67       |              | My.Cat.Com       |
      | E350       |              |                  |

  @DealerProfile @US_160 @TC_272 @Positive
  Scenario Outline: To Verify Subscription Contract Visualization feature is Configurable for other dealer codes in DSP for Dealer Profile
    When Navigate to "MY WORKLIST"
    And Logged in DealerProfile  as "<Dealercode>" other than the Five piloted dealercodes
    When Search Asset details as "Serial Number" in My Worklist Page
    Then Verify Subscription Contract Visualization feature is enabled for all other dealercodes whenever zuora starts supporting billing for those dealers

    Examples: 
      | DealerCode | SerialNumber | Application      |
      | TD00       |              | VisionLink       |
      | TD99       |              | Product Link Web |
      | TD67       |              | My.Cat.Com       |
      | E350       |              |                  |
