@US_165 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Payment Preview Popup - Newly Onboarded asset
  This feature is to Verify and Validate Payment Preview Popup and its fields for Newly Onboarded assets

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "SerialNumber =<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |
      |              |

  @CatProfile @US_165 @TC_563 @Positive
  Scenario Outline: To Verify Payment Preview popup is displayed after clicking on "Review & Submit" button in CAT login - #failed for VL and My.cat.com
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup is displayed

    Examples: 
      | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | My.Cat.Com       |                        |                           | Cat Daily                   |                     |

  @CatProfile @US_165 @TC_566 @Positive
  Scenario Outline: To Verify the Payment Preview popup fields for newly subscribed asset in Cat login #UI issues, bug is raised
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI the Payment Preview popup and its fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    Then Verify in UI Submit button,Cancel button are displayed in Payment preview popup

    Examples: 
      | DealerCode | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | B330       | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | H160       | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | N030       |                  |                        |                           |                             |                     |
      | M610       |                  |                        |                           |                             |                     |

  @CatProfile @US_165 @TC_596 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in CAT profile for newly subscribed asset in Cat login #UI issues, bug is raised
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI "Equipment ID:TestAsset","Equipment Serial Number:CAT12345","Asset Make/Model: CAT/7777F", "DeviceType:PLE641"
    And Verify in UI "Device Information= "3682033CR/03737384YD" (Device S/N/Radio S/N)
    And Verify in UI "Dealer="DEMO DEALER TD00 : TD00" (Dealer Name: Dealer Code)
    And Verify in UI "Customer UCID": "CAT PRODUCT LINK E2E HIL TEST - 2969515985"(UCName - UCID) and "Customer DCN": "E2E HIL TEST - QA0E2E" (DCN Name - DCN)
    And Vefiry in UI Subscription information with Dealer level base subscription with rate plan amounts, Contract period end date(if applicable) is displayed
    And Verify  in UI Automatic Renewal OptIn/Optout (if applicable) is displayed
    And Verify in UI Monthly Rate Plan information is Displayed (Total sum of the Subscription and add-on subscription pricing amount)
    And Verify in UI Promotion information is displayed (Promotion information with the discount amount for the selected dealer level subscription and promotion program end date)
    And Verify in UI Monthly Payment info is displayed (Final amount need to be paid by the dealer after the discounts applied)
    And Verify in UI One-time termination fee is displayed (Amount charged for a dealer when he/she cancels the subscription of the asset before the contract period end date)

    Examples: 
      | DealerCode | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | B330       | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | H160       | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | N030       |                  |                        |                           |                             |                     |
      | M610       |                  |                        |                           |                             |                     |

  @CATProfile @US_165 @TC_624 @Negative
  Scenario: To Verify the selected Base and Add on Subscriptions are showing in Payment Preview Popup #paymentpreview popup is not showing for VL and My.cat.com
    When click "Review & Submit" button or link
    Then Verify the selected Base and Add on Subscriptions details are displayed as expected in payment preview popup

  @CatProfile @US_165 @TC_568 @Positive
  Scenario: To Verify the Subscription information after clicking on SUBMIT button in payment preview popup in CAT login
    When Click "Submit" button or link in Payment Preview popup
    Then Verify in UI Subscription has been successfully applied for the asset
    And Verify the message "New Subscription Applied Successfully" is displayed
    And Verify the fields are sent to Zuora application

  @CATProfile @US_165 @TC_598 @Positive
  Scenario Outline: To Verify Contract Period and Renewal Opt-in/Opt-Out dropdown should not visible after subscription is applied successfully in Cat login
    When Subscription is applied successfully for an asset
    Then Verify in UI ContractPeriod and Renewal Opt-in/Opt-Out options should not be visible
    And Verify the fields are sent to Zuora application

  @CatProfile @US_165 @TC_570 @Positive
  Scenario Outline: To Verify the Subscription information after clicking on CANCEL button in Payment Preview Popup in CAT login
    When Set in UI "<DealerCode>"
    And set Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    And Click "Cancel" button in Payment Preview popup
    Then Verify the UI should be redirected to worklist page and the subscription should not become active for the asset
    And vefiry no values should be sent to zuora

    Examples: 
      | DealerCode | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | B330       | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                     |
      | H160       | My.Cat.Com       |                        |                           | Cat Daily                   |                     |
      | N030       |                  |                        |                           |                             |                     |
      | M610       |                  |                        |                           |                             |                     |

  @CATProfile @US_165 @TC_626 @Negative
  Scenario Outline: To Verify the updated Base and Add on Subscriptions are showing in Payment Preview popup in Cat login
    When set Subscription details as "<Services>","<Cat Level Subcription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Updated values of Base and Add on Subscriptions are showing in payment preview popup

    Examples: 
      | Services         | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | Additional Services_1 | Additioanl Services_2                        |  |
      | VisionLink       |                        |                           | Cat Basic - 10 Minutes      | Onboard Analytics     | VisionLink Load and Cycle Project Monitoring |  |
      | Product Link Web | Aide (EC4-14-T)        | Aide (EC4-14-T)           | Vitals (EC1-4)              |                       |                                              |  |
      | My.Cat.Com       |                        |                           | Cat Daily                   |                       |                                              |  |

  #for none check the review and submit button - added
  @CATProfile @US_165 @TC_576 @Negative
  Scenario Outline: To Verify CAT level billing popup is displayed after clicking on Review & Submit for different subscription combinations
    When enter or modify Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>"
    And click "Review & Submit" button or link
    Then Verify in UI Cat Billing popup should be displayed

    Examples: 
      | Serives          | Cat Level Subscription | Dealer Level Subscription | Customer Level Subscription | DealerCode |
      | Product Link Web | Advisor(EC24-54)       | Aide(EC4-14)              |                             | B330       |
      | Product Link Web | Advisor(EC24-54)       |                           |                             | E250       |
      | ProductLink Web  | Advisor(EC24-54)       | Aide(EC4-14)              | Vitals(EC1-4)               | M610       |
      |                  |                        |                           |                             | H160       |
      |                  |                        |                           |                             | N030       |

  @CatProfile @US_165 @TC_ @Positive
  Scenario Outline: To vefiry Review & Submit button is disabled when Subscriptions are none in cat login
    When enter or modify Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>"
    Then Vefiry in UI Review & Submit button is disabled

    Examples: 
      | Services        | Cat  | Dealer | Customer |
      | ProductLink Web | None | None   | None     |

  @DealerProfile @US_165 @TC_565 @Positive
  Scenario Outline: To Verify Payment Preview popup is displayed after clicking on "Review & Submit" button in Dealer login
    When enter or modify Subscription details as "<Services>","<Cat Level Subscription>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup is displayed

    Examples: 
      | Services         | Dealer Level Subscription | Customer       | Base Subscription      | Additional Services |
      | VisionLink       |                           |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T)           | Vitals (EC1-4) |                        |                     |
      | My.Cat.Com       |                           |                | Cat Daily              |                     |

  @DealerProfile @US_165 @TC_567 @Positive
  Scenario Outline: To Verify the Payment Preview popup fields for newly subscribed asset in Dealer login
    When enter or modify Subscription details as "<Services>","<Dealer Level Subscription>","<Customer Level Subscription>","<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI the Payment Preview popup and its fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    Then Verify in UI Submitbutton,Cancelbutton are displayed in Payment preview popup

    Examples: 
      | DealerCode | Services         | Dealer Level Subscription | Customer Level Subscription | Additional Services |
      | B330       | VisionLink       |                           | Cat Basic - 10 Minutes      | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T)           | Vitals(EC1-4)               |                     |
      | H160       | My.Cat.Com       |                           | Cat Daily                   |                     |
      | N030       |                  |                           |                             |                     |
      | M610       |                  |                           |                             |                     |

  @DealerProfile @US_165 @TC_597 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in CAT profile for newly subscribed asset in Dealer login
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI "Equipment ID:TestAsset","Equipment Serial Number:CAT12345","Asset Make/Model: CAT/7777F", "DeviceType:PLE641"
    And Verify in UI "Device Information= "3682033CR/03737384YD" (Device S/N/Radio S/N)
    And Verify in UI "Dealer="DEMO DEALER TD00 : TD00" (Dealer Name: Dealer Code)
    And Verify in UI "Customer UCID": "CAT PRODUCT LINK E2E HIL TEST - 2969515985"(UCName - UCID) and "Customer DCN": "E2E HIL TEST - QA0E2E" (DCN Name - DCN)
    And Vefiry in UI Subscription information with Dealer level base subscription with rate plan amounts, Contract period end date(if applicable) is displayed
    And Verify  in UI Automatic Renewal OptIn/Optout (if applicable) is displayed
    And Verify in UI Monthly Rate Plan information is Displayed (Total sum of the Subscription and add-on subscription pricing amount)
    And Verify in UI Promotion information is displayed (Promotion information with the discount amount for the selected dealer level subscription and promotion program end date)
    And Verify in UI Monthly Payment info is displayed (Final amount need to be paid by the dealer after the discounts applied)
    And Verify in UI One-time termination fee is displayed (Amount charged for a dealer when he/she cancels the subscription of the asset before the contract period end date)

    Examples: 
      | DealerCode | Services         | Dealer          | Customer       | Base Subscription      | Additional Services |
      | B330       | VisionLink       |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | H160       | My.Cat.Com       |                 |                | Cat Daily              |                     |
      | N030       |                  |                 |                |                        |                     |
      | M610       |                  |                 |                |                        |                     |

  @DealerProfile @US_165 @TC_ @Negative
  Scenario: To Verify the selected Base and Add on Subscriptions are showing in Payment Preview Pop
    When click "Review & Submit" button or link
    Then Verify the selected Base and Add on Subscriptions details are displayed as expected in payment preview popup

  @DealerProfile @US_165 @TC_ @Positive
  Scenario: To Verify the Subscription information after clicking on SUBMIT button in payment preview popup in Dealer login
    When Click "Submit" button or link in Payment Preview popup
    Then Verify in UI Subscription has been successfully applied for the asset
    And Verify the message "New Subscription Applied Successfully" is displayed
    And Verify the fields are sent to Zuora application

  @DealerProfile @US_165 @TC_ @Positive
  Scenario Outline: To Verify Contract Period and Renewal Opt-in/Opt-Out dropdown should not visible after subscription is applied successfully in Dealer login
    When Subscription is applied successfully for an asset
    Then Verify in UI ContractPeriod and Renewal Opt-in/Opt-Out options should not be visible
    And Verify the fields are sent to Zuora application

  @DealerProfile @US_165 @TC_ @Positive
  Scenario Outline: To Verify the Subscription information after clicking on CANCEL button in Payment Preview Popup in Dealer login
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    And Click "Cancel" button in Payment Preview popup
    Then Verify the UI should be redirected to worklist page and the subscription should not become active for the asset
    And vefiry no values should be sent to zuora

    Examples: 
      | DealerCode | Services         | Dealer          | Customer       | Base Subscription      | Additional Services |
      | B330       | VisionLink       |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | H160       | My.Cat.Com       |                 |                | Cat Daily              |                     |
      | N030       |                  |                 |                |                        |                     |
      | M610       |                  |                 |                |                        |                     |

  @DealerProfile @US_165 @TC_ @Negative
  Scenario Outline: To Verify the updated Base and Add on Subscriptions are showing in Payment Preview popup in Dealer login
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Updated values of Base and Add on Subscriptions are showing in payment preview popup

    Examples: 
      | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services_1 | Additioanl Services_2                        |
      | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics     | VisionLink Load and Cycle Project Monitoring |
      | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                       |                                              |
      | My.Cat.Com       |                 |                 |                | Cat Daily              |                       |                                              |

  @DealerProfile @US_165 @TC_ @Positive
  Scenario Outline: To vefiry Review & Submit button is disabled when Subscriptions are none in Dealer login
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer=<Customer>"
    Then Vefiry in UI Review & Submit button is disabled

    Examples: 
      | Services        | Dealer | Customer |
      | ProductLink Web | None   | None     |
