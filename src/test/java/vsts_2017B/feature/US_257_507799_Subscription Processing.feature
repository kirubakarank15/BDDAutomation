@2017B @US_257 @US_507799 @SubscriptionProcessing
Feature: SubscriptionProcessing in zuora
  This Feature is to validate zuora for the Active susbcribed Assets in DSP

  ## from Payment Preview TC001
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for the Active Subscriptions for newly subscribed asset with Contract period,Auto Renew both selected for AllLoginProfiles
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>" is displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify Contract Period,Auto Renew both selected in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And verify fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be created for the Asset with Selected DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the selected subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the selected subscription products displayed in Zuora
    And validate Auto Renew "<Auto Renew>" with green tick mark should for the selected subscription products displayed in Zuora
    And validate TermSetting "<Term Setting>" for contract Period more than a year for the selected subscription products displayed in Zuora
    And validate Renewal Term "<Renewal Term>" for the selected subscription products displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" for the selected subscription products displayed in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Subscription Pricing Value | Applicable Promotion Pricing Value | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting          | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                            |                                    | Active |                     |           |       |                  |           |       |            1 | Yes        | Termed       |            1 | Renew With Specific Term |            1 |            1 |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                            |                                    | Active |                     |           |       |                  |           |       |            2 | Yes        | Termed       |            2 | Renew With Specific Term |            2 |            2 |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Yes        | Termed       |              | Renew With Specific Term |              |              |
      | N030       |                  |                 | Cat Daily       |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Yes        | Termed       |              | Renew With Specific Term |              |              |
      | M610       |                  |                 |                 |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Yes        | Termed       |              | Renew With Specific Term |              |              |

  #TC002
  # for Evergreen subscriptions in Zuora, Autorenew, current Term options should not come
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for the Active Subscriptions for newly subscribed asset with Contract period not selected and Auto Renew disabled for AllLoginProfiles
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>" is displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify No Contract in selected  in Subscription widget in MyWorklist Page
    And Auto Renew checkbox is disabled in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And verify fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be created for the Asset with Selected DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the selected subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the selected subscription products is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" for the selected subscription products is not displayed in Zuora
    And validate TermSetting "<Term Setting>" for the selected subscription products is displayed in Zuora
    And validate Renewal Term "<Renewal Term>"for the selected subscription products is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" for the selected subscription products is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Subscription Pricing Value | Applicable Promotion Pricing Value | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                            |                                    | Active |                     |           |       |                  |           |       | Blank        | Blank      | Evergreen    | Blank        | Blank           | Blank        | Blank        |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                            |                                    | Active |                     |           |       |                  |           |       | Blank        | Blank      | Evergreen    | Blank        | Blank           | Blank        | Blank        |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       | Blank        | Blank      | Evergreen    | Blank        | Blank           | Blank        | Blank        |
      | N030       |                  |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       | Blank        | Blank      | Evergreen    | Blank        | Blank           | Blank        | Blank        |
      | M610       |                  |                 |                 |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       | Blank        | Blank      | Evergreen    | Blank        | Blank           | Blank        | Blank        |

  #TC003
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for the Active Subscriptions for newly subscribed asset with Contract period selected and Auto Renew unchecked for AllLoginProfiles
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>" is displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify Contract Period in selected  in Subscription widget in MyWorklist Page
    And Auto Renew checkbox is unchecked in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And verify fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be created for the Asset with Selected DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the selected subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the selected subscription products displayed in Zuora
    And validate Auto Renew "<Auto Renew>" for the selected subscription products is not displayed in Zuora
    And validate TermSetting "<Term Setting>" for the selected subscription products is displayed in Zuora
    And validate Renewal Term "<Renewal Term>" for the selected subscription products is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>"for the selected subscription products is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Subscription Pricing Value | Applicable Promotion Pricing Value | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting          | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                            |                                    | Active |                     |           |       |                  |           |       |            1 | No         | Termed       |            1 | Renew with Specific Term |            1 |            1 |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | No         | Termed       |              |                          |              |              |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | No         | Termed       |              |                          |              |              |
      | N030       |                  |                 | Cat Daily       |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | No         | Termed       |              |                          |              |              |
      | M610       |                  |                 |                 |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | No         | Termed       |              |                          |              |              |

  #TC004
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for existing subscription when Auto Renew is selected for AllLoginProfiles
    Given Active Subscription displayed with "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | DCN | Additional Services | Contract Period | Auto Renew |
      |          |     |        |          |     |                     |               1 | unchecked  |
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And verify Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>"displayed in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>" is displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify Contract Period in selected  in Subscription widget in MyWorklist Page
    And verify Auto Renew checkbox is checked in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And verify fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be created for the Asset with Selected DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the selected subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the selected subscription products displayed in Zuora
    And validate Auto Renew "<Auto Renew>" for the selected subscription products is displayed in Zuora
    And validate TermSetting "<Term Setting>" for the selected subscription products is displayed in Zuora
    And validate Renewal Term "<Renewal Term>" for the selected subscription products is displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>"for the selected subscription products is displayed in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Subscription Pricing Value | Applicable Promotion Pricing Value | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting          | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                            |                                    | Active |                     |           |       |                  |           |       |            1 | Blank,yes  | Termed       |            1 | Renew with Specific Term |              |            1 |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Blank,yes  | Termed       |              |                          |              |              |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Blank,yes  | Termed       |              |                          |              |              |
      | N030       |                  |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Blank,yes  | Termed       |              |                          |              |              |
      | M610       |                  |                 |                 |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | Blank,yes  | Termed       |              |                          |              |              |

 #TC005
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for existing subscription when Auto Renew is unselected after for AllLoginProfiles
    Given Active Subscription displayed with "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | DCN | Additional Services | Contract Period | Auto Renew |
      |          |     |        |          |     |                     |               1 | checked    |
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And verify Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" displayed in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>" is displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify Contract Period in selected  in Subscription widget in MyWorklist Page
    And verify Auto Renew checkbox is unchecked in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And verify fields EquipmentId, EquipmentSerialNumber, Asset Make/Model, DeviceType, DeviceInformation,CustomerUCID,CustomerDCN,Subscriptioninformation,AdditionalServices,MonthlyRatePlan,PromotionDetails,MonthlyPaymentdetails,OneTimeTerminationfeeDetails are displayed in Payment Preview popup
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be created for the Asset with Selected DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the selected subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the selected subscription products is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" for the selected subscription products is not displayed in Zuora
    And validate TermSetting "<Term Setting>" for the selected subscription products is not displayed in Zuora
    And validate Renewal Term "<Renewal Term>" for the selected subscription products is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>"for the selected subscription products is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Subscription Pricing Value | Applicable Promotion Pricing Value | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                            |                                    | Active |                     |           |       |                  |           |       |            1 | yes, Blank |              |            1 | Blank           |            1 |            1 |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | yes, Blank |              |              |                 |              |              |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | yes, Blank |              |              |                 |              |              |
      | N030       |                  |                 |                 | Cat Daily              |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | yes, Blank |              |              |                 |              |              |
      | M610       |                  |                 |                 |                        |                     |                            |                                    | Active |                     |           |       |                  |           |       |              | yes, Blank |              |              |                 |              |              |

