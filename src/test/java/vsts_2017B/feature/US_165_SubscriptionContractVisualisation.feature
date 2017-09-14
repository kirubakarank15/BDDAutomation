@US_165 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Payment Preview Popup - Newly Onboarded asset
  This feature is to Verify and Validate Payment Preview Popup and its fields for Newly Onboarded assets while Setting Subscription

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  @CatProfile @US_165 @TC_563 @Positive
  Scenario Outline: To Verify Payment Preview popup is displayed after click on "Review & Submit" button in CAT login
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview popup is displayed

    Examples: 
      | Device Type | S/N      | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | PLE641      | AUT10011 | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |

  @DealerProfile @US_165 @TC_565 @Positive
  Scenario Outline: To Verify Payment Preview popup is displayed after click on "Review & Submit" button in Dealer login
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    When search Asset details as "S/N =<S/N>" in My Worklist Page
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview popup is displayed

    Examples: 
      | Device Type | S/N      | Services         | Dealer          | Customer       | Base Subscription      | Additional Services |
      | PLE641      | AUT10011 | VisionLink       |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | PLE641      | AUT10011 | Product Link Web | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |

  @CatProfile @US_165 @TC_566 @Positive
  Scenario Outline: To Verify the Payment Preview popup fields in CAT profile for newly subscribed asset
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI the Payment Preview popup and its fields "EquipmentId.isDisplayed=true", "EquipmentSerialNumber.isDisplayed=true", "Asset Make/Model.isDisplayed=true", "DeviceType.isDisplayed=true", "DeviceInformation.isDisplayed=true","CustomerUCID.isDisplayed=true","CustomerDCN.isDisplayed=true","Subscriptioninformation.isDisplayed=true","AdditionalServices_isDisplayed=true","MonthlyRatePlan.isDipslayed=true","PromotionDetails.isDisplayed=true","MonthlyPaymentdetails.isDisplayed=true","OneTimeTerminationfeeDetails.isDisplayed=true"
    Then Verify in UI "Submitbutton.isDisplayed=true","Cancelbutton.isDisplayed=true"
      | DealerCode | S/N |
      | B330       |     |
      | E250       |     |
      | H160       |     |
      | N030       |     |
      | M610       |     |

  @CatProfile @US_165 @TC_596 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in CAT profile for newly subscribed asset
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
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

  @DealerProfile @US_165 @TC_567 @Positive
  Scenario Outline: To Verify the Payment Preview popup fields in Dealer profile for newly subscribed asset
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI the Payment Preview popup and its fields "EquipmentId.isDisplayed=true", "EquipmentSerialNumber.isDisplayed=true", "Asset Make/Model.isDisplayed=true", "DeviceType.isDisplayed=true", "DeviceInformation.isDisplayed=true","CustomerUCID.isDisplayed=true","CustomerDCN.isDisplayed=true","Subscription.isDisplayed=true","AdditionalServices_isDisplayed=true","MonthlyRatePlan.isDipslayed=true","PromotionDetails.isDisplayed=true","MonthlyPaymentdetails.isDisplayed=true","OneTimeTerminationfeeDetails.isDisplayed=true"
    Then Verify in UI "Submitbutton.isDisplayed=true","Cancelbutton.isDisplayed=true"

  @DealerProfile @US_165 @TC_597 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in Dealer profile for newly subscribed asset
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
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

  @CatProfile @US_165 @TC_568 @Positive
  Scenario Outline: To Verify the Subscription info after clicking on SUBMIT button in payment preview popup in CAT login
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup fields
    And Click "Submit" button
    Then verify the message "New Subscription Applied Successfully" is displayed

  @DealerProfile @US_165 @TC_569 @Positive
  Scenario Outline: To Verify the Subscription info after clicking on SUBMIT button in Payment Preview Popup in Dealer login
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Previre Popup fields
    And Click "Submit" button
    Then verify the message "New Subscription Applied Successfully" is displayed

  @CATProfile @US_165 @TC_598 @Positive
  Scenario Outline: To Verify Contract Period and Renewal Opt-in/Opt-Out dropdown should not appear after subscription is sucessfull in Cat login
    When Navigate to "My worklist"
    And Logged in CATProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup fields
    And Click "Submit" button
    Then Vefiry in UI "Contract Period" & "Renewal Opt-In / Out" drop-down should not appear in the worklist after subscription becomes active

 @DealerProfile @US_165 @TC_599 @Positive
  Scenario Outline: To Verify Contract Period and Renewal Opt-in/Opt-Out dropdown should not appear after subscription is sucessfull in Dealer login
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup fields
    And Click "Submit" button
    Then Vefiry in UI "Contract Period" & "Renewal Opt-In / Out" drop-down should not appear in the worklist after subscription becomes active

  @CatProfile @US_165 @TC_570 @Positive
  Scenario Outline: To Verify the functionality after click on CANCEL button in Payment Preview Popup in CAT login
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Previre Popup fields
    And Click "Cancel" button
    Then Verify the UI should be redirected to worklist page and the subscription should not become active for the asset

  @DealerProfile @US_165 @TC_571 @Positive
  Scenario Outline: To Verify the functionality after click on CANCEL button in Payment Preview Popup in Dealer login
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Previre Popup fields
    And Click "Cancel" button
    Then Verify in UI should be redirected to worklist page and the subscription should not become active for the asset

  @CATProfile @US_165 @TC_576 @Negative
  Scenario Outline: To Verify CAT level billing popup is displayed after click on Review & Submit
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI "CatBilling_popup.isDisplayed=true"
