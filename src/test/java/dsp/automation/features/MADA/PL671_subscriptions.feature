#Feature: To check the subscription catlog is displayed correctly for PL671
  #@catlogin
  #Scenario: Naviagation and searching the asset details
    #When Navigate to "My worklist"
    #Then The page "Myworklist" should be displayed
    #When search Asset details as "UIT00126" in My Worklist Page
    #
  #@catlogin @PL671
  #Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL671 when logged in as CAT.
    #When search Asset details as "<S/N>" in My Worklist Page
    #And select the services as "<Services>" from subscriptions page
    #Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service
#
    #Examples: 
      #| Device Type | S/N  | Services | Subscription Type                                                                                                                                                                                                                                                                                                                       | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      #| PL671      |UIT00126| MINESTAR | Excavator - No Display,Excavator - With Display,Haul Truck - No Display,Haul Truck - With Display,Dozer - No Display,Dozer - With Display,Auxiliary - With Display,Auxiliary - No Display,Hydraulic Mining Shovel - No Display,Drill,Hydraulic Mining Shovel - With Display,Rope Shovel - With Display,Wheel Loader - With Display,None |                             |                           |                        |
#
  #@dealerlogin
  #Scenario Outline: To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL671 when logged in as Dealer.
    #When search Asset details as "<S/N>" in My Worklist Page
    #And select the services as "<Services>" from subscriptions page
    #Then verify whether the subscription dropdown values "<Customer>","<Dealer>","<Cat>"  are populated according to the selected service
#
    #Examples: 
      #| Device Type | S/N  | Services | Subscription Type                                                                                                                                                                                                                                                                                                                       | Customer Level Subscription | Dealer Level Subscription | Cat Level Subscription |
      #| PL671      |UIT00126| MINESTAR | Excavator - No Display,Excavator - With Display,Haul Truck - No Display,Haul Truck - With Display,Dozer - No Display,Dozer - With Display,Auxiliary - With Display,Auxiliary - No Display,Hydraulic Mining Shovel - No Display,Drill,Hydraulic Mining Shovel - With Display,Rope Shovel - With Display,Wheel Loader - With Display,None |                             |                           |                        |
#
      #
 #no Customer 