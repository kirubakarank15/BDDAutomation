@tag
Feature: Creating an Customer Record for an asset in ED
  This feature is to create an ED Customer Record for an asset

  @API
  Scenario Outline: Constructing ED API
    Given Construct EquipmentData Request API with SerialNumber,"<ManufacturerCode>","<ProductWorkCode>","<Model>","<ManufacturingYear>","<OnwerType>","<DealerCustomerNumber>","<EquipmentID>","<VinNumber>","<DealerCode>"
    And Execute the API
    Then Validate Successful API Response and "<HttpStatus>" of the EquipmentData Request API

    Examples: 
      | ManufacturerCode | ProductWorkCode | Model | ManufacturingYear | OnwerType | DealerCustomerNumber | EquipmentID | VinNumber | DealerCode | HttpStatus |
      | CAT              |                 | 2016A |              2017 | O         |               059956 | Testequip   |     12345 | TD00       |        200 |
