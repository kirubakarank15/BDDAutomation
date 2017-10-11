
Feature: 

  Background: 
    When Navigate to "My worklist"
    Then The page "Myworklist" should be displayed

  Scenario Outline: To check whether servicesdropdown values are populated with below applications as per
    When search Asset details as "<S/N>" in My Worklist Page
    Then verify the services drop down is displayed with applicable "<Services>" values for the device type "<Device Type>"

    Examples: 
      | Device Type   | S/N      | Services                                                  |
      #| PL641         | NULL     | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER |
      | PL631         | AUT10002 | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER |
      #| PL631         | AUT10002 | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER |
      #| PL542         | NULL     | VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER                  |
      #| PL241         | NULL     | PRODUCT LINK WEB,VISION LINK,MY.CAT.COM,EQUIPMENT TRACKER |
      #| PL231         | NULL     |                                                           |
      #| PL141         | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PL131         | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PL240         | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PL240B        | NULL     | VISION LINK,My.Cat.Com,EQUIPMENT TRACKER                  |
      #| PL161         | NULL     | VISION LINK,My.Cat.Com,EQUIPMENT TRACKER,MINESTAR         |
      #| PL161E        | NULL     | PERKINS                                                   |
      #| PL671         | NULL     |                                                           |
      #| PLG601        | NULL     | PRODUCT LINK GENERATION                                   |
      #| PLG641        | NULL     | PRODUCT LINK GENERATION                                   |
      #| PLE742        | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PLE640        | NULL     | PRODUCT LINK WEB,My.Cat.Com,EQUIPMENT TRACKER             |
      #| PLE641        | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PLE642        | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PLE642-P      | NULL     | PRODUCT LINK WEB                                          |
      #| PLE631        | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PLE641+PLE631 | NULL     | PRODUCT LINK WEB,VISION LINK,My.Cat.Com,EQUIPMENT TRACKER |
      #| PLE601        | NULL     | PRODUCT LINK WEB,My.Cat.Com,EQUIPMENT TRACKER             |
      #| PLE602        | NULL     | PRODUCT LINK WEB                                          |
      #| PLE602-P      | NULL     | PRODUCT LINK WEB                                          |
      #| PLE702-P      | NULL     | PRODUCT LINK WEB                                          |
