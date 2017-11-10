
Feature: ED record for an asset
  This feature is to Create an Customer Record in ED for an asset and verifying API Response

@Sanity @Regression @Positive
  Scenario Outline: Creating an Customer record in ED for an asset
    Given Construct EquipmentData Request API with SerialNumber and "<ManufacturerCode>", "<ProductWorkCode>", "<Model>", "<ManufacturingYear>", "<OnwerType>", "<DealerCustomerNumber>", "<EquipmentID>", "<VinNumber>", "<DealerCode>"
    And Execute the API
    Then Validate Successful API Response and "<HttpStatus>" of the EquipmentData Request API

    Examples: 
      | ManufacturerCode | ProductWorkCode | Model | ManufacturingYear | OnwerType | DealerCustomerNumber | EquipmentID | VinNumber | DealerCode | HttpStatus |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | Z99              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | Z99              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
      | CAT              |                 | 2016A |              2015 | O         |               059956 | Testasset   |           | TD00       |        200 |
