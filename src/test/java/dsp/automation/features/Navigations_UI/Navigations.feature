@Sanity_Navigation
Feature: To validate the navigation across the DSP portal as a deployment smoke/sanity test.

  @Navigation_Login
  Scenario: Logging into Application
    Given Login into DSP Portal

  @Navigation_UserAdministration
  Scenario: Navigation to User Administration
    When Navigate to "Administration->User Administration"
    Then The page "User Administration" should be displayed

  @Navigation_CatLevelServices
  Scenario: Navigation to CAT Level services
    When Navigate to "Administration->Cat Level Services"
    Then The page "Cat Level Services" should be displayed

  @Navigation_MyWorklist
  Scenario: Navigation to My Worklist
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed 

  @Navigation_SoftUpdateLog
  Scenario: Navigation to Software Update Log
    When Navigate to "Activity Log->	Software Update Log"
    Then The page "Software Update Log" should be displayed

  @Navigation_TroubleShootLog
  Scenario: Navigation to Troubleshoot Log
    When Navigate to "Activity Log->	Troubleshoot Log"
    Then The page "Troubleshoot Log" should be displayed

  @Navigation_AdminConfiguration
  Scenario: Navigation to Administrator configuration
    When Navigate to "Administration->Administrator configuration"
    Then The page "Administrator configuration" should be displayed

  @Navigation_Minestar
  Scenario: Navigation to Minestar
    When Navigate to "Minestar"
    Then The page "Minestar" should be displayed

  @Navigation_AssetPopulation
  Scenario: Navigation to Asset Population
    When Navigate to "Administration->Asset Population"
    Then The page "Asset Population" should be displayed

  @Navigation_DealerProfileChange
  Scenario: changing Dealer Profile
    When change dealer code to "TD6"
    Then DealerCode should be changed to "TD6"
