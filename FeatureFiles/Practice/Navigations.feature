@ToolsQAPoc @Sanity_Navigation
Feature: To validate the navigation across the ToolsQA portal as a deployment smoke/sanity test.

  @Navigation_LaunchURL
  Scenario: Launching ToolsQA Portal
    Given Launch toolsQA url "http://toolsqa.com"
     
    @Navigation_SeleniumOnlineTraining
  Scenario: Navigation to SeleniumOnlineTraining PAGE
    When Navigate to "Trainings->Selenium Online Training" in ToolsQA
    Then  page "Selenium Online Training" should be displayed in Tools 
    
  @Navigation_CorporateTraining
  Scenario: Navigation to My Corporate Training page
    When Navigate to "Trainings->Corporate Trainings" in ToolsQA
    Then  page "Corporate Trainings" should be displayed in Tools


