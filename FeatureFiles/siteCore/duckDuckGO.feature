@duckDuckGO
Feature: Verifying the search functionality in duckDuck go site

#works for any input where flight and accomdation can be booked together
#Improved parameterization in order to reduce many step defenition and also enables structure and resuability in page object methods using hash map
#e.g "Going to=<Going to>,Leaving from=<Leaving from>" will be parsed as key and value 

  @tag1
  Scenario Outline: Verifying the search functionality in duckDuck go site with different inputs
    Given Launch duckDuckGo url
    When search the country name as <country>
    When verify the result page is displayed and the results are correctly displayed for <country>

    Examples: 
	  |country|
	  |Bahamas|
     