Feature: To check the subscription catlog is displayed correctly for PL241

  @catlogin @PL241 @catlogSync_Part2
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00122" in My Worklist Page

  @catlogin @PL241 @catlogSync_Part2
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL241 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                                                                      | Dealer                  | Cat                     |
      | PL241       | UIT00122 | PRODUCT LINK WEB  | Basic Vitals,Basic Aide                                                                       | Basic Vitals,Basic Aide | Basic Vitals,Basic Aide |
      | PL241       | UIT00122 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                         |                         |
      | PL241       | UIT00122 | MY.CAT.COM        | Cat Daily                                                                                     |                         |                         |
      | PL241       | UIT00122 | EQUIPMENT TRACKER | Cat Daily                                                                                     |                         |                         |

  @catlogin @PL241
  Scenario Outline: To chek whether the Add-Ons are displayed properly for PL241 subscriptions
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer                    | Dealer | Cat | Additional Services                          |
      | PL241       | UIT00122 | VISION LINK | Cat Essentials - Hourly     |        |     | VisionLink Load and Cycle Project Monitoring |
      | PL241       | UIT00122 | VISION LINK | Cat Essentials - 10 Minutes |        |     | VisionLink Load and Cycle Project Monitoring |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL241 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                                                                      | Dealer                  | Cat |
      | PL241       | UIT00122 | PRODUCT LINK WEB  | Basic Vitals,Basic Aide                                                                       | Basic Vitals,Basic Aide |     |
      | PL241       | UIT00122 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                         |     |
      | PL241       | UIT00122 | MY.CAT.COM        | Cat Daily                                                                                     |                         |     |
      | PL241       | UIT00122 | EQUIPMENT TRACKER | Cat Daily                                                                                     |                         |     |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer                    | Dealer | Cat |                                              |
      | PL241       | UIT00122 | VISION LINK | Cat Essentials - Hourly     |        |     | VisionLink Load and Cycle Project Monitoring |
      | PL241       | UIT00122 | VISION LINK | Cat Essentials - 10 Minutes |        |     | VisionLink Load and Cycle Project Monitoring |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL241 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N      | Services          | Customer                                                                                      | Dealer | Cat |
      | PL241       | UIT00122 | PRODUCT LINK WEB  | Basic Vitals,Basic Aide                                                                       |        |     |
      | PL241       | UIT00122 | VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |        |     |
      | PL241       | UIT00122 | MY.CAT.COM        | Cat Daily                                                                                     |        |     |
      | PL241       | UIT00122 | EQUIPMENT TRACKER | Cat Daily                                                                                     |        |     |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N      | Services    | Customer                    | Dealer | Cat |                                              |
      | PL241       | UIT00122 | VISION LINK | Cat Essentials - Hourly     |        |     | VisionLink Load and Cycle Project Monitoring |
      | PL241       | UIT00122 | VISION LINK | Cat Essentials - 10 Minutes |        |     | VisionLink Load and Cycle Project Monitoring |
