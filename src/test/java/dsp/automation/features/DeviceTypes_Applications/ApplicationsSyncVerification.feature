Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

   Scenario Outline: To check whether servicesdropdown values are populated with below applications
    When search Asset details as "<S/N>" in My Worklist Page
    Then verify the services drop down is displayed with applicable values for the device type "<Device Type>"

    Examples: 
      | Device Type   | S/N  | Services                                                  |
      | PL641         | NULL | PRODUCT LINK WEB,VISION_LINK,MY.CAT.COM,EQUIPMENT_TRACKER |
      | PL631         | NULL | PRODUCT LINK WEB,VISION_LINK,MY.CAT.COM,EQUIPMENT_TRACKER |
      | PL542         | NULL | VISION_LINK,MY.CAT.COM,EQUIPMENT_TRACKER                  |
      | PL241         | NULL | PRODUCT LINK WEB,VISION_LINK,MY.CAT.COM,EQUIPMENT_TRACKER |
     #| PL231         | NULL |                                                           |
      | PL141         | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PL131         | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PL240         | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PL240B        | NULL | VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER                  |
      | PL161         | NULL | VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER,MINESTAR         |
     #| PL161E        | NULL | PERKINS                                                   |
     #| PL671         | NULL |                                                           |
      | PLG601        | NULL | PRODUCT LINK GENERATION                                             |
      | PLG641        | NULL | PRODUCT LINK GENERATION                                             |
      | PLE742        | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PLE640        | NULL | PRODUCT LINK WEB,My.Cat.Com,EQUIPMENT_TRACKER             |
      | PLE641        | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PLE642        | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PLE642-P      | NULL | PRODUCT LINK WEB                                          |
      | PLE631        | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PLE641+PLE631 | NULL | PRODUCT LINK WEB,VISION_LINK,My.Cat.Com,EQUIPMENT_TRACKER |
      | PLE601        | NULL | PRODUCT LINK WEB,My.Cat.Com,EQUIPMENT_TRACKER             |
      | PLE602        | NULL | PRODUCT LINK WEB                                          |
      | PLE602-P      | NULL | PRODUCT LINK WEB                                          |
      | PLE702-P      | NULL | PRODUCT LINK WEB                                          |
