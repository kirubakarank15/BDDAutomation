@Regression @PL631_SetSubscriptions
Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  @Services
  Scenario Outline: To set different base subscrip	tions for PL631 device with VISIONLINK application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>","<Additional Services>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N     | Services    | Base Level                  | Additional Services                          | Expected Base Level         |
      | SERIAL1 | VISION LINK | Cat Basic - Hourly          |                                              | Cat Basic - Hourly          |
      | SERIAL2 | VISION LINK | Cat Essentials - 4 Hours    |                                              | Cat Essentials - 4 Hours    |
      | SERIAL3 | VISION LINK | Cat Essentials - 10 Minutes |                                              | Cat Essentials - 10 Minutes |
      | SERIAL4 | VISION LINK | Cat Essentials - 4 Hours    | VisionLink Load and Cycle Project Monitoring | Cat Essentials - 4 Hours    |

  #cancelSubscription
  Scenario Outline: To cancel the subscriptions for PL631 device with VISIONLINK application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services    | Base Level | Expected Base Level | Cancel Reason |
      | SERIAL1 | VISION LINK | None       | None                | End Of Term   |
      | SERIAL2 | VISION LINK | None       | None                | End Of Term   |
      | SERIAL3 | VISION LINK | None       | None                | End Of Term   |

  Scenario Outline: To set different subscriptions for PL631 device with MY.CAT.COM   application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services   | Base Level | Expected Base Level |
      | SERIAL4 | MY.CAT.COM | Cat Daily  | Cat Daily           |

  #cancelSubscription
  Scenario Outline: To cancel the subscriptions for PL631 device with MY.CAT.COM  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services   | Base Level | Expected Base Level | Cancel Reason |
      | SERIAL4 | MY.CAT.COM | None       | None                | End Of Term   |

  Scenario Outline: To set different subscriptions for PL631 device with EQUIPMENT TRACKER  application
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Base Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services          | Base Level | Expected Base Level |
      | SERIAL5 | EQUIPMENT TRACKER | Cat Daily  | Cat Daily           |

  #cancelSubscription
  Scenario Outline: To cancel the subscriptions for PL631 device with MY.CAT.COM  application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Base Level>" in My Worklist page

    Examples: 
      | S/N     | Services          | Base Level | Expected Base Level | Cancel Reason |
      | SERIAL5 | EQUIPMENT TRACKER | None       | None                | End Of Term   |

  Scenario Outline: To set different subscriptions for PL631 device with  PRODUCT LINK WEB   application and check the INHERITANCE logic.
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N     | Services         | Customer Level | Dealer Level | Cat Level | Additional Services | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL6 | PRODUCT LINK WEB | Vitals (ES1-0) |              |           |                     | Vitals (ES1-0)          | Vitals (ES1-0)        | Vitals (ES1-0)     |
      | SERIAL7 | PRODUCT LINK WEB | Aide (ES4-0)   |              |           |                     | Aide (ES4-0)            | Aide (ES4-0)          | Aide (ES4-0)       |
      | SERIAL8 | PRODUCT LINK WEB | Vitals (ES1-0) | Aide (ES4-0) |           |                     | Vitals (ES1-0)          | Aide (ES4-0)          | Aide (ES4-0)       |

  Scenario Outline: To check whether the user is able to set higher subscription at CAT level for PL631 device
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>","<Account Number>","<Account Contact> " from billing Pop Up
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N     | Services         | Customer Level | Dealer Level   | Cat Level    | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL9 | PRODUCT LINK WEB | Vitals (ES1-0) | Vitals (ES1-0) | Aide (ES4-0) |                     | NULL         |                |                 | Vitals (ES1-0)          | Vitals (ES1-0)        | Aide (ES4-0)       |

  Scenario Outline: To check whether the user is able to set subscription for CAT  alone
    When search Asset details as "<S/N>" in My Worklist Page
    And Set Subscription details as "<Services>","<Customer Level>","<Dealer Level>","<Cat Level>"
    And select account name "<Account Name>","<Account Number>","Account Contact " from billing Pop Up
    And submit subscription details
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level | Cat Level      | Additional Services | Account Name | Account Number | Account Contact | Expected Customer Level | Expected Dealer Level | Expected Cat Level |
      | SERIAL10 | PRODUCT LINK WEB |                |              | Vitals (ES1-0) |                     | NULL         |                |                 | None                    | None                  | Vitals (ES1-0)     |

  #Suspend scenario needs to b added
  #need to discuss on Update scenario.
  #cancelSubscription
  Scenario Outline: To cancel the subscriptions at Customer and Cat level for PL631 device with PRODUCT LINK WEB application
    When search Asset details as "<S/N>" in My Worklist Page
    And cancel subscription by selecting reason as "<Cancel Reason>"
    And search Asset details as "<S/N>" in My Worklist Page
    Then Verify Subscription details are displayed with "<Services>","<Expected Customer Level>","<Expected Dealer Level>","<Expected Cat Level>","<Additional Services>" in My Worklist page

    Examples: 
      | S/N      | Services         | Customer Level | Dealer Level | Cat Level | Additional Services | Expected Customer Level | Expected Dealer Level | Expected Cat Level | Cancel Reason |
      | SERIAL6  | PRODUCT LINK WEB | None           |              |           |                     | None                    | None                  | None               | End Of Term   |
      | SERIAL7  | PRODUCT LINK WEB | None           |              |           |                     | None                    | None                  | None               | End Of Term   |
      | SERIAL8  | PRODUCT LINK WEB | None           | None         |           |                     | None                    | None                  | None               | End Of Term   |
      | SERIAL9  | PRODUCT LINK WEB | None           |              | None      |                     | None                    | None                  | None               | End Of Term   |
      | SERIAL10 | PRODUCT LINK WEB |                |              | None      |                     | None                    | None                  | None               | End Of Term   |
