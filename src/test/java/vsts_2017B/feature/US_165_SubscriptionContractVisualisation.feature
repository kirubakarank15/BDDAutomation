@US_165 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Payment Preview Popup - Newly Onboarded asset
  This feature is to Verify Subscription Contract Visualization for CAT/Dealer Profiles in DSP

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
  Scenario Outline: To Verify the Payment Preview popup fields in CAT profile
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI the Payment Preview popup and its fields "EquipmentId.isDisplayed=true", "EquipmentSerialNumber.isDisplayed=true", "Asset Make/Model.isDisplayed=true", "DeviceType.isDisplayed=true", "DeviceInformation.isDisplayed=true","CustomerUCID.isDisplayed=true","CustomerDCN.isDisplayed=true","Subscriptioninformation.isDisplayed=true","AdditionalServices_isDisplayed=true","MonthlyRatePlan.isDipslayed=true","PromotionDetails.isDisplayed=true","MonthlyPaymentdetails.isDisplayed=true","OneTimeTerminationfeeDetails.isDisplayed=true"
    Then Verify in UI "Submitbutton.isDisplayed=true","Cancelbutton.isDisplayed=true"
    Then Verify in UI "Deviceinformation.format="Device S/N/Radio S/N" :"3682033CR/03737384YD""

  @DealerProfile @US_165 @TC_567 @Positive
  Scenario Outline: To Verify the Payment Preview popup fields in Dealer profile
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI the Payment Preview popup and its fields "EquipmentId.isDisplayed=true", "EquipmentSerialNumber.isDisplayed=true", "Asset Make/Model.isDisplayed=true", "DeviceType.isDisplayed=true", "DeviceInformation.isDisplayed=true","CustomerUCID.isDisplayed=true","CustomerDCN.isDisplayed=true","Subscription.isDisplayed=true","AdditionalServices_isDisplayed=true","MonthlyRatePlan.isDipslayed=true","PromotionDetails.isDisplayed=true","MonthlyPaymentdetails.isDisplayed=true","OneTimeTerminationfeeDetails.isDisplayed=true"
    Then Verify in UI "Submitbutton.isDisplayed=true","Cancelbutton.isDisplayed=true"

  @CatProfile @US_165 @TC_568 @Positive
  Scenario Outline: To Verify the functionality after click on SUBMIT button in payment preview popup in CAT login
    When Navigate to "My worklist"
    And Logged in CatProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Previre Popup fields
    And Click "Submit" button
    Then verify the message "New Subscription Applied Successfully" is displayed

  @DealerProfile @US_165 @TC_569 @Positive
  Scenario Outline: To Verify the functionality after click on SUBMIT button in Payment Preview Popup in Dealer login
    When Navigate to "My worklist"
    And Logged in DealerProfile as "<Dealercode>"
    Then Verify Subscription details should be displayed with "S/N =<S/N>" in My Worklist page
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    Then Verify in UI Payment Previre Popup fields
    And Click "Submit" button
    Then verify the message "New Subscription Applied Successfully" is displayed

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
