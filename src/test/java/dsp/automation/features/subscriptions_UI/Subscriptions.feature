@Subscriptions
Feature: To Validate Subscription UI functionalities for different assets.

  @Subscription_Sanity @Subscription_Regression
  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @Subscription_Sanity
  Scenario Outline: Search Asset Details and modify subscription details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "S/N =<S/N>,Services=<Services>" in My Worklist Page
    Then Asset details should be displayed as "<S/N>" in My Worklist page
    When enter Subscription details as "<Services>,<Customer>,Dealer=<Dealer>,<Cat>"
    And click "cancel" button or link
    Then verify the message "New Subscription Applied Successfully" is displayed

    Examples: 
      | S/N        | Services           | Customer        | Dealer     | Cat        |
      | AAA02091   | Product Link Web   | Basic Aide      | Basic Aide | Basic Aide |
      | 5454353242 | Product Link Wesdb | Basisdasdc Aide |            |            |

  @Subscription_Regression
  Scenario Outline: Search Asset Details and modify subscription details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "S/N =<S/N>,Services=<Services>" in My Worklist Page
    Then Asset details should be displayed as "<S/N>" in My Worklist page
    When enter Subscription details as "<Services>,<Customer>,Dealer=<Dealer>,<Cat>"
    And click "cancel" button or link
    Then verify the message "New Subscription Applied Successfully" is displayed

    Examples: 
      | S/N        | Services           | Customer        | Dealer     | Cat        |
      | AAA02091   | Product Link Web   | Basic Aide      | Basic Aide | Basic Aide |
      | 5454353242 | Product Link Wesdb | Basisdasdc Aide |            |            |
      | AAA02091   | Product Link Web   | Basic Aide      | Basic Aide | Basic Aide |
      | 5454353242 | Product Link Wesdb | Basisdasdc Aide |            |            |
      | AAA02091   | Product Link Web   | Basic Aide      | Basic Aide | Basic Aide |
      | 5454353242 | Product Link Wesdb | Basisdasdc Aide |            |            |
      | AAA02091   | Product Link Web   | Basic Aide      | Basic Aide | Basic Aide |
