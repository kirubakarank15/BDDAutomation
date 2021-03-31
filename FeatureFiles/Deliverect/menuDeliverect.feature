@smokeDeliverect
Feature: Testing the links of Deliverect.
  I want to use this template for my feature file

  @tag1
  Scenario Outline: Deliverect smoke Testing with different Language
    Given Launch Deliverect URL <Language> in <browserName> browser
    Then Hover or click the menu <parentMenu> and select the menu item <menuItems> if present

    Examples: 
      | Language | browserName | parentMenu | menuItems         |
      | en       | chrome      | Product    | Order integration |
      | en       | chrome      | Customers  | FMCG              |
      | en       | chrome      | Customers  | Dark kitchens     |
      | nl       | chrome      | Product    | Menubeheer        |
      | nl       | chrome      | klanten    | Restaurants       |
      | nl       | chrome      | Prijs      |                   |
      | fr       | chrome      | Prix       |                   |
      | fr       | chrome      | Produit    | Rapports          |
      | fr       | chrome      | Clients    |  Dark kitchens  |
     