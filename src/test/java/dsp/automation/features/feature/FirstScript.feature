@tag1
Feature: Title of your feature
  I want to use this template for my feature file

  @tag
  Scenario Outline: Title of your scenario
    Given Login as "User_Name" and "Passowrd" in "INT_DSP"
    When Navigate to "Administration->User Administration"
    Then The page "User Administration" should be displayed
        Given Login as "UserName" and "Password" in "INT_DSP"
    When Navigate to "Administration->Cat Level Services"
    Then The page "Cat Level Services" should be displayed
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When Navigate to "Activity Log->	Software Update Log"
    Then The page "Software Update Log" should be displayed

    When Navigate to "Administration->Administrator configuration"
    Then The page "Administrator configuration" should be displayed
    When Navigate to "Activity Log->	Troubleshoot Log"
    Then The page "Troubleshoot Log" should be displayed
    When Navigate to "Minestar"
    Then The page "Minestar" should be displayed
    When Navigate to "Administration->Asset Population"
    Then The page "Asset Population" should be displayed
    When close browser

    Examples:  
      | UserName | Password |
      |          |          |

  @tag
  Scenario: Title of your scenario
    Given Login as "UserName" and "Password" in "INT_DSP"
    When Navigate to "Administration->User Administration"
    Then The page "User Administration" should be displayed
    When Navigate to "Administration->Cat Level Services"
    Then The page "Cat Level Services" should be displayed
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When Navigate to "Activity Log->	Software Update Log"
    Then The page "Software Update Log" should be displayed
    When Navigate to "Administration->Administrator configuration"
    Then The page "Administrator configuration" should be displayed
    When Navigate to "Activity Log->	Troubleshoot Log"
    Then The page "Troubleshoot Log" should be displayed
    When Navigate to "Minestar"
    Then The page "Minestar" should be displayed
    When Navigate to "Administration->Asset Population"
    Then The page "Asset Population" should be displayed
    When Navigate to "TD6"
    Then The page "TD6" should be displayed
    When close browser
