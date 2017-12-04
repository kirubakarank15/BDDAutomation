@US_1071 @DSP @2017B.1 @ProductIdChanges
Feature: Product ID Update in DSP UI
     This feature is to verify the behavior of product id update when 'To product id' does not exist in CCDS system

  @TC_ @Positive @catprofile 
  Scenario Outline: To verify Product Id update when To product id with CAT make is not exist in DSP DB, CCDS system and Trimble Store as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    #Then Verify an API Get call is made to CCDS Assetstructure to check whether 'To product id' is present or not in CCDS system
    #And Verify product id is changed successfully if the response of Asset structure GET api call is 404
    Then Check if the response of Asset structure Get API is 404
    #And Call the Post Asset structure API With from Asset GUID with 'To product id'
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00111     | CSV00100      | CAT  |
      | RFV00112     | CSV00200      | CAT  |
      | RFV00113     | CSV00300      | CAT  |
      | RFV00114     | CSV00400      | CAT  |
      | RFV00115     | CSV00500      | CAT  |

  @TC_ @Positive @catprofile 
  Scenario Outline: To verify Product Id update when To product Id with Non Cat make is not exist in DSP DB, CCDS system and Trimble store as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00105     | CSV00101      | Z99  |
      | RFV00106     | CSV00102      | Z01  |
      | RFV00107     | CSV00103      | C30  |
      | AAA00197     | QWE00123      | Z02  |
      | AAA00420     | QWE00124      | Z03  |
      | RFV00116     | QWE00125      | Z04  |

  @TC_ @Positive @catprofile 
  Scenario Outline: To Verify Product Id update when To product id with Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Trimble store as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>"that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00108     | CSV00104      | CAT  |
      | RFV00109     | CSV00105      | CAT  |
      | RFV00110     | CSV00106      | CAT  |

  @TC_ @Positive @catprofile 
  Scenario Outline: To Verify Product Id update when To product id with Non Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Tribmle store as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00111     | CSV00107      | Z99  |
      | RFV00112     | CSV00108      | Z01  |
      | RFV00113     | CSV00109      | Z02  |
      | RFV00114     | CSV00101      | Z03  |

  @TC_ @Positive @catprofile 
  Scenario Outline: To verify Product Id update when To product id with Cat make is not exist in DSP, CCDS system but exist in Trimble store as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is exist in Trimble store
    And Verify in UI This product ID is having active subscription. Please cancel the subscription in Trimble store.

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00150     | FAL00760      | CAT  |
      | RFV00151     | FAL00760      | CAT  |
      | RFV00152     | FAL00760      | CAT  |

  @TC_ @Positive @Dealerprofile 
  Scenario Outline: To verify Product Id update when To product id with CAT make is not exist in DSP DB, CCDS system and Trimble Store as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00220     | CSV00220      | CAT  |
      | RFV00221     | CSV00221      | CAT  |
      | RFV00222     | CSV00222      | CAT  |
      | RFV00223     | CSV00223      | CAT  |
      | RFV00224     | CSV00224      | CAT  |

  @TC_ @Positive @Dealerprofile 
  Scenario Outline: To verify Product Id update when To product Id with Non Cat make is not exist in DSP DB, CCDS system and Trimble store as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00225     | CSV00225      | Z99  |
      | RFV00226     | CSV00226      | Z01  |
      | RFV00227     | CSV00227      | C30  |
      | RFV00228     | QWE00228      | Z02  |
      | RFV00229     | QWE00229      | Z03  |
      | RFV00230     | QWE00230      | Z04  |

  @TC_ @Positive @Dealerprofile 
  Scenario Outline: To Verify Product Id update when To product id with Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Trimble store as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>"that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00116     | CSV00116      | CAT  |
      | RFV00117     | CSV00117      | CAT  |
      | RFV00118     | CSV00118      | CAT  |
      | RFV00119     | CSV00119      | CAT  |

  @TC_ @Positive @Dealerprofile 
  Scenario Outline: To Verify Product Id update when To product id with Non Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Tribmle store as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | CFV00108     | CSV00108      | Z01  |
      | CFV00109     | CSV00109      | Z02  |
      | CFV00110     | CSV00101      | Z03  |
      | CFV00111     | CSV00111      | Z99  |
      | CFV00112     | CSV00112      | Z04  |

  @TC_ @Positive @Dealerprofile 
  Scenario Outline: To verify Product Id update when To product id with Cat make is not exist in DSP, CCDS system but exist in Trimble store as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is exist in Trimble store
    And Verify in UI This product ID is having active subscription. Please cancel the subscription in Trimble store.

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00153     | FAL00760      | CAT  |
      | RFV00154     | FAL00760      | CAT  |
      | RFV00155     | FAL00760      | CAT  |

  @TC_ @Positive @FactoryUser 
  Scenario Outline: To verify Product Id update when To product id with CAT make is not exist in DSP DB, CCDS system and Trimble Store as Factoryuser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    #Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00231     | CSV00231      | CAT  |
      | RFV00232     | CSV00232      | CAT  |
      | RFV00233     | CSV00233      | CAT  |
      | RFV00234     | CSV00234      | CAT  |
      | RFV00235     | CSV00235      | CAT  |

  @TC_ @Positive @Factoryuser 
  Scenario Outline: To verify Product Id update when To product Id with Non Cat make is not exist in DSP DB, CCDS system and Trimble store as Factoryuser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00236     | CSV00236      | Z99  |
      | RFV00237     | CSV00237      | Z01  |
      | RFV00238     | CSV00238      | C30  |
      | RFV00239     | QWE00239      | Z02  |
      | RFV00240     | QWE00240      | Z03  |
      | RFV00241     | QWE00241      | Z04  |

  @TC_ @Positive @factoryuser 
  Scenario Outline: To Verify Product Id update when To product id with Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Trimble store factory user
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>"that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00216     | CSV00216      | CAT  |
      | RFV00217     | CSV00217      | CAT  |
      | RFV00218     | CSV00218      | CAT  |
      | RFV00219     | CSV00219      | CAT  |

  @TC_ @Positive @Factoryuser 
  Scenario Outline: To Verify Product Id update when To product id with Non Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Tribmle store as Factory user
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | CFV00113     | CSV00113      | Z01  |
      | CFV00114     | CSV00114      | Z02  |
      | CFV00115     | CSV00115      | Z03  |
      | CFV00116     | CSV00116      | Z99  |
      | CFV00117     | CSV00117      | Z04  |

  @TC_ @Positive @Factoryuser 
  Scenario Outline: To verify Product Id update when To product id with Cat make is not exist in DSP, CCDS system but exist in Trimble store as Factory user profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is exist in Trimble store
    And Verify in UI This product ID is having active subscription. Please cancel the subscription in Trimble store.

     Examples: 
      | SerialNumber | To product id | Make |
      | RFV00156     | FAL00760      | CAT  |
      | RFV00157     | FAL00760      | CAT  |
      | RFV00158     | FAL00760      | CAT  |
      
  @TC_ @Positive @Customer
  Scenario Outline: To verify Product Id update when To product id with CAT make is not exist in DSP DB, CCDS system and Trimble Store as Customer
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00400     | CSV00400      | CAT  |
      | RFV00401     | CSV00401      | CAT  |
      | RFV00402     | CSV00402      | CAT  |
      | RFV00403     | CSV00403      | CAT  |
      | RFV00404     | CSV00404      | CAT  |

  @TC_ @Positive @Customer
  Scenario Outline: To verify Product Id update when To product Id with Non Cat make is not exist in DSP DB, CCDS system and Trimble store as Customer
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" combination that is not exists in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To Product id | Make |
      | RFV00405     | CSV00405      | Z99  |
      | RFV00406     | CSV00406      | Z01  |
      | RFV00407     | CSV00407      | C30  |
      | RFV00408     | QWE00245      | Z02  |
      | RFV00409     | QWE00246      | Z03  |
      | RFV00410     | QWE00247      | Z04  |

  @TC_ @Positive @Customer
  Scenario Outline: To Verify Product Id update when To product id with Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Trimble store Customer
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>"that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | RFV00411     | CSV00411      | CAT  |
      | RFV00412     | CSV00412      | CAT  |
      | RFV00413     | CSV00413      | CAT  |
      | RFV00414     | CSV00414      | CAT  |

  @TC_ @Positive @Customer
  Scenario Outline: To Verify Product Id update when To product id with Non Cat make is not having any active subscriptions/services in DSP DB and not exist in CCDS system,Tribmle store as Customer
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is not exist in Trimble store
    And Verify in UI product id is changed successfully

    Examples: 
      | SerialNumber | To product id | Make |
      | CFV00118     | CSV00118      | Z01  |
      | CFV00119     | CSV00119      | Z02  |
      | CFV00120     | CSV00120      | Z03  |
      | CFV00121     | CSV00121      | Z99  |
      | CFV00122     | CSV00122      | Z04  |

  @TC_ @Positive @Customer
  Scenario Outline: To verify Product Id update when To product id with Cat make is not exist in DSP, CCDS system but exist in Trimble store as Customer
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters '<To product id>'with "<Make>" that is not having any active subscriptions/services in DSP DB
    And Clicks on save button
    Then Check if the response of Asset structure Get API is 404
    And Check To product id is exist in Trimble store
    And Verify in UI This product ID is having active subscription. Please cancel the subscription in Trimble store.

    Examples: 
      | SerialNumber | To product id | Make |
      |              |               |      |
      |              |               |      |
      |              |               |      |
