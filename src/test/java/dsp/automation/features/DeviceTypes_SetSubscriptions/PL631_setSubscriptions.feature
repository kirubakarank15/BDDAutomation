@Regression @PL631_SetSubscriptions
Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To set different base subscriptions for PL631 device with VISIONLINK application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>","<Additional Services>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>","<Additional Services>","<Expected Additional Services>" in My Worklist page

    #Validate the Count of Add on
    Examples: 
      | S/N     | Services    | Base Level               | Additional Services                          | Expected Base Level      | Expected Additional Services                 |
      | SERIAL1 | VISION LINK | Cat Basic - 4 Hours      |                                              | Cat Basic - 4 Hours      |                                              |
      | SERIAL2 | VISION LINK | Cat Basic - Hourly       |                                              | Cat Basic - Hourly       |                                              |
      | SERIAL3 | VISION LINK | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring |
      | SERIAL4 | VISION LINK | Cat Essentials - 4 Hours |                                              | Cat Essentials - 4 Hours |                                              |

  #cancelSubscription
  Scenario Outline: To cancel the subscriptions for PL631 device with VISIONLINK application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Base Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services    | Base Level | Expected Base Level | Cancel Reason                     |
      | SERIAL1 | VISION LINK | None       | None                | End Of Term                       |
      | SERIAL2 | VISION LINK | None       | None                | Machine Sold                      |
      | SERIAL3 | VISION LINK | None       | None                | Subscription Changed              |
      | SERIAL4 | VISION LINK | None       | None                | Subscription Payment Not Received |

  Scenario Outline: To set different subscriptions for PL631 device with MY.CAT.COM  application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services   | Base Level | Expected Base Level |
      | SERIAL5 | MY.CAT.COM | Cat Daily  | Cat Daily           |

  #cancelSubscription
  Scenario Outline: To cancel the subscriptions for PL631 device with MY.CAT.COM  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Base Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services   | Base Level | Expected Base Level | Cancel Reason       |
      | SERIAL5 | MY.CAT.COM | None       | None                | E.D. Lookup failure |

  Scenario Outline: To set different subscriptions for PL631 device with EQUIPMENT TRACKER  application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services          | Base Level | Expected Base Level |
      | SERIAL6 | EQUIPMENT TRACKER | Cat Daily  | Cat Daily           |

  #cancelSubscription
  Scenario Outline: To cancel the subscriptions for PL631 device with MY.CAT.COM  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Base Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services          | Base Level | Expected Base Level | Cancel Reason                                                  |
      | SERIAL6 | EQUIPMENT TRACKER | None       | None                | Subscription not supported / Existing subscription got expired |

  # Cust Inherited Subscriptions
  Scenario Outline: To set Customer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N     | Services         | Customer Level | Dealer Level | Cat Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL7 | PRODUCT LINK WEB | Vitals (ES1-0) |              |           | Vitals (ES1-0)          | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL8 | PRODUCT LINK WEB | Aide (ES4-0)   |              |           | Aide (ES4-0)            | Aide (ES4-0)          | Aide (ES4-0)       |

  # Cancel Customer Inherited subscriptions
  Scenario Outline: To cancel Customer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services         | Customer Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason          |
      | SERIAL7 | PRODUCT LINK WEB | None           | None                    | None                  | None               | E.D. Lookup failure    |
      | SERIAL8 | PRODUCT LINK WEB | None           | None                    | None                  | None               | Device Not Functioning |

  #Dealer Inherited Subscriptions
  Scenario Outline: To set Dealer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL9  | PRODUCT LINK WEB | Vitals (ES1-0) | Aide (ES4-0)   |           | Vitals (ES1-0)          | Aide (ES4-0)          | Aide (ES4-0)       |
      | SERIAL10 | PRODUCT LINK WEB |                | Vitals (ES1-0) |           |                         | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL11 | PRODUCT LINK WEB |                | Aide (ES4-0)   |           |                         | Aide (ES4-0)          | Aide (ES4-0)       |

  # Cancel Dealer Inherited subscriptions
  Scenario Outline: To cancel Dealer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason          |
      | SERIAL9  | PRODUCT LINK WEB | None           |              | None                    | None                  | None               | E.D. Lookup failure    |
      | SERIAL10 | PRODUCT LINK WEB |                | None         | None                    | None                  | None               | Device Not Functioning |
      | SERIAL11 | PRODUCT LINK WEB |                | None         | None                    | None                  | None               | Device Not Functioning |

  # CAT level Subscription
  Scenario Outline: To check whether the user is able to set CAT level Subscription for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>" from billing Pop Up
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level      | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL12 | PRODUCT LINK WEB | Vitals (ES1-0) | Vitals (ES1-0) | Aide (ES4-0)   |                     | NULL         |                |                 | Vitals (ES1-0)          | Vitals (ES1-0)        | Aide (ES4-0)       |
      | SERIAL13 | PRODUCT LINK WEB |                |                | Vitals (ES1-0) |                     | NULL         |                |                 | None                    | None                  | Vitals (ES1-0)     |
      | SERIAL14 | PRODUCT LINK WEB |                |                | Aide (ES4-0)   |                     | NULL         |                |                 | None                    | None                  | Aide (ES4-0))      |

  # Cancelling CAT Level subscriptions
  Scenario Outline: To cancel CAT level Subscription for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | CAT Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason          |
      | SERIAL12 | PRODUCT LINK WEB | None           |           | None                    | None                  | None               | E.D. Lookup failure    |
      | SERIAL13 | PRODUCT LINK WEB |                | None      | None                    | None                  | None               | Device Not Functioning |
      | SERIAL14 | PRODUCT LINK WEB |                | None      | None                    | None                  | None               | Automatic downgrade    |

  #TestData Set up for Update scenario
  Scenario Outline: To do data set up for update scenario
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details

    Examples: 
      | S/N     | Services         | Customer Level | Dealer Level | Cat Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL7 | PRODUCT LINK WEB | Vitals (ES1-0) |              |           | Vitals (ES1-0)          | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL8 | PRODUCT LINK WEB | Aide (ES4-0)   |              |           | Aide (ES4-0)            | Aide (ES4-0)          | Aide (ES4-0)       |

  # Update Cust Inherited Subscription
  Scenario Outline: To Update Customer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And update the subscriptions for the Asset as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N     | Services         | Customer Level | Dealer Level | Cat Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL7 | PRODUCT LINK WEB | Aide (ES4-0)   |              |           | Aide (ES4-0)            | Aide (ES4-0)          | Aide (ES4-0)       |
      | SERIAL8 | PRODUCT LINK WEB | Vitals (ES1-0) |              |           | Vitals (ES1-0)          | Vitals (ES1-0)        | Vitals (ES1-0)     |

  #Cancel Updated Cust Inherited Subscription
  Scenario Outline: To cancel Updated Customer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services         | Customer Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason            |
      | SERIAL7 | PRODUCT LINK WEB | None           | None                    | None                  | None               | Cust Product Transferred |
      | SERIAL8 | PRODUCT LINK WEB | None           | None                    | None                  | None               | Mutual Agreement         |

  #TestData Set up for Update scenario
  Scenario Outline: To do data set up for update scenario
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL9  | PRODUCT LINK WEB | Vitals (ES1-0) | Aide (ES4-0)   |           | Vitals (ES1-0)          | Aide (ES4-0)          | Aide (ES4-0)       |
      | SERIAL10 | PRODUCT LINK WEB |                | Vitals (ES1-0) |           |                         | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL11 | PRODUCT LINK WEB |                | Aide (ES4-0)   |           |                         | Aide (ES4-0)          | Aide (ES4-0)       |

  #Update Dealer Inherited Subscription
  Scenario Outline: To Update Dealer Inherited subscriptions for PL631 device with PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And update the subscriptions for the Asset as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL9  | PRODUCT LINK WEB | Aide (ES4-0)   | Aide (ES4-0)   |           | Aide (ES4-0)            | Aide (ES4-0)          | Aide (ES4-0)       |
      | SERIAL10 | PRODUCT LINK WEB |                | Aide (ES4-0)   |           |                         | Aide (ES4-0)          | Aide (ES4-0)       |
      | SERIAL11 | PRODUCT LINK WEB |                | Vitals (ES1-0) |           |                         | Vitals (ES1-0)        | Vitals (ES1-0)     |

  #Cancel Updated Dealer Inherited Subscription
  Scenario Outline: To cancel Dealer Inherited subscriptions for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason          |
      | SERIAL9  | PRODUCT LINK WEB | None           |              | None                    | None                  | None               | E.D. Lookup failure    |
      | SERIAL10 | PRODUCT LINK WEB |                | None         | None                    | None                  | None               | Device Not Functioning |
      | SERIAL11 | PRODUCT LINK WEB |                | None         | None                    | None                  | None               | Device Not Functioning |

  #TestData Set up for Update scenario
  Scenario Outline: To do data set up for update scenario
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>" from billing Pop Up
    And submit subscription details

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level      | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL12 | PRODUCT LINK WEB | Vitals (ES1-0) | Vitals (ES1-0) | Aide (ES4-0)   |                     | xxxxx1       | xxxxx1         | xxxxx1          | Vitals (ES1-0)          | Vitals (ES1-0)        | Aide (ES4-0)       |
      | SERIAL13 | PRODUCT LINK WEB |                |                | Vitals (ES1-0) |                     | xxxxx1       | xxxxx1         | xxxxx1          | None                    | None                  | Vitals (ES1-0)     |
      | SERIAL14 | PRODUCT LINK WEB |                |                | Aide (ES4-0)   |                     | xxxxx1       | xxxxx1         | xxxxx1          | None                    | None                  | Aide (ES4-0))      |

  #Update CAT Level Subscription with Same CAT Billing Account
  Scenario Outline: To Update CATLevel subscriptions with same CAT billing Account for PL631 device with PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And update the subscriptions for the Asset as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>" from billing Pop Up
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level      | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL12 | PRODUCT LINK WEB | Vitals (ES1-0) | Vitals (ES1-0) | Vitals (ES1-0) |                     |              |                |                 | Vitals (ES1-0)          | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL13 | PRODUCT LINK WEB |                |                | Aide (ES4-0)   |                     | xxxxx1       | xxxxx1         | xxxxx1          | None                    | None                  | Aide (ES4-0)       |
      | SERIAL14 | PRODUCT LINK WEB |                |                | Vitals (ES1-0) |                     | xxxxx1       | xxxxx1         | xxxxx1          | None                    | None                  | Vitals (ES1-0)     |

  # Cancel Updated CAT Level subscriptions
  Scenario Outline: To cancel Updated CAT level Subscription for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | CAT Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason          |
      | SERIAL12 | PRODUCT LINK WEB | None           |           | None                    | None                  | None               | E.D. Lookup failure    |
      | SERIAL13 | PRODUCT LINK WEB |                | None      | None                    | None                  | None               | Device Not Functioning |
      | SERIAL14 | PRODUCT LINK WEB |                | None      | None                    | None                  | None               | Automatic downgrade    |

  #TestData Set up for Update scenario
  Scenario Outline: To do data set up for update scenario
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>" from billing Pop Up
    And submit subscription details

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level      | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL12 | PRODUCT LINK WEB | Vitals (ES1-0) | Vitals (ES1-0) | Aide (ES4-0)   |                     | xxxxx1       | xxxxx1         | xxxxx1          | Vitals (ES1-0)          | Vitals (ES1-0)        | Aide (ES4-0)       |
      | SERIAL13 | PRODUCT LINK WEB |                |                | Vitals (ES1-0) |                     | xxxxx1       | xxxxx1         | xxxxx1          | None                    | None                  | Vitals (ES1-0)     |
      | SERIAL14 | PRODUCT LINK WEB |                |                | Aide (ES4-0)   |                     | xxxxx1       | xxxxx1         | xxxxx1          | None                    | None                  | Aide (ES4-0))      |

  #Update CAT Level Subscription with Different CAT Billing Account
  Scenario Outline: To Update CATLevel subscriptions with different CAT billing Account for PL631 device with PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And update the subscriptions for the Asset as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>" from billing Pop Up
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level   | Cat Level      | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL12 | PRODUCT LINK WEB | Vitals (ES1-0) | Vitals (ES1-0) | Vitals (ES1-0) |                     |              |                |                 | Vitals (ES1-0)          | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL13 | PRODUCT LINK WEB |                |                | Aide (ES4-0)   |                     | xxxxx2       | xxxxx2         | xxxxx2          | None                    | None                  | Aide (ES4-0)       |
      | SERIAL14 | PRODUCT LINK WEB |                |                | Vitals (ES1-0) |                     | xxxxx2       | xxxxx2         | xxxxx2          | None                    | None                  | Vitals (ES1-0)     |

  # Cancel Updated CAT Level subscriptions
  Scenario Outline: To cancel Updated CAT level Subscription for PL631 device with  PRODUCTLINKWEB  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Customer Level>","<Dealer Level>","<Cat Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | CAT Level | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason          |
      | SERIAL12 | PRODUCT LINK WEB | None           |           | None                    | None                  | None               | E.D. Lookup failure    |
      | SERIAL13 | PRODUCT LINK WEB |                | None      | None                    | None                  | None               | Device Not Functioning |
      | SERIAL14 | PRODUCT LINK WEB |                | None      | None                    | None                  | None               | Automatic downgrade    |

  #TestData Set up for Update scenario
  Scenario Outline: To set different base subscriptions for PL631 device with VISIONLINK application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>","<Additional Services>"
    And submit subscription details

    Examples: 
      | S/N     | Services    | Base Level               | Additional Services                          | Expected Base Level      | Expected Additional Services                 |
      | SERIAL1 | VISION LINK | Cat Basic - 4 Hours      |                                              | Cat Basic - 4 Hours      |                                              |
      | SERIAL2 | VISION LINK | Cat Basic - Hourly       |                                              | Cat Basic - Hourly       |                                              |
      | SERIAL3 | VISION LINK | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring |
      | SERIAL4 | VISION LINK | Cat Essentials - 4 Hours |                                              | Cat Essentials - 4 Hours |                                              |
      | SERIAL1 | VISION LINK | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring |
      | SERIAL2 | VISION LINK | Cat Essentials - 4 Hours |                                              | Cat Essentials - 4 Hours |                                              |
      | SERIAL3 | VISION LINK | Cat Basic - 4 Hours      |                                              | Cat Basic - 4 Hours      |                                              |
      | SERIAL4 | VISION LINK | Cat Basic - Hourly       |                                              | Cat Basic - Hourly       |                                              |

  #Update VL Subscriptions
  Scenario Outline: To set different base subscriptions for PL631 device with VISIONLINK application
    When update the subscriptions for the Asset as "<Base Level>", "<Additional Services>" 
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>","<Additional Services>","<Expected Additional Services>" in My Worklist page

    Examples: 
      | S/N     | Services    | Base Level               | Additional Services                          | Expected Base Level      | Expected Additional Services                 |
      | SERIAL1 | VISION LINK | Cat Basic - Hourly       |                                              | Cat Basic - Hourly       |                                              |
      | SERIAL2 | VISION LINK | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring |
      | SERIAL3 | VISION LINK | Cat Essentials - 4 Hours |                                              | Cat Essentials - 4 Hours |                                              |
      | SERIAL4 | VISION LINK | Cat Basic - 4 Hours      |                                              | Cat Basic - 4 Hours      |                                              |
      | SERIAL1 | VISION LINK | Cat Essentials - 4 Hours |                                              | Cat Essentials - 4 Hours |                                              |
      | SERIAL2 | VISION LINK | Cat Basic - 4 Hours      |                                              | Cat Basic - 4 Hours      |                                              |
      | SERIAL3 | VISION LINK | Cat Basic - Hourly       |                                              | Cat Basic - Hourly       |                                              |
      | SERIAL4 | VISION LINK | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring | Cat Essentials - 4 Hours | VisionLink Load and Cycle Project Monitoring |

  #Cancel Updated VL Subscription
  Scenario Outline: To cancel the Updated subscriptions for PL631 device with VISIONLINK application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Base Level>","<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services    | Base Level | Expected Base Level | Cancel Reason                     |
      | SERIAL1 | VISION LINK | None       | None                | End Of Term                       |
      | SERIAL2 | VISION LINK | None       | None                | Machine Sold                      |
      | SERIAL3 | VISION LINK | None       | None                | Subscription Changed              |
      | SERIAL4 | VISION LINK | None       | None                | Subscription Payment Not Received |
