Feature: To check the subscription catlog is displayed correctly for PLE631

  @catlogin @PLE631
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00135" in My Worklist Page

  @catlogin @PLE631
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE631 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                     | Dealer                      | Cat                         |
      | PLE631      | UIT00135 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |
      | PLE631      | UIT00135 | VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                             |                             |
      | PLE631      | UIT00135 | MY.CAT.COM        | Cat Daily                                    |                             |                             |
      | PLE631      | UIT00135 | EQUIPMENT TRACKER | Cat Daily                                    |                             |                             |

  @catlogin @PLE631
  Scenario Outline: To verify the addon servvices for the device type PLE631
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services         | Customer                 | Dealer | Cat | Additional Services                                            |
      | PLE631      | UIT00135 | PRODUCT LINK WEB | Vitals (ES1-0)           |        |     | Onboard Analytics                                              |
      | PLE631      | UIT00135 | PRODUCT LINK WEB | Aide (ES4-0)             |        |     | Onboard Analytics                                              |
      | PLE631      | UIT00135 | VISION LINK      | Cat Basic - 4 Hours      |        |     | Onboard Analytics                                              |
      | PLE631      | UIT00135 | VISION LINK      | Cat Essentials - 4 Hours |        |     | Onboard Analytics,VisionLink Load and Cycle Project Monitoring |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE631 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                  | Dealer Level Subscription   | Cat Level Subscription |
      | PLE631      | UIT00135 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  | Vitals (ES1-0),Aide (ES4-0) |                        |
      | PLE631      | UIT00135 | VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                             |                        |
      | PLE631      | UIT00135 | MY.CAT.COM        | Cat Daily                                    |                             |                        |
      | PLE631      | UIT00135 | EQUIPMENT TRACKER | Cat Daily                                    |                             |                        |

  Scenario Outline: To verify the addon servvices for the device type PLE631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                            |
      | PLE631      | UIT00135 | VISION LINK | Cat Basic - 4 Hours         |                           |                        | Onboard Analytics                                              |
      | PLE631      | UIT00135 | VISION LINK | Cat Essentials - 4 Hours    |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE631 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                  | Dealer Level Subscription | Cat Level Subscription |
      | PLE631      | UIT00135 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                  |                           |                        |
      | PLE631      | UIT00135 | VISION LINK       | Cat Basic - 4 Hours,Cat Essentials - 4 Hours |                           |                        |
      | PLE631      | UIT00135 | MY.CAT.COM        | Cat Daily                                    |                           |                        |
      | PLE631      | UIT00135 | EQUIPMENT TRACKER | Cat Daily                                    |                           |                        |

  Scenario Outline: To verify the addon servvices for the device type PLE631
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                            |
      | PLE631      | UIT00135 | VISION LINK | Cat Basic - 4 Hours         |                           |                        | Onboard Analytics                                              |
      | PLE631      | UIT00135 | VISION LINK | Cat Essentials - 4 Hours    |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring |
