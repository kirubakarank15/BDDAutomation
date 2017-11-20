@US_1070 @DSP @2017B.1 @ProductIdChanges
Feature: Product ID Update in DSP UI
  This feature is to verify the behavior of product id update when 'To product id' is already exists or 'To product id'  is having active subscriptions/services in DSP DB

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  @TC_1123 @Positive @Catprofile
  Scenario Outline: To verify Product Id update when To product id with CAT make is already exists in DSP DB as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00101     | RFV00101      |
      | RFV00102     | RFV00102      |
      | RFV00103     | RFV00103      |

  @TC_1127 @Positive @catprofile
  Scenario Outline: To verify Product Id update when To product id with CAT make is already having active subscriptions/services in DSP DB as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00104     | RFV00104      |
      | RFV00105     | RFV00105      |
      | RFV00108     | RFV00108      |

  @TC_1280 @Positive @Catprofile 
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already exists in DSP DB as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00100     | ZUK00100      |
      | ZUK00101     | ZUK00101      |
      | ZUK00102     | ZUK00102      |
      | ZUK00103     | ZUK00103      |
      | ZUK00104     | ZUK00104      |

  @TC_1281 @Positive @catprofile
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already having active subscriptions/services in DSP DB as cat profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00105     | ZUK00105      |
      | ZUK00106     | ZUK00106      |
      | ZUK00107     | ZUK00107      |
      | ZUK00108     | ZUK00108      |
      | ZUK00109     | ZUK00109      |

  @TC_1282 @Positive @Dealerprofile
  Scenario Outline: To verify Product Id update when To product id with CAT make is already exists in DSP DB as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00101     | RFV00101      |
      | RFV00102     | RFV00102      |
      | RFV00103     | RFV00103      |

  @TC_1283 @Positive @Dealerprofile
  Scenario Outline: To verify Product Id update when To product id with CAT make is already having active subscriptions/services in DSP DB as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00104     | RFV00104      |
      | RFV00105     | RFV00105      |
      | RFV00108     | RFV00108      |

@TC_1284 @Positive @Dealerprofile 
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already exists in DSP DB as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00100     | ZUK00100      |
      | ZUK00101     | ZUK00101      |
      | ZUK00102     | ZUK00102      |
      | ZUK00103     | ZUK00103      |
      | ZUK00104     | ZUK00104      |

@TC_1285 @Positive @Dealerprofile
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already having active subscriptions/services in DSP DB as Dealer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00105     | ZUK00105      |
      | ZUK00106     | ZUK00106      |
      | ZUK00107     | ZUK00107      |
      | ZUK00108     | ZUK00108      |
      | ZUK00109     | ZUK00109      |

@TC_ @Positive @Factoryuser
  Scenario Outline: To verify Product Id update when To product id with CAT make is already exists in DSP DB as Factoryuser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00101     | RFV00101      |
      | RFV00102     | RFV00102      |
      | RFV00103     | RFV00103      |

  @TC_ @Positive @Factoryuser
  Scenario Outline: To verify Product Id update when To product id with CAT make is already having active subscriptions/services in DSP DB as Factoryuser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00104     | RFV00104      |
      | RFV00105     | RFV00105      |
      | RFV00108     | RFV00108      |

@TC_ @Positive @Factoryuser 
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already exists in DSP DB as Factoryuser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00100     | ZUK00100      |
      | ZUK00101     | ZUK00101      |
      | ZUK00102     | ZUK00102      |
      | ZUK00103     | ZUK00103      |
      | ZUK00104     | ZUK00104      |

@TC_ @Positive @Factoryuser
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already having active subscriptions/services in DSP DB as Factoryuser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00105     | ZUK00105      |
      | ZUK00106     | ZUK00106      |
      | ZUK00107     | ZUK00107      |
      | ZUK00108     | ZUK00108      |
      | ZUK00109     | ZUK00109      |

