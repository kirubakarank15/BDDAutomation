@Application_Sync_Sanity
Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed


  Scenario Outline: To check whether services/subscription dropdown values are populated with below applications as per
    When search Asset details as "<S/N>" in My Worklist Page
    Then verify the services drop down is displayed with applicable "<Services>" values for the device type "<Device Type>"

    Examples: 
      | Device Type   | S/N      | Services                                                                |
      | PL641         | UIT00125 | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER               |
      | PL631         | UIT00124 | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER               |
      | PL542         | UIT00123 | VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER                                |
      | PL241         | UIT00122 | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER               |
      | PL141         | UIT00118 | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER               |
      | PL131         | UIT00117 | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER               |
      | PL240         | UIT00120 | VISION LINK,My.Cat.Com,EQUIPMENT TRACKER                                |
      | PL240B        | UIT00121 | VISION LINK,My.Cat.Com,EQUIPMENT TRACKER                                |
      | PL161         | UIT00119 | VISION LINK,EQUIPMENT TRACKER                                           |
      | PL671         | UIT00126 | MINESTAR                                                                |
      | PLG601        | UIT00132 | PRODUCT LINK GENERATION                                                 |
      | PLG641        | UIT00133 | PRODUCT LINK GENERATION                                                 |
      | PLE742        | UIT00131 | VISION LINK,My.Cat.Com,EQUIPMENT TRACKER                                |
      | PLE640        | UIT00128 | PRODUCT LINK WEB,PRODUCT LINK GENERATION  ,My.Cat.Com,EQUIPMENT TRACKER |
      | PLE641        | UIT00134 | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER               |
      | PLE642        | UIT00130 | VISION LINK,My.Cat.Com,EQUIPMENT TRACKER                                |
      | PLE631        | UIT00135 | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER               |
      | PLE641+PLE631 | UIT00129 | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER               |
      | PLE601        | UIT00127 | PRODUCT LINK WEB,PRODUCT LINK GENERATION,My.Cat.Com,EQUIPMENT TRACKER   |
     #| PLE602        | NULL     | PRODUCT LINK WEB                                          |
     #| PLE602-P      | NULL     | PRODUCT LINK WEB                                          |
     #| PLE702-P      | NULL     | PRODUCT LINK WEB                                          |
     #| PLE642-P      | NULL     | PRODUCT LINK WEB                                          |
     #| PL161E        | NULL     | InformCapSub1                                             |
