Feature: To check the subscription catlog is displayed correctly for PL641

  @catlogin @PL641 @catlogSync_Part3
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00125" in My Worklist Page

  @catlogin @PL641 @catlogSync_Part3
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL641 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                                                                                          | Dealer                                       | Cat                                          |
      | PL641       | UIT00125 | PRODUCT LINK WEB  | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),                                                                     | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T) |
      | PL641       | UIT00125 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                                              |                                              |
      | PL641       | UIT00125 | EQUIPMENT TRACKER | Cat Daily                                                                                                         |                                              |                                              |

  @catlogin @PL641 @catlogSync_Part3
  Scenario Outline: To chek whether the Add-Ons are displayed properly for PL641 subscriptions
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer                    | Dealer | Cat | Additional Services                          |
      | PL641       | UIT00125 | VISION LINK | Cat Essentials - Hourly     |        |     | VisionLink Load and Cycle Project Monitoring |
      | PL641       | UIT00125 | VISION LINK | Cat Essentials - 10 Minutes |        |     | VisionLink Load and Cycle Project Monitoring |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL641 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                                                                           | Dealer Level Subscription                                                                                             | Cat   Level Subscription |
      | PL641       | UIT00125 | PRODUCT LINK WEB  | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T)                                                                          | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T)                                                                          |                          |
      | PL641       | UIT00125 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - Hourly,Cat Essentials - 10 Minutes | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                          |
      | PL641       | UIT00125 | MY.CAT.COM        | Cat Daily                                                                                                             | Cat Daily                                                                                                             |                          |
      | PL641       | UIT00125 | EQUIPMENT TRACKER | Cat Daily                                                                                                             | Cat Daily                                                                                                             |                          |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL641       | UIT00125 | VISION LINK | Cat Essentials - Hourly     |                           |                        | VisionLink Load and Cycle Project Monitoring |
      | PL641       | UIT00125 | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | VisionLink Load and Cycle Project Monitoring |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL641 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription  >","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                            n>"                                            | Dealer Level Subscription | Cat   Level Subscription |
      | PL641       | UIT00125 | PRODUCT LINK WEB  | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T)                                                                          |                           |                          |
      | PL641       | UIT00125 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                          |
      | PL641       | UIT00125 | MY.CAT.COM        | Cat Daily                                                                                                             |                           |                          |
      | PL641       | UIT00125 | EQUIPMENT TRACKER | Cat Daily                                                                                                             |                           |                          |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                          |
      | PL641       | UIT00125 | VISION LINK | Cat Essentials - Hourly     |                           |                        | VisionLink Load and Cycle Project Monitoring |
      | PL641       | UIT00125 | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | VisionLink Load and Cycle Project Monitoring |
