Feature: To check the subscription catlog is displayed correctly for PLE742
  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  @catlogin @PLE742
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE742 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat Level Subscription |
      | PLE742      |UIT00131| VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                        |
      | PLE742      |UIT00131| MY.CAT.COM        | Cat Daily                                                                                     |                           |                        |
      | PLE742      |UIT00131| EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                        |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                                  |
      | PLE742      |UIT00131| VISION LINK | Cat Basic - Hourly          |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      |UIT00131| VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      |UIT00131| VISION LINK | Cat Essentials - Hourly     |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE742      |UIT00131| VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |

  
  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE742 when logged in as Dealer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat Level Subscription |
      | PLE742      |UIT00131| VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                        |
      | PLE742      |UIT00131| MY.CAT.COM        | Cat Daily                                                                                     |                           |                        |
      | PLE742      |UIT00131| EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                        |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                                  |
      | PLE742      |UIT00131| VISION LINK | Cat Basic - Hourly          |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      |UIT00131| VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      |UIT00131| VISION LINK | Cat Essentials - Hourly     |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE742      |UIT00131| VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE742 when logged in as Customer.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"  are populated according to the selected service

    Examples: 
      | Device Type | S/N  | Services          | Customer Level Subscription                                                                   | Dealer Level Subscription | Cat Level Subscription |
      | PLE742      |UIT00131| VISION LINK       | Cat Basic - Hourly,Cat Basic - 10 Minutes,Cat Essentials - Hourly,Cat Essentials - 10 Minutes |                           |                        |
      | PLE742      |UIT00131| MY.CAT.COM        | Cat Daily                                                                                     |                           |                        |
      | PLE742      |UIT00131| EQUIPMENT TRACKER | Cat Daily                                                                                     |                           |                        |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer Level Subscription>","<Dealer Level Subscription>","<Cat Level Subscription>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type | S/N  | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                                                  |
      | PLE742      |UIT00131| VISION LINK | Cat Basic - Hourly          |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      |UIT00131| VISION LINK | Cat Basic - 10 Minutes      |                           |                        | Advanced Productivity,Onboard Analytics                                              |
      | PLE742      |UIT00131| VISION LINK | Cat Essentials - Hourly     |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
      | PLE742      |UIT00131| VISION LINK | Cat Essentials - 10 Minutes |                           |                        | Advanced Productivity,VisionLink Load and Cycle Project Monitoring,Onboard Analytics |
