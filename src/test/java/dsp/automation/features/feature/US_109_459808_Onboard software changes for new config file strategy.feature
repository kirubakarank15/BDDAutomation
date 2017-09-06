@US_54_459808 @UIAutomation
Feature: Verify Device Info Popup in DSP for software changes of new config file
  

  @Positive1
  Scenario Outline: Verify the Base Config and Base Config Date Field  in Device Info Popup for various DeviceTypes
    Given Asset Onboarded Successfully and "<ConfigFile>" Stubbed thru CCDS
    And I login as "<Username>" and "<Password>" in "<Browser>"
    When I click Device Info Popup with "<CommercialType>"
    Then Base Config and Base Config Date fields should be displayed in Device Info Popup.
    And Base Config field should be displayed between Hardware PN and Base Config.
    And Base Config Part No field should not be displayed.

    Examples: 
      | Username            | Password            | ConfigFile   | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Single       | IE      | PLE641         |
      | CATLoginUserName    | CATLoginPassword    | Standard     | IE      | PLE631         |
      | CATLoginUserName    | CATLoginPassword    | Customer     | IE      | PL241          |
      | CATLoginUserName    | CATLoginPassword    | Engineeering | IE      | PL161          |
      | DealerLoginUserName | DealerLoginPassword | Single       | Chrome  | PLE641+PL631   |
      | DealerLoginUserName | DealerLoginPassword | Standard     | Chrome  | PL641          |
      | DealerLoginUserName | DealerLoginPassword | Customer     | Chrome  | PLE640         |
      | DealerLoginUserName | DealerLoginPassword | Engineeering | Chrome  | PLE742         |

  @Positive2
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Single Config
    Given Asset Onboarded Successfully and  "<ConfigFile>"  Stubbed thru CCDS for New Single Config
    And I login as  "<Username>" and "<Password>" in "<Browser>" for New Single Config
    When I click Device Info Popup for New Single Config file with "<CommercialType>"
    Then Alpha numeric name should be displayed in the Base Config Field
    And Base Config Date field should include date and time
    And Length of the Base Config Field should be appropriate
    And Customer Config field should be blank

    Examples: 
      | Username            | Password            | ConfigFile | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Single     | Chrome  | PLE631         |
      | CATLoginUserName    | CATLoginPassword    | Single     | IE      | PL641          |
      | DealerLoginUserName | DealerLoginPassword | Single     | Chrome  | PLE641+PL631   |
      | DealerLoginUserName | DealerLoginPassword | Single     | IE      | PL241          |

  @Positive3
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Customer Config
    Given Asset Onboarded Successfully and  "<ConfigFile>" Stubbed thru CCDS for New Customer Config
    And I login as "<Username>" and "<Password>" in "<Browser>"  for New Customer Config
    When I click Device Info Popup for New Customer Config file with "<CommercialType>"
    Then Alpha numeric name should be displayed in the Base Config Field for the New Customer Config file
    And Base Config Date field should include date and time for the New Customer Config file
    And Customer Config Desc field should be displayed/binded with the same data as in CCDS API Response
    And Customer Config Date field should be displayed/binded with the same data as in CCDS API Response

    Examples: 
      | Username            | Password            | ConfigFile | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Customer   | Chrome  | PLE641         |
      | CATLoginUserName    | CATLoginPassword    | Customer   | IE      | PL161          |
      | DealerLoginUserName | DealerLoginPassword | Customer   | Chrome  | PL641          |
      | DealerLoginUserName | DealerLoginPassword | Customer   | IE      | PLE742         |

  @Positive4
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Engineering Config
    Given Asset Onboarded Successfully and  "<ConfigFile>"  Stubbed thru CCDS for New Engineering Config
    And I login as "<Username>" and "<Password>" in "<Browser>" for New Engineering Config
    When I click Device Info Popup for New Engineering Config file with "<CommercialType>"
    Then Alpha numeric name should be dsiplayed in the Base Config Field for the New Engineering Config file
    And Base Config Date field should include date and time for the New Engineering Config file
    And Engineering Config Desc field should be displayed/binded with the same data as in CCDS API Response
    And Engineering Config Date field should be displayed/binded with the same data as in CCDS API Response

    Examples: 
      | Username            | Password            | ConfigFile  | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Engineering | Chrome  | PLE641+PL631   |
      | CATLoginUserName    | CATLoginPassword    | Engineering | IE      | PLE631         |
      | DealerLoginUserName | DealerLoginPassword | Engineering | Chrome  | PL641          |
      | DealerLoginUserName | DealerLoginPassword | Engineering | IE      | PL161          |

  @Positive5
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Mulitple other Config Dataset
    Given Asset Onboarded Successfully and "<ConfigFile>" Stubbed thru CCDS for Multiple Config data set
    And I login as "<Username>" and "<Password>" in "<Browser>" for Multiple Config Data set
    When I click Device Info Popup for Mulitple Config Dataset with "<CommercialType>"
    Then Base config field in DSP should be binded with PartNumber of Single or Standard config Data for Mulitple Config Dataset
    And Base Config Date field in DSP should be binded with Modified time of Single or Standard Config Data for Mulitple Config Dataset
    And Customer config Date and Customer Config Desc field in DSP should be displayed/binded with the Customer data as in CCDS API Response
    And Engineering config Date and Engineering Config Desc in DSP field should be displayed/binded with the Customer data as in CCDS API Response
    But Partnumber of Customer or Engineering config file should not be displayed in DSP

    Examples: 
      | Username            | Password            | ConfigFile                                 | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Single & Standard & Customer & Engineering | Chrome  | PLE631         |
      | CATLoginUserName    | CATLoginPassword    | Single & Standard & Customer & Engineering | IE      | PLE640         |
      | DealerLoginUserName | DealerLoginPassword | Single & Standard & Customer & Engineering | Chrome  | PL241          |
      | DealerLoginUserName | DealerLoginPassword | Single & Standard & Customer & Engineering | IE      | PL641          |

  @Positive6
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with Single and Standard config data
    Given Asset Onboarded Successfully and "<ConfigFile>" Stubbed thru CCDS with Single and Standard config data
    And I login as  "<Username>" and "<Password>" in "<Browser>" with Single and Standard config data
    When I click Device Info Popup with Single and Standard config data with "<CommercialType>"
    Then Base config field should be binded with PartNumber of Single Config file with Single and Standard config data
    And Base Config Date field should be binded with Modified time of Single Config file with Single and Standard config data
    But Standard Partnumber and  Modified time of Standard config data in CCDS API Response should not be displayed in the Base config and Base config date fields in DSP

    Examples: 
      | Username            | Password            | ConfigFile        | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Single & Standard | Chrome  | PLE631         |
      | CATLoginUserName    | CATLoginPassword    | Single & Standard | IE      | PLE641+PL631   |
      | DealerLoginUserName | DealerLoginPassword | Single & Standard | Chrome  | PL241          |
      | DealerLoginUserName | DealerLoginPassword | Single & Standard | IE      | PLE742         |

  @Negative1
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with no Single and Standard config data
    Given I login as  "<Username>" and "<Password>" in "<Browser>" in DSP
    When I click Device Info Popup with "<CommercialType>"
    Then Base Config and Base Config Date field should be blank

    Examples: 
      | Username            | Password            | Browser | CommercialType |
      | CATLoginUserName    | CATLoginPassword    | Chrome  | PLE631         |
      | CATLoginUserName    | CATLoginPassword    | IE      | PLE641+PL631   |
      | DealerLoginUserName | DealerLoginPassword | Chrome  | PL241          |
      | DealerLoginUserName | DealerLoginPassword | IE      | PLE742         |
