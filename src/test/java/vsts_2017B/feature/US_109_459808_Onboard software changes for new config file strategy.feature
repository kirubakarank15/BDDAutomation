@2017B @US_109 @US_459808 @NewConfigFile
Feature: Verify Device Info Popup in DSP for software changes of new config file

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @US_109 @TC_
  Scenario Outline: Verify the Base Config , Base Config Date Field and Position in Device Info Popup for various DeviceTypes in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS
    And click on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then In UI Base Config should be displayed in Device Info Popup of MyWorklist Page
    And Base Config field should be displayed in Device Info Popup of MyWorklist Page
    And Base Config Part No should not be displayed in Device Info Popup of MyWorklist Page
    And Base Config Date should be displayed in Device Info Popup of MyWorklist Page
    And Base Config Date field should be displayed between Hardware PN and Base Config in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile   | CommercialType |
      | CATLoginProfile | Single       | PLE641         |
      | DealerLoginUser | Standard     | PLE631         |
      | FactoryUser     | Customer     | PL241          |
      | DealerLoginUser | Engineeering | PLE641+PL631   |
      | FactoryUser     | Single       | PL641          |
      | DealerLoginUser | Standard     | PLE742         |
      | CATLoginProfile | Standard     | PLE640         |
      | DealerLoginUser | Customer     | PLE641+PL631   |
      | FactoryUser     | Engineeering | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @US_109 @TC_ @NewSingleConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with New Single Config in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with NewSingleConfigfile
    And click on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base config Field should in be Alphanumeric format in Device Info Popup of MyWorklist Page
    And Base Config Date should be in Timestamp format in Device Info Popup of MyWorklist Page
    And Customer Config field should be blank in Device Info Popup of MyWorklist Page
    And Base Config field should be binded with PartNumber value from New Single Config file in Device Info Popup of MyWorklist Page
    And Base Config Date should be binded wuth modifiedTime value from New Single Config file in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile | CommercialType |
      | CATLoginProfile | Single     | PLE631         |
      | DealerLoginUser | Single     | PL641          |
      | FactoryUser     | Single     | PLE641+PL631   |
      | DealerLoginUser | Single     | PL241          |
      | DealerLoginUser | Single     | PLE641+PL631   |
      | FactoryUser     | Single     | PL641          |
      | DealerLoginUser | Single     | PLE742         |
      | CATLoginProfile | Single     | PLE640         |
      | DealerLoginUser | Single     | PLE641+PL631   |
      | FactoryUser     | Single     | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @US_109 @TC_ @CustomerConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with CustomerConfig file in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with CustomerConfigfile
    And click on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base Config field should be blank in Device Info Popup of MyWorklist Page
    And Base Config Date should be blank in Device Info Popup of MyWorklist Page
    And Customer Config Desc field should be binded with description value from New Customer Config file in Device Info Popup of MyWorklist Page
    And Customer Config Date should be binded with modifiedTime value from from New Customer Config file in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile | CommercialType |
      | CATLoginProfile | Customer   | PLE641         |
      | DealerLoginUser | Customer   | PL161          |
      | FactoryUser     | Customer   | PL641          |
      | DealerLoginUser | Customer   | PLE742         |
      | DealerLoginUser | Customer   | PLE641+PL631   |
      | FactoryUser     | Customer   | PL641          |
      | DealerLoginUser | Customer   | PLE742         |
      | CATLoginProfile | Customer   | PLE640         |
      | DealerLoginUser | Customer   | PLE641+PL631   |
      | FactoryUser     | Customer   | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @US_109 @TC_ @EngineeringConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with Engineering Config file in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with New Single Config
    And click on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base Config field should be blank in Device Info Popup of MyWorklist Page
    And Base Config Date should be blank in Device Info Popup of MyWorklist Page
    And Engineering Config Desc field should be binded with description value from Engineering Config file in Device Info Popup of MyWorklist Page
    And Engineering Config Date field should be binded with description value from Engineering Config file in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile  | CommercialType |
      | CATLoginProfile | Engineering | PLE641         |
      | DealerLoginUser | Engineering | PL161          |
      | FactoryUser     | Engineering | PL641          |
      | DealerLoginUser | Engineering | PLE742         |
      | DealerLoginUser | Engineering | PLE641+PL631   |
      | FactoryUser     | Engineering | PL641          |
      | DealerLoginUser | Engineering | PLE742         |
      | CATLoginProfile | Engineering | PLE640         |
      | DealerLoginUser | Engineering | PLE641+PL631   |
      | FactoryUser     | Engineering | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @US_109 @TC_ @MultipleConfilefile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with Multiple other Config Dataset in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with Multiple Config data set
    And click on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base config field should be binded with PartNumber value of Single Type from Mulitple Config Dataset in Device Info Popup of MyWorklist Page
    And Base Config Date field should be binded with ModifiedTime value of Single Type from Mulitple Config Dataset in Device Info Popup of MyWorklist Page
    And Customer config Date should be binded with description value of Customer Type from Mulitple Config Dataset in Device Info Popup of MyWorklist Page
    And Customer Config Desc should be binded with ModifiedTime value of Customer Type from Mulitple Config Dataset in Device Info Popup of MyWorklist Page
    And Engineering Config Desc should be binded with description value of Engineering Type from Mulitple Config Dataset in Device Info Popup of MyWorklist Page
    And Engineering config Date should be binded with ModifiedTime value of Engineering Type from Mulitple Config Dataset in Device Info Popup of MyWorklist Page
    But Partnumber of Customer or Engineering config file should not be displayed in DSP from Mulitple Config Dataset in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile                                 | CommercialType |
      | CATLoginProfile | Single & Standard & Customer & Engineering | PLE641         |
      | DealerLoginUser | Single & Standard & Customer & Engineering | PL161          |
      | FactoryUser     | Single & Standard & Customer & Engineering | PL641          |
      | DealerLoginUser | Single & Standard & Customer & Engineering | PLE742         |
      | DealerLoginUser | Single & Standard & Customer & Engineering | PLE641+PL631   |
      | FactoryUser     | Single & Standard & Customer & Engineering | PL641          |
      | DealerLoginUser | Single & Standard & Customer & Engineering | PLE742         |
      | CATLoginProfile | Single & Standard & Customer & Engineering | PLE640         |
      | DealerLoginUser | Single & Standard & Customer & Engineering | PLE641+PL631   |
      | FactoryUser     | Single & Standard & Customer & Engineering | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @US_109 @TC_ @SingleStandardConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with Single & Standard config data in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with Multiple Config data set
    And click on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base config field should be binded with PartNumber value of Single Type from Single & Standard config data in Device Info Popup of MyWorklist Page
    And Base Config Date field should be binded with ModifiedTime of Single Type from Single & Standard config data in Device Info Popup of MyWorklist Page
    But Partnumber and Modified time of Standard config data should not be displayed in the Base config and Base config date fields in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile        | CommercialType |
      | CATLoginProfile | Single & Standard | PLE641         |
      | DealerLoginUser | Single & Standard | PL161          |
      | FactoryUser     | Single & Standard | PL641          |
      | DealerLoginUser | Single & Standard | PLE742         |
      | DealerLoginUser | Single & Standard | PLE641+PL631   |
      | FactoryUser     | Single & Standard | PL641          |
      | DealerLoginUser | Single & Standard | PLE742         |
      | CATLoginProfile | Single & Standard | PLE640         |
      | DealerLoginUser | Single & Standard | PLE641+PL631   |
      | FactoryUser     | Single & Standard | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Negative @US_109 @TC_ @noConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with no config File in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with no Config data set
    And click on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base Config  should be blank in Device Info Popup of MyWorklist Page
    And Base Config Date field should be blank in Device Info Popup of MyWorklist Page
    And Customer Config Date should be blank in Device Info Popup of MyWorklist Page
    And Customer Config Desc should be blank in Device Info Popup of MyWorklist Page
    And Engineering Config Date should be blank in Device Info Popup of MyWorklist Page
    And Engineering Config Desc should be blank in Device Info Popup of MyWorklist Page

    Examples: 
      | Role            | ConfigFile | CommercialType |
      | CATLoginProfile |            | PLE641         |
      | DealerLoginUser |            | PL161          |
      | FactoryUser     |            | PL641          |
      | DealerLoginUser |            | PLE742         |
      | DealerLoginUser |            | PLE641+PL631   |
      | FactoryUser     |            | PL641          |
      | DealerLoginUser |            | PLE742         |
      | CATLoginProfile |            | PLE640         |
      | DealerLoginUser |            | PLE641+PL631   |
      | FactoryUser     |            | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @Standardconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with New Standard/Base Config file in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with Standard/Base Configfile
    And click on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base config Field should in be Alphanumeric format in Device Info Popup of MyWorklist Page
    And Base Config Date field should be in Timestamp format in Device Info Popup of MyWorklist Page
    And Customer Config field should be blank in Device Info Popup of MyWorklist Page
    And Base Config field should be binded with PartNumber value from New Standard Config file in Device Info Popup of MyWorklist Page
    And Base Config Date field should be binded with modifiedTime value from New Standard Config file in Device Info Popup of MyWorklist Page
    And PartNumber, modifiedTime field values should populate correctly from the Config file in MyWorklist Page

    Examples: 
      | Role            | ConfigFile | CommercialType |
      | CATLoginProfile | Standard   | PLE641         |
      | DealerLoginUser | Standard   | PL161          |
      | FactoryUser     | Standard   | PL641          |
      | DealerLoginUser | Standard   | PLE742         |
      | DealerLoginUser | Standard   | PLE641+PL631   |
      | FactoryUser     | Standard   | PL641          |
      | DealerLoginUser | Standard   | PLE742         |
      | CATLoginProfile | Standard   | PLE640         |
      | DealerLoginUser | Standard   | PLE641+PL631   |
      | FactoryUser     | Standard   | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @StandardwithMultipleconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with Standard and Multiple other Config Dataset in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with Standard/Base Configfile
    And click on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base config field should be binded with PartNumber value from New Standard Config file in Device Info Popup of MyWorklist Page
    And Base Config Date field should be binded with modifiedTime value from New Standard Config file in Device Info Popup of MyWorklist Page
    And Customer config Date field should be binded with description value from from New Customer Config file in Device Info Popup of MyWorklist Page
    And Customer Config Desc field should be binded with modifiedTime value from from New Customer Config file in Device Info Popup of MyWorklist Page
    And Engineering config Date field should be binded with description value from from New Engineering Config file in Device Info Popup of MyWorklist Page
    And Engineering Config Desc field should be binded with modifiedTime value from from New Engineering Config fil in Device Info Popup of MyWorklist Page
    But Partnumber of Customer or Engineering config file should not be displayed in DSP in MyWorklist Page

    Examples: 
      | Role            | ConfigFile                        | CommercialType |
      | CATLoginProfile | Standard & Customer & Engineering | PLE641         |
      | DealerLoginUser | Standard & Customer & Engineering | PL161          |
      | FactoryUser     | Standard & Customer & Engineering | PL641          |
      | DealerLoginUser | Standard & Customer & Engineering | PLE742         |
      | DealerLoginUser | Standard & Customer & Engineering | PLE641+PL631   |
      | FactoryUser     | Standard & Customer & Engineering | PL641          |
      | DealerLoginUser | Standard & Customer & Engineering | PLE742         |
      | CATLoginProfile | Standard & Customer & Engineering | PLE640         |
      | DealerLoginUser | Standard & Customer & Engineering | PLE641+PL631   |
      | FactoryUser     | Standard & Customer & Engineering | PLE641+PL631   |

  @CATLoginProfile @DealerLoginUser @FactoryUser @Positive @CustomerwithEnginneringconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Fields in Device Info Popup with Customer & Engineering config Data in Chrome and IE
    Given Login to DSP as "Role =<Role>"
    When Onboarded Asset Stubbed with "ConfigFile=<ConfigFile>" thru CCDS with Standard/Base Configfile
    And click on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then Base Config  should be blank in Device Info Popup of MyWorklist Page
    And Base Config Date field should be blank in Device Info Popup of MyWorklist Page
    And Customer config Date field should be binded with description value from from New Customer Config file in Device Info Popup of MyWorklist Page
    And Customer Config Desc field should be binded with modifiedTime value from from New Customer Config file in Device Info Popup of MyWorklist Page
    And Engineering config Date field should be binded with description value from from New Engineering Config file in Device Info Popup of MyWorklist Page
    And Engineering Config Desc field should be binded with modifiedTime value from from New Engineering Config fil in Device Info Popup of MyWorklist Page
    But Partnumber of Customer or Engineering config file should not be displayed in DSP in MyWorklist Page

    Examples: 
      | Role            | ConfigFile             | CommercialType |
      | CATLoginProfile | Customer & Engineering | PLE641         |
      | DealerLoginUser | Customer & Engineering | PL161          |
      | FactoryUser     | Customer & Engineering | PL641          |
      | DealerLoginUser | Customer & Engineering | PLE742         |
      | DealerLoginUser | Customer & Engineering | PLE641+PL631   |
      | FactoryUser     | Customer & Engineering | PL641          |
      | DealerLoginUser | Customer & Engineering | PLE742         |
      | CATLoginProfile | Customer & Engineering | PLE640         |
      | DealerLoginUser | Customer & Engineering | PLE641+PL631   |
      | FactoryUser     | Customer & Engineering | PLE641+PL631   |