#TC006
  ## One time Termination fees
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora for Early Termination fee when any of the following parameters are changed except subscriptionfor AllLoginProfiles
    Given Active Subscription with "<Dealer Code>","<Asset SN>","<Device Type>","<Device ID>","<UCID>","<DCN>","<Customer Name>", in Subscription widget in MyWorklist Page
      | Dealer Code | Asset SN | Device Type | Device ID | UCID | DCN | Customer Name |
      | B330        |          |             |           |      |     |               |
    When "<Asset SN>","<Device Type>","<Device ID>","<UCID>","<DCN>","<Customer Name>","<Dealer Code>" parameters are changed for the Existing Asset in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate Early Termination fee should be displayed as new Product line in Zuora
    And rate plan of the Early Termination fee should be displayed as new Product line in Zuora
    And Contract EndDate should be updated in Zuora

    Examples: 
      | Dealer Code | Asset SN | Device Type | Device ID | UCID | DCN | Customer Name | Dealer Code | Status           |
      | B330        |          |             |           |      |     |               |             | Active,Cancelled |

  #TC007
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora for Early Termination fee when Existing Susbcription is changed for AllLoginProfiles
    Given Active Subscription displayed with "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      |          |     |        |          |                     |               1 | Checked    |
    When "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" changed in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status"<Status>"of the Subcription of the Asset in Zuora
    And validate Early Termination fee should be displayed as new Product line in Zuora
    And rate plan of the Early Termination fee should be displayed as new Product line in Zuora
    And Contract EndDate should be updated in Zuora

    Examples: 
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status                  |
      |          |     |        |          |                     |               1 | yes        | Active,Cancelled,Active |

