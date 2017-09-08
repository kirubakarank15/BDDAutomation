@tag1
Feature: Title of your feature
  I want to use this template for my feature file

  @tagff
  Scenario Outline: Title of your scenario
    Given Login as "User_Name" and "Password" in "INT_DSP"
    When Navigate to "Administration->User Administration"
    Then The page "User Administration" should be displayed
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When Navigate to "Administration->Cat Level Services"
    Then The page "Cat Level Services" should be displayed
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
    When change dealer code to "TD6"
    Then DealerCode should be changed to "TD6"
    When close browser

    Examples: 
      | UserName | Password |
      |          |          |

@Sanity@Navigation
  Scenario: Navigation to User Administration
    Given Login as "User_Name" and "Password" in "INT_DSP"
    When Navigate to "Administration->User Administration"
    Then The page "User Administration" should be displayed

@Sanity
  Scenario: Navigation to CAT lelvel services
    When Navigate to "Administration->Cat Level Services"
    Then The page "Cat Level Services" should be displayed

@Sanity
  Scenario: Navigation to My Worklist
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

@Sanity
  Scenario: Navigation to My Worklist
    When Navigate to "Activity Log->	Software Update Log"
    Then The page "Software Update Log" should be displayed

@Sanity
  Scenario: Navigation to My Worklist
    When Navigate to "Activity Log->	Troubleshoot Log"
    Then The page "Troubleshoot Log" should be displayed
    
@Sanity
  Scenario: Navigation to My Worklist
    When Navigate to "Administration->Administrator configuration"
    Then The page "Administrator configuration" should be displayed
