@Demo
Feature: To check the functionality of Properties.qa application

  @Scenario1
  Scenario Outline: To get the rates of the apartments and save it to a csv file
    Given Launch propertyFinder url
    Then page "Property Finder QA Home" should be displayed
    When search with details as "Category=<Category>,Property Type=<Property Type>,Location=<Location>,Minimum Beds=<Minimum Beds>,Maximum Beds=<Maximum Beds>" in home page of QA Property Finder
    And perform sorting as "<Sort>" in home page of QA Property Finder
    And save the fetched details from home page of QA Property Finder

    Examples: 
      | Category | Property Type | Location  | Minimum Beds | Maximum Beds | Sort         |
      | BUY      | Villa         | THE PEARL |            3 |            7 | Price (high) |

  @Scenario2
  Scenario Outline: To find agents based on filter Hindi , English and Arabic
    Given Launch propertyFinder url
    Then page "Property Finder AE Home" should be displayed
    When switch to "<tab>" tab in home page of AE Property Finder
    And search with details as "Languages=<Languages>" in agent page of AE Property Finder
    And store the agents count
    And search with details as "Nationality=<Nationality>" in agent page of AE Property Finder
    And verify the agent count is "<comparator>" than previous search in agent page of AE Property Finder

    Examples: 
      | tab        | Languages            | Nationality | comparator |
      | Find agent | Hindi+English+Arabic | India       | less       |

  @Scenario3
  Scenario Outline: To get the first agent details and save it to a text file
    Given Launch propertyFinder url
    Then page "Property Finder AE Home" should be displayed
    When switch to "<tab>" tab in home page of AE Property Finder
    Then page "Top Agents" should be displayed
    When perform click on First Agent
    Then page "Agent Details" should be displayed
    And save the following fetched details "Name,Nationality,Language,License No,About Me,Phone Number,Company name,Experience,ActiveListings,LinkedIn" from Agent Details Page

    Examples: 
      | tab        |
      | Find agent |
