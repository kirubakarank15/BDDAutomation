@Regression_Subscription
Feature: To Validate Subscription UI functionalities for different assets.

  @sanity
  Scenario Outline: Title of your scenario
    Given Login as "User_Name" and "Password" in "INT_DSP"
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "<S/N>" in My Worklist Page
    Then Asset details should be displayed as "<S/N>" in My Worklist page
    When enter Subscription details as "<Services>,<Customer>,<Dealer>,<Cat>"
    And click "cancel" button or link
    Then verify the message "New Subscription Applied Successfully" is displayed
    When close browser

    Examples: 
      | S/N      | Services         | Customer   | Dealer     | Cat        |
      | AAA02091 | Product Link Web | Basic Aide | Basic Aide | Basic Aide |
