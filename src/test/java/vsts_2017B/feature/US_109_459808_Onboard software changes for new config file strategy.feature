@2017B @US_109 @US_459808 @NewConfigFile
Feature: Verify Device Info Popup in DSP for software changes of new config file

  @CATLoginProfile @DealerLoginUserName @FactoryUserProfile @Sprint5 @FunctionalPositive
  Scenario Outline: Navigation to My Worklist in Chrome and IE
    Given Login into DSP Portal as "Role = <Role>"

    Examples: 
      | Role                |
      | CATLoginUser        |
      | DealerLoginUserName |
      | FactoryUserName     |

  @CATLoginProfile @Sprint5 @FunctionalPositive
  Scenario Outline: Verify the Base Config and Base Config Date Field  in Device Info Popup for various DeviceTypes in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI "Base Config.isDisplayed=True,Base Config Date.isDisplayed=True,Base Config Date.Displayed=False,Base Config Date field displayed between Hardware PN and Base Config" in Device Info Popup of MyWorklist Page

    Examples: 
      | ConfigFile   | CommercialType |
      | Single       | PLE641         |
      | Standard     | PLE631         |
      | Customer     | PL241          |
      | Engineeering | PLE641+PL631   |

  @DealerLoginUserName @Sprint5 @FunctionalPositive
  Scenario Outline: Verify the Base Config and Base Config Date Field  in Device Info Popup for various DeviceTypes in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI "Base Config.isDisplayed=True,Base Config Date.isDisplayed=True,Base Config Date.Displayed=False,Base Config Date field displayed between Hardware PN and Base Config" in Device Info Popup of MyWorklist Page

    Examples: 
      | ConfigFile   | CommercialType |
      | Single       | PLE641+PL631   |
      | Standard     | PL641          |
      | Customer     | PLE640         |
      | Engineeering | PLE742         |

  @FactoryUserName @Sprint5 @FunctionalPositive
  Scenario Outline: Verify the Base Config and Base Config Date Field  in Device Info Popup for various DeviceTypes in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS
    And clicked on Device Info Popup for "CommercialType=<CommercialType>"in MyWorklist Page
    Then verify in UI "Base Config.isDisplayed=True,Base Config Date.isDisplayed=True,Base Config Date.Displayed=False,Base Config Date field displayed between Hardware PN and Base Config" in Device Info Popup of MyWorklist Page

    Examples: 
      | ConfigFile   | CommercialType |
      | Single       | PL161          |
      | Standard     | PL631          |
      | Customer     | PLE742         |
      | Engineeering | PLE640         |

  @CATLoginProfile @Sprint5 @FunctionalPositive @SingleConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Single Config in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Single Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI Base config Field "Base Config =AN,Base Config Date= Timestamp format,Customer Config =blank,Base Config=PartNumber,Base Config Date=modifiedTime " for New Single Config in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Single     | PLE631         |
      | Single     | PL641          |
      | Single     | PLE641+PL631   |
      | Single     | PL241          |

  @DealerLoginUserName @Sprint5 @FunctionalPositive @SingleConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Single Config in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Single Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI Base config Field "Base Config =AN,Base Config Date= Timestamp format,Customer Config =blank,Base Config=PartNumber,Base Config Date=modifiedTime " for New Single Config in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Single     | PLE640         |
      | Single     | PL161          |
      | Single     | PLE641+PL631   |
      | Single     | PL241          |

  @FactoryUserName @Sprint5 @FunctionalPositive @SingleConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Single Config in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Single Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI Base config Field "Base Config =AN,Base Config Date= Timestamp format,Customer Config =blank,Base Config=PartNumber,Base Config Date=modifiedTime " for New Single Config in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Single     | PLE742         |
      | Single     | PL641          |
      | Single     | PLE641+PL631   |
      | Single     | PL241          |

  @CATLoginProfile @Sprint5 @FunctionalPositive @CustomerConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Customer Config in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Customer Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base Config =blank,Base Config Date=blank,Customer Config Desc=description,Customer Config Date = modifiedTime" from CCDS API Response for New Customer Config file in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Customer   | PLE641         |
      | Customer   | PL161          |
      | Customer   | PL641          |
      | Customer   | PLE742         |

  @DealerLoginUserName @Sprint5 @FunctionalPositive @CustomerConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Customer Config in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Customer Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base Config =blank,Base Config Date=blank,Customer Config Desc=description,Customer Config Date = modifiedTime" from CCDS API Response for New Customer Config file in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Customer   | PLE641         |
      | Customer   | PL161          |
      | Customer   | PL641          |
      | Customer   | PLE742         |

  @FactoryUserName @Sprint5 @FunctionalPositive @CustomerConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Customer Config in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Customer Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base Config =blank,Base Config Date=blank,Customer Config Desc=description,Customer Config Date = modifiedTime" from CCDS API Response for New Customer Config file in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Customer   | PLE641         |
      | Customer   | PL161          |
      | Customer   | PL641          |
      | Customer   | PLE742         |

  @CATLoginProfile @Sprint5 @FunctionalPositive @EngineeringConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Engineering Config in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Engineering Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base Config =blank,Base Config Date=blank,Engineering Config Desc=description,Engineering Config Date = modifiedTime" from CCDS API Response for New Engineering Config file in MyWorklist Page

    Examples: 
      | ConfigFile  | CommercialType |
      | Engineering | PLE641+PL631   |
      | Engineering | PLE631         |
      | Engineering | PL641          |
      | Engineering | PL161          |

  @DealerLoginUserName @Sprint5 @FunctionalPositive @EngineeringConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Engineering Config in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Engineering Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base Config =blank,Base Config Date=blank,Engineering Config Desc=description,Engineering Config Date = modifiedTime" from CCDS API Response for New Engineering Config file in MyWorklist Page

    Examples: 
      | ConfigFile  | CommercialType |
      | Engineering | PLE641+PL631   |
      | Engineering | PLE631         |
      | Engineering | PL641          |
      | Engineering | PL161          |

  @FactoryUserName @Sprint5 @FunctionalPositive @EngineeringConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Engineering Config in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Engineering Config 
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base Config =blank,Base Config Date=blank,Engineering Config Desc=description,Engineering Config Date = modifiedTime" from CCDS API Response for New Engineering Config file in MyWorklist Page

    Examples: 
      | ConfigFile  | CommercialType |
      | Engineering | PLE641+PL631   |
      | Engineering | PLE631         |
      | Engineering | PL641          |
      | Engineering | PL161          |

  @CATLoginProfile @Sprint5 @FunctionalPositive @MultipleConfilefile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Multiple other Config Dataset in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for Multiple Config data set
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base config =Single.PartNumber,Base Config Date=Single.ModifiedTime,Customer config Date=Customer.description,Customer Config Desc=Customer.ModifiedTime,Engineering Config Desc=Engineering.description,Engineering config Date =Engineering.ModifiedTime" from CCDS API Response for Mulitple Config Dataset in MyWorklist Page
    But verify Partnumber of Customer or Engineering config file are not displayed in DSP in  MyWorklist Page

    Examples: 
      | ConfigFile                                 | CommercialType |
      | Single & Standard & Customer & Engineering | PLE631         |
      | Single & Standard & Customer & Engineering | PLE640         |
      | Single & Standard & Customer & Engineering | PL241          |
      | Single & Standard & Customer & Engineering | PL641          |

  @DealerLoginUserName @Sprint5 @FunctionalPositive15 @MultipleConfilefile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Multiple other Config Dataset in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for Multiple Config data set
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in  MyWorklist Page
    Then verify and compare in UI "Base config =Single.PartNumber,Base Config Date=Single.ModifiedTime,Customer config Date=Customer.description,Customer Config Desc=Customer.ModifiedTime,Engineering Config Desc=Engineering.description,Engineering config Date =Engineering.ModifiedTime" from CCDS API Response for Mulitple Config Dataset in MyWorklist Page
    But verify Partnumber of Customer or Engineering config file are not displayed in DSP in  MyWorklist Page

    Examples: 
      | ConfigFile                                 | CommercialType |
      | Single & Standard & Customer & Engineering | PLE631         |
      | Single & Standard & Customer & Engineering | PLE640         |
      | Single & Standard & Customer & Engineering | PL241          |
      | Single & Standard & Customer & Engineering | PL641          |

  @FactoryUserName @Sprint5 @FunctionalPositive16 @MultipleConfilefile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Multiple other Config Dataset in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for Multiple Config data set
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in  MyWorklist Page
    Then verify and compare in UI "Base config =Single.PartNumber,Base Config Date=Single.ModifiedTime,Customer config Date=Customer.description,Customer Config Desc=Customer.ModifiedTime,Engineering Config Desc=Engineering.description,Engineering config Date =Engineering.ModifiedTime" from CCDS API Response for Mulitple Config Dataset in MyWorklist Page
    But verify Partnumber of Customer or Engineering config file are not displayed in DSP in  MyWorklist Page

    Examples: 
      | ConfigFile                                 | CommercialType |
      | Single & Standard & Customer & Engineering | PLE631         |
      | Single & Standard & Customer & Engineering | PLE640         |
      | Single & Standard & Customer & Engineering | PL241          |
      | Single & Standard & Customer & Engineering | PL641          |

  @CATLoginProfile @Sprint5 @FunctionalPositive17 @SingleStandardConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with Single & Standard config data in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS with Single and Standard config data
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and Compare in UI "Base config=Single.PartNumber,Base Config Date.ModifiedTime" from CCDS API Response of Single Config file with Single & Standard config data in MyWorklist Page
    But verify Standard Partnumber and  Modified time of Standard config data in CCDS API Response are not displayed in the Base config and Base config date fields in DSP in MyWorklist Page

    Examples: 
      | ConfigFile        | CommercialType |
      | Single & Standard | PLE631         |
      | Single & Standard | PLE641+PL631   |
      | Single & Standard | PL241          |
      | Single & Standard | PLE742         |

  @DealerLoginUserName @Sprint5 @FunctionalPositive18 @SingleStandardConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with Single and Standard config data in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS with Single and Standard config data
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and Compare in UI "Base config=Single.PartNumber,Base Config Date.ModifiedTime" from CCDS API Response of Single Config file with Single & Standard config data in MyWorklist Page
    But verify Standard Partnumber and  Modified time of Standard config data in CCDS API Response are not displayed in the Base config and Base config date fields in DSP in MyWorklist Page

    Examples: 
      | ConfigFile        | CommercialType |
      | Single & Standard | PLE631         |
      | Single & Standard | PLE641+PL631   |
      | Single & Standard | PL241          |
      | Single & Standard | PLE742         |

  @FactoryUserName @Sprint5 @FunctionalPositive19 @SingleStandardConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with Single and Standard config data in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS with Single and Standard config data
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in  MyWorklist Page
    Then verify and Compare in UI "Base config=Single.PartNumber,Base Config Date.ModifiedTime" from CCDS API Response of Single Config file with Single & Standard config data in MyWorklist Page
    But verify Standard Partnumber and  Modified time of Standard config data in CCDS API Response are not displayed in the Base config and Base config date fields in DSP in MyWorklist Page

    Examples: 
      | ConfigFile        | CommercialType |
      | Single & Standard | PLE631         |
      | Single & Standard | PLE641+PL631   |
      | Single & Standard | PL241          |
      | Single & Standard | PLE742         |

  @CATLoginProfile @Sprint5 @FunctionalNegative20 @noConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with no config File in Chrome and IE for CATLoginProfile
    When clicked on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and Compare in UI "Base Config=blank,Base Config Date =blank,Customer Config Date =blank,Customer Config Desc=blank,Engineering Config Date=blank,Engineering Config Desc=blank" in MyWorklist Page

    Examples: 
      | CommercialType |
      | PLE631         |
      | PLE641+PL631   |
      | PL241          |
      | PLE742         |

  @DealerLoginUserName @Sprint5 @FunctionalNegative21 @noConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with no config File in Chrome and IE for DealerLoginUserName
    When clicked on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and Compare in UI "Base Config=blank,Base Config Date =blank,Customer Config Date =blank,Customer Config Desc=blank,Engineering Config Date=blank,Engineering Config Desc=blank" in MyWorklist Page

    Examples: 
      | CommercialType |
      | PLE631         |
      | PLE641+PL631   |
      | PL241          |
      | PLE742         |

  @FactoryUserName @Sprint5 @FunctionalNegative22 @noConfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup with no config File in Chrome and IE for FactoryUserName
    When clicked on Device Info Popup with "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and Compare in UI "Base Config=blank,Base Config Date =blank,Customer Config Date =blank,Customer Config Desc=blank,Engineering Config Date=blank,Engineering Config Desc=blank" in MyWorklist Page

    Examples: 
      | CommercialType |
      | PLE631         |
      | PLE641+PL631   |
      | PL241          |
      | PLE742         |

  @CATLoginProfile @Sprint5 @FunctionalPositive23 @Standardconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Standard/Base Config in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Standard/Base Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI Base config Field "Base Config =AN,Base Config Date= Timestamp format,Customer Config =blank,Base Config=PartNumber,Base Config Date=modifiedTime " for New Standard Config in MyWorklist Page
    And verify PartNumber, modifiedTime field values populated correctly from the Config file in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Standard   | PLE631         |
      | Standard   | PL641          |
      | Standard   | PLE641+PL631   |
      | Standard   | PL241          |

  @DealerLoginUserName @Sprint5 @FunctionalPositive24 @Standardconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Standard/Base Config in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Standard/Base Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI Base config Field "Base Config =AN,Base Config Date= Timestamp format,Customer Config =blank,Base Config=PartNumber,Base Config Date=modifiedTime " for New Standard Config in MyWorklist Page
    And verify PartNumber, modifiedTime field values populated correctly from the Config file in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Standard   | PLE631         |
      | Standard   | PL641          |
      | Standard   | PLE641+PL631   |
      | Standard   | PL241          |

  @FactoryUserName @Sprint5 @FunctionalPositive25 @Standardconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for New Standard/Base Config in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for New Standard/Base Config
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify in UI Base config Field "Base Config =AN,Base Config Date= Timestamp format,Customer Config =blank,Base Config=PartNumber,Base Config Date=modifiedTime " for New Standard Config in MyWorklist Page
    And verify PartNumber, modifiedTime field values populated correctly from the Config file in MyWorklist Page

    Examples: 
      | ConfigFile | CommercialType |
      | Standard   | PLE631         |
      | Standard   | PL641          |
      | Standard   | PLE641+PL631   |
      | Standard   | PL241          |

  @CATLoginProfile @Sprint5 @FunctionalPositive26 @StandardwithMultipleconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Standard and Multiple other Config Dataset in Chrome and IE for CATLoginProfile
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for standard and Multiple other Config Dataset
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base config =Standard.PartNumber,Base Config Date =Standard.modifiedTime,Customer config Date =Customer.description,Customer Config Desc=Customer.modifiedTime,Engineering config Date=Engineering.description,Engineering Config Desc =Engineering.modifiedTime" CCDS API Response for Mulitple Config Dataset in MyWorklist Page
    But verify Partnumber of Customer or Engineering config file are not displayed in DSP in MyWorklist Page

    Examples: 
      | ConfigFile                        | CommercialType |
      | Standard & Customer & Engineering | PLE631         |
      | Standard & Customer & Engineering | PLE640         |
      | Standard & Customer & Engineering | PL241          |
      | Standard & Customer & Engineering | PL641          |

  @DealerLoginUserName @Sprint5 @FunctionalPositive27 @StandardwithMultipleconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Standard and Multiple other Config Dataset in Chrome and IE for DealerLoginUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for standard and Multiple other Config Dataset
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base config =Standard.PartNumber,Base Config Date =Standard.modifiedTime,Customer config Date =Customer.description,Customer Config Desc=Customer.modifiedTime,Engineering config Date=Engineering.description,Engineering Config Desc =Engineering.modifiedTime" CCDS API Response for Mulitple Config Dataset in MyWorklist Page
    But verify Partnumber of Customer or Engineering config file are not displayed in DSP in MyWorklist Page

    Examples: 
      | ConfigFile                        | CommercialType |
      | Standard & Customer & Engineering | PLE631         |
      | Standard & Customer & Engineering | PLE640         |
      | Standard & Customer & Engineering | PL241          |
      | Standard & Customer & Engineering | PL641          |

  @FactoryUserName @Sprint5 @FunctionalPositive28 @StandardwithMultipleconfigfile
  Scenario Outline: Verify the Base Config and Base Config Date Field in Device Info Popup for Standard and Multiple other Config Dataset in Chrome and IE for FactoryUserName
    When Asset Onboarded Successfully and "ConfigFile=<ConfigFile>" Stubbed thru CCDS for standard and Multiple other Config Dataset
    And clicked on Device Info Popup for "CommercialType=<CommercialType>" in MyWorklist Page
    Then verify and compare in UI "Base config =Standard.PartNumber,Base Config Date =Standard.modifiedTime,Customer config Date =Customer.description,Customer Config Desc=Customer.modifiedTime,Engineering config Date=Engineering.description,Engineering Config Desc =Engineering.modifiedTime" CCDS API Response for Mulitple Config Dataset in MyWorklist Page
    But verify Partnumber of Customer or Engineering config file are not displayed in DSP in MyWorklist Page

    Examples: 
      | ConfigFile                        | CommercialType |
      | Standard & Customer & Engineering | PLE631         |
      | Standard & Customer & Engineering | PLE640         |
      | Standard & Customer & Engineering | PL241          |
      | Standard & Customer & Engineering | PL641          |