#TC008
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora for Early Termination fee when Existing Susbcription is Cancelled for AllLoginProfiles
    Given Active Subscription displayed with "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      |          |     |        |          |                     |                 |            |
    When "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" is cancelled in Subscription widget in MyWorklist Page
    And click "Review & Submit" button or link
    And click Submit button in Payment preview popup
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate Early Termination fee should be displayed as new Product line in Zuora
    And rate plan of the Early Termination fee should be displayed as new Product line in Zuora
    And Contract EndDate should be updated in Zuora

    Examples: 
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status           |
      |          |     |        |          |                     |                 |            | Active,Cancelled |

 #TC009
  ## Contract Period End Date is Met
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Contract Period is ended and Auto Renew is OFF
    Given Active Subscription "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" with Contract Period Ended and Auto Renew unchecked in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | Additional Services |
      |          |     |        |          |                     |
    When set Contract period to EndDate in DB
    Then Validate Subscription of the asset "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" should be automatically Cancelled in DSP
    And validate Status"<Status>"of the subscription of the asset of the Asset in Zuora
    And Contract EndDate in DSP should match with contract EndDate in Zuora

    Examples: 
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Status           |
      |          |     |        |          |                     |               1 | Active,Cancelled |

  #TC010
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Contract Period is ended and Auto Renew is ON
    Given Active Subscription "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" with Contract Period and Auto Renew is checked in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | DCN | Additional Services |
      |          |     |        |          |     |                     |
    When set Contract period to EndDate in DB
    Then Validate Subscription of the asset "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" should be automatically Carried over in DSP
    And new contract period end date should be displayed in the Payment Details popup window in DSP
    And validate Status"<Status>"of the subscription of the asset of the Asset in Zuora
    And Contract EndDate in DSP should match with contract EndDate in Zuora

    Examples: 
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Status                  |
      |          |     |        |          |                     |               1 | Active,Cancelled,Active |

 #TC011
  ## Updating/Cancelling subscription automatically
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Device Upgrade is performed with NonCompatible Subscriptions with Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      | PL641      |          |     |        |          |                     |               1 | checked    |
    When Device upgrade is performed in DSP
    Then Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
    And Validate Contract Period should be No Contract Period in DSP
    And Validate Auto Renew should be Blank in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate modified subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate modified Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status                   | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PL631      |          |     |        |          |                     | No Contract     | Blank      | Active, Cancelled,Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

 #TC012
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Device downgrade is performed with NonCompatible Subscriptions with Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      |            |          |     |        |          |                     |               1 | checked    |
    When Device downgrade is performed in DSP
    Then Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate modified subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate modified Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status                   | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PLE631     |          |     |        |          |                     | No Contract     | Blank      | Active, Cancelled,Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

 #TC013
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Device Transfer is performed with Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      | PLE641     |          |     |        |          |                     |               1 | checked    |
    When Device transfer is performed in DSP
    Then Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate same subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate change in Device Information in Zuora
    And validate same Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PLE641     |          |     |        |          |                     | No Contract     | Blank      | Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

 #TC014
 # for Evergreen applications initial Term , renewal setting will not come
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Device replacement is performed with with Compatible Subscriptions Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      | PLE641     |          |     |        |          |                     |               1 | checked    |
    When Device Replacement is performed in DSP
    Then Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate same subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate change in Device Information in Zuora
    And validate same Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PLE641     |          |     |        |          |                     | No Contract     | Blank      | Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

  #TC015
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Device replacement is performed with with NonCompatible Subscriptions Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      | PLE641     |          |     |        |          |                     |               1 | checked    |
    When Device Replacement is performed in DSP
    Then Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate modified subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate modified Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | Status                   | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PLE641     |          |     |        |          |                     | No Contract     | Blank      | Active, Cancelled,Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

  #TC016
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when ED Ownership change is performed with Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>","<UCID>", "<DCN>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | UCID | DCN |
      |            |          |     |        |          |                     |                 |            |      |     |
    When ED Ownership change is performed in DSP
    Then Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>","<UCID>", "<DCN>" in Subscription widget in MyWorklist Page
    And Validate Contract Period should be displayed in DSP
    And Validate Auto Renew should be displayed in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate modified subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate modified Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | UCID | DCN | Status                   | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PLE631     |          |     |        |          |                     | No Contract     | Blank      |      |     | Active, Cancelled,Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

  #TC017
  #Deepak need to confirm with Venkat for Early termination fee
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when VisionLink Failure in DSP with Contract period and Auto Renew Checked
    Given Active Susbcription "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      |            |          |     |        |          |                     |                 |            |
    When visionLink failure occured in Trimble
    Then Susbcribed Asset should be displayed in ED lookup Failure Queue in DSP
    And Validate "<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Auto Renew>" in Subscription widget in MyWorklist Page
    And Validate Contract Period should be No Contract Period in DSP
    And Validate Auto Renew should be Blank in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate modified subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate modified Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | UCID | DCN | Status                    | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | PLE631     |          |     |        |          |                     | No Contract     | Blank      |      |     | Active, Cancelled, Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

 #TC018
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: Verify Zuora when Excluded device occurred in DSP with Contract period and Auto Renew Checked
    Given Active Susbcription "<DealerCode>","<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | DealerCode | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      | TD00       | PLE631     |          |     |        |          |                     |               1 | checked    |
    When Exclude the existing DealerCode in DSP DB
    And Run Excluder job and clear Cache
    Then Subscribed Asset should be displayed in Subscription no longer available for this region Queue in DSP
    And Validate "<DealerCode>","<DeviceType>","<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
    And Validate Contract Period should be No Contract Period in DSP
    And Validate Auto Renew should be Blank in DSP
    And validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate modified subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for DealerLevel subscription in Zuora
    And validate modified Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" displayed in Zuora
    And validate Contract Period "<Current Term>" is not displayed in Zuora
    And validate Auto Renew "<Auto Renew>" is not displayed in Zuora
    And validate TermSetting "<Term Setting>" is not  displayed in Zuora
    And validate Renewal Term "<Renewal Term>" is not displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" is not displayed in Zuora
    And validate Initial Term  "<Initial Term>" is not displayed in Zuora
    And validate Current Term "<Current Term>" is not displayed in Zuora
    And validate Contract EndDate should be updated in Zuora
    And Early Termination fee Product and Product Pricing should be updated in Zuora

    Examples: 
      | DealerCode | DeviceType | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew | UCID | DCN | Status                   | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting | Initial Term | Current Term |
      | TD00       | PLE631     |          |     |        |          |                     | No Contract     | Blank      |      |     | Active, Cancelled,Active |                     |           |       |                  |           |       |              |            |              |              |                 |              |              |

  #TC019
  ## hosted Webpage
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for the Active Subscriptions for newly subscribed asset thru CATActivate
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And set Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>" in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>" is displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify Contract Period,Auto Renew both selected in Subscription widget in MyWorklist Page
    And click Tick button or link
    And Login to zuora
    Then validate Status "<Status>"of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be created for the Asset with Selected DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the selected subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the selected subscription products displayed in Zuora
    And validate Auto Renew "<Auto Renew>" with green tick mark should for the selected subscription products displayed in Zuora
    And validate TermSetting "<Term Setting>" for contract Period more than a year for the selected subscription products displayed in Zuora
    And validate Renewal Term "<Renewal Term>" for the selected subscription products displayed in Zuora
    And validate Renewal Setting "<Renewal Setting>" for the selected subscription products displayed in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Subscription Pricing | Applicable Promotion Pricing Value | Price | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting          | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                      |                                    |       | Active |                     |           |       |                  |           |       |            1 | yes        | Termed       |            1 | Renew With Specific Term |            1 |            1 |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                      |                                    |       | Active |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                      |                                    |       | Active |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
      | N030       |                  |                 |                 |                        |                     |                      |                                    |       | Active |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
      | M610       |                  |                 |                 |                        |                     |                      |                                    |       | Active |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |

  #TC020
  @CatProfile @DealerProfile @CustomerProfile @US_257 @TC_ @Positive
  Scenario Outline: To Verify Zuora for Update operation for Existing Subscriptions thru CATActivate
    Given Active Subscriptions with "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
      | Services | Cat | Dealer | Customer | Additional Services | Contract Period | Auto Renew |
      |          |     |        |          |                     |                 |            |
    When logged in as CAT or Customerprofile Set in UI "<DealerCode>"
    But logged in as Dealer "<DealerCode>" displayed as default
    And Modify Subscription details as "<Services>","<Cat>","<Dealer>","<Customer>","<Additional Services>","<Contract Period>","<Auto Renew>" in Subscription widget in MyWorklist Page
    And verify "<Subscription Pricing Value>","<Applicable Promotion Pricing Value>"  displayed for selected Subscription in Subscription widget in MyWorklist Page
    And verify Contract Period,Auto Renew both selected in Subscription widget in MyWorklist Page
    And click Tick button or link
    And Login to zuora
    Then validate Status "<Status>" of the Subcription of the Asset in Zuora
    And validate equivalent subscription products "<SusbcriptionProduct>","<Rate Plan>", "<Total>" should be displayed for the Asset with modified DealerLevel subscription in Zuora
    And validate Applicable promotions "<PromotionProduct>","<Rate Plan>", "<Total>" for the modified subscription products displayed in Zuora
    And validate Contract Period "<Current Term>"for the modified subscription products displayed in Zuora
    And validate Auto Renew "<Auto Renew>" should be displayed for the modified subscription products modified in Zuora
    And validate TermSetting "<Term Setting>" should be displayed for the modified subscription products modified in Zuora
    And validate Renewal Term "<Renewal Term>"should be displayed for the modified subscription products modified in Zuora
    And validate Renewal Setting "<Renewal Setting>" should be displayed for the modified subscription products modified in Zuora
    And validate Initial Term  "<Initial Term>" for the selected subscription products displayed in Zuora
    And validate Current Term "<Current Term>" for the selected subscription products displayed in Zuora
    And validate Contract EndDate for the selected subscription products displayed in Zuora

    Examples: 
      | DealerCode | Services         | Cat             | Dealer          | Customer               | Additional Services | Contract Period | Auto Renew | Subscription Pricing | Applicable Promotion Pricing Value | Price | Status | SusbcriptionProduct | Rate Plan | Total | PromotionProduct | Rate Plan | Total | Current Term | Auto Renew | Term Setting | Renewal Term | Renewal Setting          | Initial Term | Current Term |
      | B330       | VisionLink       |                 |                 | Cat Basic - 10 Minutes | Onboard Analytics   |                 |            |                      |                                    |       |        |                     |           |       |                  |           |       |            1 | yes        | Termed       |            1 | Renew With Specific Term |            1 |            1 |
      | E250       | Product Link Web | Aide (EC4-14-T) | Aide (EC4-14-T) | Vitals (EC1-4)         |                     |                 |            |                      |                                    |       |        |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
      | H160       | My.Cat.Com       |                 |                 | Cat Daily              |                     |                 |            |                      |                                    |       |        |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
      | N030       |                  |                 |                 |                        |                     |                 |            |                      |                                    |       |        |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
      | M610       |                  |                 |                 |                        |                     |                 |            |                      |                                    |       |        |                     |           |       |                  |           |       |              |            |              |              |                          |              |              |
