Feature: To check the subscription catlog is displayed correctly for PLE641

  @catlogin @PLE641 @catlogSync_Part4
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00134" in My Worklist Page

  @catlogin @PLE641 @catlogSync_Part4
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE641 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services                | Customer                                                                                                                 | Dealer                                                                                                                   | Cat                                                                                                                                                                           |
      | PLE641      | UIT00134 | PRODUCT LINK WEB        | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T),Advisor Streaming,ECA Batch Data Service (E C24 ECA) |
      | PLE641      | UIT00134 | VISION LINK             | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes                            |                                                                                                                          |                                                                                                                                                                               |
      | PLE641      | UIT00134 | MY.CAT.COM              | Cat Daily                                                                                                                |                                                                                                                          |                                                                                                                                                                               |
      | PLE641      | UIT00134 | EQUIPMENT TRACKER       | Cat Daily                                                                                                                |                                                                                                                          |                                                                                                                                                                               |
      | PLE641      | UIT00134 | PRODUCT LINK GENERATION |                                                                                                         |                                                                                                                          |Base,Comp,Custom                                                                                                                                                                                |

  #PLG is for cat level
  @catlogin @PLE641 @catlogSync_Part4
  Scenario Outline:  To chek whether the Add-Ons are displayed properly for PLE641 subscriptions
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services         | Customer                    | Dealer | Cat                 | Additional Services                                                              |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Vitals (EC1-4)      | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Aide (EC4-14)       | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Aide (EC4-14-T )    | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Advisor (EC24-54 )  | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Advisor (EC24-104)  | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Advisor (EC24-204)  | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | PRODUCT LINK WEB |                             |        | Advisor (EC24-54-T) | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK      | Cat Basic - Hourly          |        |                     | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK      | Cat Basic - 10 Minutes      |        |                     | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK      | Cat Essentials - Hourly     |        |                     | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE641      | UIT00134 | VISION LINK      | Cat Essentials - 10 Minutes |        |                     | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE641 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services                | Customer Level Subscription                                                                                              | Dealer Level Subscription                                                                                                | Cat Level Subscription |
      | PLE641      | UIT00134 | PRODUCT LINK WEB        | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) |                        |
      | PLE641      | UIT00134 | VISION LINK             | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes                            |                                                                                                                          |                        |
      | PLE641      | UIT00134 | MY.CAT.COM              | Cat Daily                                                                                                                |                                                                                                                          |                        |
      | PLE641      | UIT00134 | EQUIPMENT TRACKER       | Cat Daily                                                                                                                |                                                                                                                          |                        |
      | PLE641      | UIT00134 | PRODUCT LINK GENERATION | Base,Comp,Custom                                                                                                         |                                                                                                                          |                        |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                              |
      | PLE641      | UIT00134 | VISION LINK | Cat Basic - Hourly          |                           |                        | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK | Cat Essentials - Hourly     |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE641      | UIT00134 | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |

  #PLG is for cat level
  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE641 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services                | Customer Level Subscription                                                                                              | Dealer Level Subscription | Cat Level Subscription |
      | PLE641      | UIT00134 | PRODUCT LINK WEB        | Vitals (EC1-4),Aide (EC4-14),Aide (EC4-14-T),Advisor (EC24-54),Advisor (EC24-104),Advisor (EC24-204),Advisor (EC24-54-T) |                           |                        |
      | PLE641      | UIT00134 | VISION LINK             | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes                            |                           |                        |
      | PLE641      | UIT00134 | MY.CAT.COM              | Cat Daily                                                                                                                |                           |                        |
      | PLE641      | UIT00134 | EQUIPMENT TRACKER       | Cat Daily                                                                                                                |                           |                        |
      | PLE641      | UIT00134 | PRODUCT LINK GENERATION | Base,Comp,Custom                                                                                                         |                           |                        |

  #PLG is for cat level
  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                              |
      | PLE641      | UIT00134 | VISION LINK | Cat Basic - Hourly          |                           |                        | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Onboard Analytics                                                                |
      | PLE641      | UIT00134 | VISION LINK | Cat Essentials - Hourly     |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE641      | UIT00134 | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
