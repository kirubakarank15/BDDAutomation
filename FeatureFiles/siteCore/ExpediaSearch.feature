@ExpecdiaSearch
Feature: Verifying the functionality of Accomadation and Flight search together

#works for any input where flight and accomdation can be booked together
#Improved parameterization in order to reduce many step defenition and also enables structure and resuability in page object methods using hash map
#e.g "Going to=<Going to>,Leaving from=<Leaving from>" will be parsed as key and value 


  Scenario Outline: Searching hotel and accomation together in expedia site
    Given Launch expedia url
    When verify the region of the website <region> and language <Language>, modify accordingly if not
    And enter accomation and flight details as "Going to=<Going to>,Leaving from=<Leaving from>,Check in=<Check in>,Check out=<Check out>,Adults=<Adults>,Child=<Child>"
    And sarch the flights and hotels
    When verify the result page is displayed with records

    Examples: 
      | Going to | Leaving from      | Check in   | Check out  | Adults | Child | Language | region        |
      | New York | Brussels-National | 05-05-2021 | 08-05-2021 |      1 |     2 | English  | United States |
    