@TC_ @Positive @FieldTechnician
  Scenario Outline: To verify Product Id update when To product id with CAT make is already exists in DSP DB as FieldTechnician
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00101     | RFV00101      |
      | RFV00102     | RFV00102      |
      | RFV00103     | RFV00103      |

  @TC_ @Positive @FieldTechnician
  Scenario Outline: To verify Product Id update when To product id with CAT make is already having active subscriptions/services in DSP DB as FieldTechnician
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00104     | RFV00104      |
      | RFV00105     | RFV00105      |
      | RFV00108     | RFV00108      |

@TC_ @Positive @FieldTechnician 
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already exists in DSP DB as FieldTechnician
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00100     | ZUK00100      |
      | ZUK00101     | ZUK00101      |
      | ZUK00102     | ZUK00102      |
      | ZUK00103     | ZUK00103      |
      | ZUK00104     | ZUK00104      |

@TC_ @Positive @FieldTechnician
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already having active subscriptions/services in DSP DB as FieldTechnician
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00105     | ZUK00105      |
      | ZUK00106     | ZUK00106      |
      | ZUK00107     | ZUK00107      |
      | ZUK00108     | ZUK00108      |
      | ZUK00109     | ZUK00109      |

@TC_ @Positive @MinestarUser
  Scenario Outline: To verify Product Id update when To product id with CAT make is already exists in DSP DB as MinestarUser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00101     | RFV00101      |
      | RFV00102     | RFV00102      |
      | RFV00103     | RFV00103      |

  @TC_ @Positive @MinestarUser
  Scenario Outline: To verify Product Id update when To product id with CAT make is already having active subscriptions/services in DSP DB as MinestarUser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00104     | RFV00104      |
      | RFV00105     | RFV00105      |
      | RFV00108     | RFV00108      |

@TC_ @Positive @MinestarUser 
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already exists in DSP DB as MinestarUser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00100     | ZUK00100      |
      | ZUK00101     | ZUK00101      |
      | ZUK00102     | ZUK00102      |
      | ZUK00103     | ZUK00103      |
      | ZUK00104     | ZUK00104      |

@TC_ @Positive @MinestarUser
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already having active subscriptions/services in DSP DB as MinestarUser
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00105     | ZUK00105      |
      | ZUK00106     | ZUK00106      |
      | ZUK00107     | ZUK00107      |
      | ZUK00108     | ZUK00108      |
      | ZUK00109     | ZUK00109      |
  
  @TC_ @Positive @Customer
  Scenario Outline: To verify Product Id update when To product id with CAT make is already exists in DSP DB as Customer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00101     | RFV00101      |
      | RFV00102     | RFV00102      |
      | RFV00103     | RFV00103      |

  @TC_ @Positive @Customer
  Scenario Outline: To verify Product Id update when To product id with CAT make is already having active subscriptions/services in DSP DB as Customer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | RFV00104     | RFV00104      |
      | RFV00105     | RFV00105      |
      | RFV00108     | RFV00108      |

@TC_ @Positive @Customer 
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already exists in DSP DB as Customer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already exists in DSP DB with a device
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00100     | ZUK00100      |
      | ZUK00101     | ZUK00101      |
      | ZUK00102     | ZUK00102      |
      | ZUK00103     | ZUK00103      |
      | ZUK00104     | ZUK00104      |

@TC_ @Positive @Customer
  Scenario Outline: To verify Product Id update when To product id with NON CAT make is already having active subscriptions/services in DSP DB as Customer profile
    When search Asset details as "<SerialNumber>" in My Worklist Page
    And User clicks on product id update icon
    And Enters "<To Product id>" with same make that is already having active subscriptions/services in subscription history table
    And Clicks on save button
    Then Verify in UI The Product Id already exists error message is shown and product id update should not happen

    Examples: 
      | SerialNumber | To Product id |
      | ZUK00105     | ZUK00105      |
      | ZUK00106     | ZUK00106      |
      | ZUK00107     | ZUK00107      |
      | ZUK00108     | ZUK00108      |
      | ZUK00109     | ZUK00109      |

