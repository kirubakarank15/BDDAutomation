Feature: To check the subscription catlog is displayed correctly for PLE642

  @catlogin @PLE642 @catlogSync_Part4
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00130" in My Worklist Page

  @catlogin @PLE642 @catlogSync_Part4
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE642 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                                                                      | Dealer | Cat |
      | PLE642      | UIT00130 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |        |     |
      | PLE642      | UIT00130 | MY.CAT.COM        | Cat Daily                                                                                     |        |     |
      | PLE642      | UIT00130 | EQUIPMENT TRACKER | Cat Daily                                                                                     |        |     |

  @catlogin @PLE642 @catlogSync_Part4
  Scenario Outline: To chek whether the Add-Ons are displayed properly for PLE642 subscriptions
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer                    | Dealer | Cat | Additional Services                                                              |
      | PLE642      | UIT00130 | VISION LINK | Cat Basic - Hourly          |        |     | Onboard Analytics                                                                |
      | PLE642      | UIT00130 | VISION LINK | Cat Basic - 10 Minutes      |        |     | Onboard Analytics                                                                |
      | PLE642      | UIT00130 | VISION LINK | Cat Essentials - Hourly     |        |     | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE642      | UIT00130 | VISION LINK | Cat Essentials - 10 Minutes |        |     | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE642 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat  Level Subscription |
      | PLE642      | UIT00130 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                         |
      | PLE642      | UIT00130 | MY.CAT.COM        | Cat Daily                                                                                     |                           |                         |
      | PLE642      | UIT00130 | EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                         |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                              |
      | PLE642      | UIT00130 | VISION LINK | Cat Basic - Hourly          |                           |                        | Onboard Analytics                                                                |
      | PLE642      | UIT00130 | VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Onboard Analytics                                                                |
      | PLE642      | UIT00130 | VISION LINK | Cat Essentials - Hourly     |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE642      | UIT00130 | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE642 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat  Level Subscription |
      | PLE642      | UIT00130 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                         |
      | PLE642      | UIT00130 | MY.CAT.COM        | Cat Daily                                                                                     |                           |                         |
      | PLE642      | UIT00130 | EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                         |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                              |
      | PLE642      | UIT00130 | VISION LINK | Cat Basic - Hourly          |                           |                        | Onboard Analytics                                                                |
      | PLE642      | UIT00130 | VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Onboard Analytics                                                                |
      | PLE642      | UIT00130 | VISION LINK | Cat Essentials - Hourly     |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE642      | UIT00130 | VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
