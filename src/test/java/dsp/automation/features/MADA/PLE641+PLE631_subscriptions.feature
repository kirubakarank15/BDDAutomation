Feature: To check the subscription catlog is displayed correctly for PLE641+631

  @catlogin @PLE641+PLE631 @catlogSync_Part4
  Scenario: Naviagation and searching the asset details
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed
    When search Asset details as "UIT00129" in My Worklist Page

  @catlogin @PLE641+PLE631 @catlogSync_Part4
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE641+PLE631 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type   | S/N      | Services          | Customer                                                                                                                                                                                   | Dealer                                                                                                                                                                                     | Cat                                                                                                                                                                                        |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB  | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) |
      | PLE641+PLE631 | UIT00129 | VISION LINK       | Cat Essentials - Dual Mode                                                                                                                                                                 |                                                                                                                                                                                            |                                                                                                                                                                                            |
      | PLE641+PLE631 | UIT00129 | MY.CAT.COM        | Cat Daily                                                                                                                                                                                  |                                                                                                                                                                                            |                                                                                                                                                                                            |
      | PLE641+PLE631 | UIT00129 | EQUIPMENT TRACKER | Cat Daily                                                                                                                                                                                  |                                                                                                                                                                                            |                                                                                                                                                                                            |
 
  @catlogin @PLE641+PLE631 @catlogSync_Part4
  Scenario Outline:  To chek whether the Add-Ons are displayed properly for PLE641+PLE631 subscriptions
    #When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type   | S/N      | Services         | Customer                   | Dealer | Cat                        | Additional Services                                            |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Vitals (EC1-4 & S1-0)      | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Vitals (EC1-4 & S0-0)      | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Aide (EC4-14 & S4-0)       | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Aide (EC4-14 & S0-0)       | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Aide (EC4-14-T & S0-0)     | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Advisor (EC24-54 & S24-0)  | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Advisor (EC24-54 & S0-0)   | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB |                            |        | Advisor (EC24-54-T & S0-0) | Onboard Analytics                                              |
      | PLE641+PLE631 | UIT00129 | VISION LINK      | Cat Essentials - Dual Mode |        |                            | Onboard Analytics,VisionLink Load and Cycle Project Monitoring |

  @dealerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE641+PLE631 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type   | S/N      | Services          | Customer Level Subscription                                                                                                                                                                | Dealer Level Subscription                                                                                                                                                                  | Cat Level Subscription |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB  | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) |                        |
      | PLE641+PLE631 | UIT00129 | VISION LINK       | Cat Essentials - Dual Mode                                                                                                                                                                 |                                                                                                                                                                                            |                        |
      | PLE641+PLE631 | UIT00129 | MY.CAT.COM        | Cat Daily                                                                                                                                                                                  |                                                                                                                                                                                            |                        |
      | PLE641+PLE631 | UIT00129 | EQUIPMENT TRACKER | Cat Daily                                                                                                                                                                                  |                                                                                                                                                                                            |                        |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type   | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                            |
      | PLE641+PLE631 | UIT00129 | VISION LINK | Cat Essentials - Dual Mode  |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring |

  @customerlogin
  Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PLE641+PLE631 when logged in as CAT.
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service

    Examples: 
      | Device Type   | S/N      | Services          | Customer Level Subscription                                                                                                                                                                | Dealer Level Subscription | Cat Level Subscription |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB  | Vitals (EC1-4 & S1-0),Vitals (EC1-4 & S0-0),Aide (EC4-14 & S4-0),Aide (EC4-14 & S0-0),Aide (EC4-14-T & S0-0),Advisor (EC24-54 & S24-0),Advisor (EC24-54 & S0-0),Advisor (EC24-54-T & S0-0) |                           |                        |
      | PLE641+PLE631 | UIT00129 | VISION LINK       | Cat Essentials - Dual Mode                                                                                                                                                                 |                           |                        |
      | PLE641+PLE631 | UIT00129 | MY.CAT.COM        | Cat Daily                                                                                                                                                                                  |                           |                        |
      | PLE641+PLE631 | UIT00129 | EQUIPMENT TRACKER | Cat Daily                                                                                                                                                                                  |                           |                        |

  Scenario Outline: To
    When search Asset details as "<S/N>" in My Worklist Page
    And select the services as "<Services>" from subscriptions page
    And select the subscriptions as "<Customer>","<Dealer>","<Cat>"
    Then verify whether the Add-On services are displayed as "<Additional Services>"

    Examples: 
      | Device Type   | S/N      | Services    | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription | Additional Services                                            |
      | PLE641+PLE631 | UIT00129 | VISION LINK | Cat Essentials - Dual Mode  |                           |                        | Onboard Analytics,VisionLink Load and Cycle Project Monitoring |
