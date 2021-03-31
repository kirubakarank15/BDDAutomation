@ToolsQAPoc @Enrollment
Feature: To validate the navigation across the ToolsQA portal as a deployment smoke/sanity test.

  @TC1
  Scenario Outline: To check the enrollment form with different input
    Given Launch toolsQA url "http://toolsqa.com"
    When Navigate to "Trainings->Selenium Online Training" in ToolsQA
    Then page "Selenium Online Training" should be displayed in Tools
    When enter details as "Name=<Name>,Email=<Email>,Mobile=<Mobile>,Country=<Country>,Your Message=<Your Message>" in enrollment form for Training
		And submit the enrollment form
    Examples: 
      | Name   | Email        | Mobile  | Country| Your Message |
      | Kiru   | dd@ww.com    | 9933333 | India       | My Message   |
      | Kiruss | dsdsd@ww.com |   54363 | Indian      | My Message   |
 