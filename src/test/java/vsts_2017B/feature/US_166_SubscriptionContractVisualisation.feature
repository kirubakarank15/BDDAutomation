@US_166 @DSP @2017B @SubscriptionContractVisualization
Feature: Subscription Contract Visualization -  Payment Preview Popup of existing subscribed asset
  This feature is to Verify and Validate Payment Preview Popup and its fields for existing subsribed assets while changing Subscription

  Scenario Outline: Navigate to My Worklist and Search for an asset
    Given Login into DSP Portal
    When Navigate to "My worklist"
    And search Asset details as "SerialNumber =<SerialNumber>" in My Worklist Page
    Then Verify Subscription details should be displayed with "SerialNumber =<SerialNumber>" in My Worklist page

    Examples: 
      | SerialNumber |
      |              |
      |              |

  #Refer US_165 for more scenarios to be tested
  #@TC_563, @TC_565, @TC_566, @TC_567, @TC_568, @TC_569, @TC_598,@TC_599, @TC_576
  #compare the values of old subscription with zuora
  @CatProfile @US_166 @TC_604 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in CAT profile for already subscribed asset
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
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

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | B330       | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | H160       | My.Cat.Com       |                 |                 |                | Cat Daily              |                     |
      | N030       |                  |                 |                 |                |                        |                     |
      | M610       |                  |                 |                 |                |                        |                     |

  @CatProfile @US_166 @TC_611 @Positive
  Scenario Outline: To Verify the Subscription info after click on CANCEL button in Payment Preview Popup in CAT login
    When Set in UI "DealerCode=<DealerCode>"
    And enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    And Click "Cancel" button in Payment Preview popup
    Then Verify the UI should be redirected to worklist page and the new subscription should not become active for the asset
    And Verify in UI Old subscription should be retained for the asset

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | B330       | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | H160       | My.Cat.Com       |                 |                 |                | Cat Daily              |                     |
      | N030       |                  |                 |                 |                |                        |                     |
      | M610       |                  |                 |                 |                |                        |                     |

  @DealerProfile @US_166 @TC_605 @Positive
  Scenario Outline: To Validate the Payment Preview popup and its fields in Dealer login for already subscribed asset
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

    Examples: 
      | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | My.Cat.Com       |                 |                 |                | Cat Daily              |                     |
    
  @DealerProfile @US_166 @TC_611 @Positive
  Scenario Outline: To Verify the Subscription info after click on CANCEL button in Payment Preview Popup in Dealer login
    When enter or modify Subscription details as "Services=<Services>,Cat =<Cat>,Dealer =<Dealer>,Customer =<Customer>,Base Subscription =<Base Subscription>,Additional Services  =<Additional Services>"
    And click "Review & Submit" button or link
    And Click "Cancel" button in Payment Preview popup
    Then Verify the UI should be redirected to worklist page and the new subscription should not become active for the asset
    And Verify in UI Old subscription should be retained for the asset

    Examples: 
      | Services         | Cat             | Dealer          | Customer       | Base Subscription      | Additional Services |
      | VisionLink       |                 |                 |                | Cat Basic - 10 Minutes | Onboard Analytics   |
      | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4) |                        |                     |
      | My.Cat.Com       |                 |                 |                | Cat Daily              |                     |
  
