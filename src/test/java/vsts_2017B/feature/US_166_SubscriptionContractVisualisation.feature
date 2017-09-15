@US_166 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Payment Preview Popup of existing subscribed asset
  This feature is to Verify and Validate Payment Preview Popup and its fields for existing subsribed assets while changing Subscription

  Scenario: Navigate to My Worklist
    Given Login into DSP Portal

  #Refer US_165 for more scenarios to be tested
  #@TC_563, @TC_565, @TC_566, @TC_567, @TC_568, @TC_569, 598,599, 576
  
  @CatProfile @US_166 @TC_604 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in CAT profile for already subscribed asset
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI "Equipment ID:TestAsset","Equipment Serial Number:CAT12345","Asset Make/Model: CAT/7777F", "DeviceType:PLE641"
    And Verify in UI "Device Information= "3682033CR/03737384YD" (Device S/N/Radio S/N)
    And Verify in UI "Dealer="DEMO DEALER TD00 : TD00" (Dealer Name: Dealer Code)
    And Verify in UI "Customer UCID": "CAT PRODUCT LINK E2E HIL TEST - 2969515985"(UCName - UCID) and "Customer DCN": "E2E HIL TEST - QA0E2E" (DCN Name - DCN)
    And Vefiry in UI Subscription information with Dealer level base subscription with rate plan amounts, Contract period end date(if applicable) of both Current Subscription and New Subscription is displayed
    And Verify  in UI Automatic Renewal OptIn/Optout (if applicable) of both Current Subscription and New Subscription is displayed
    And Verify in UI Monthly Rate Plan information of both Current Subscription and New Subscription is Displayed (Total sum of the Subscription and add-on subscription pricing amount)
    And Verify in UI Promotion information of both Current Subscription and New Subscription is displayed (Promotion information with the discount amount for the selected dealer level subscription and promotion program end date)
    And Verify in UI Monthly Payment info of both Current Subscription and New Subscription is displayed (Final amount need to be paid by the dealer after the discounts applied)
    And Verify in UI One-time termination fee is displayed (Amount charged for a dealer when he/she cancels the subscription of the asset before the contract period end date)

    @DealerProfile @US_166 @TC_605 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in Dealer profile for already subscribed asset
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI "Equipment ID:TestAsset","Equipment Serial Number:CAT12345","Asset Make/Model: CAT/7777F", "DeviceType:PLE641"
    And Verify in UI "Device Information= "3682033CR/03737384YD" (Device S/N/Radio S/N)
    And Verify in UI "Dealer="DEMO DEALER TD00 : TD00" (Dealer Name: Dealer Code)
    And Verify in UI "Customer UCID": "CAT PRODUCT LINK E2E HIL TEST - 2969515985"(UCName - UCID) and "Customer DCN": "E2E HIL TEST - QA0E2E" (DCN Name - DCN)
    And Vefiry in UI Subscription information with Dealer level base subscription with rate plan amounts, Contract period end date(if applicable) of both Current Subscription and New Subscription is displayed
    And Verify  in UI Automatic Renewal OptIn/Optout (if applicable) of both Current Subscription and New Subscription is displayed
    And Verify in UI Monthly Rate Plan information of both Current Subscription and New Subscription is Displayed (Total sum of the Subscription and add-on subscription pricing amount)
    And Verify in UI Promotion information of both Current Subscription and New Subscription is displayed (Promotion information with the discount amount for the selected dealer level subscription and promotion program end date)
    And Verify in UI Monthly Payment info of both Current Subscription and New Subscription is displayed (Final amount need to be paid by the dealer after the discounts applied)
    And Verify in UI One-time termination fee is displayed (Amount charged for a dealer when he/she cancels the subscription of the asset before the contract period end date)
    
     @CatProfile @US_166 @TC_611 @Positive
  Scenario Outline: To Verify the Subscription info after click on CANCEL button in Payment Preview Popup in CAT login
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup fields
    And Click "Cancel" button
    Then Verify the UI should be redirected to worklist page and the subscription should not become active for the asset
    And Verify "OldSubscription.isDisplayed=true"
    
     @DealerProfile @US_166 @TC_612 @Positive
  Scenario Outline: To Verify the Subscription info after click on CANCEL button in Payment Preview Popup in Dealer login
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Preview Popup fields
    And Click "Cancel" button
    Then Verify the UI should be redirected to worklist page and the subscription should not become active for the asset
    And Verify "OldSubscription.isDisplayed=true"
    
    
    