$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("DeviceTypes_Applications_Subscriptions/PLE631_subscriptions.feature");
formatter.feature({
  "line": 2,
  "name": "PL631 verification",
  "description": "",
  "id": "pl631-verification",
  "keyword": "Feature"
});
formatter.scenarioOutline({
  "line": 10,
  "name": "To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631.",
  "description": "",
  "id": "pl631-verification;to-check-whether-subscriptions-are-populated-properly-in-customer,cat-and-dealer-subscription-dropdown-for-the-device-type-pl631.",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 9,
      "name": "@Services"
    }
  ]
});
formatter.step({
  "line": 11,
  "name": "search Asset details as \"\u003cS/N\u003e\" in My Worklist Page",
  "keyword": "When "
});
formatter.step({
  "line": 12,
  "name": "select the services as \"\u003cServices\u003e\" from subscriptions page",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "verify whether the subscription dropdown values \"\u003cCustomer Level Subscription\u003e\",\"\u003cDealer Level Subscription\u003e\",\"\u003cCat Level Subscription\u003e\"  are populated according to the selected service",
  "keyword": "Then "
});
formatter.examples({
  "line": 15,
  "name": "",
  "description": "",
  "id": "pl631-verification;to-check-whether-subscriptions-are-populated-properly-in-customer,cat-and-dealer-subscription-dropdown-for-the-device-type-pl631.;",
  "rows": [
    {
      "cells": [
        "Device Type",
        "S/N",
        "Services",
        "Customer Level Subscription",
        "Dealer Level Subscription",
        "Cat Level Subscription"
      ],
      "line": 16,
      "id": "pl631-verification;to-check-whether-subscriptions-are-populated-properly-in-customer,cat-and-dealer-subscription-dropdown-for-the-device-type-pl631.;;1"
    },
    {
      "comments": [
        {
          "line": 17,
          "value": "#| PL631       | AUT10002 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                                     | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |"
        }
      ],
      "cells": [
        "PL631",
        "AUT10002",
        "VISION LINK",
        "Cat Basic - 4 Hours,Cat Basic - Hourly,Cat Essentials - 4 Hours",
        "",
        ""
      ],
      "line": 18,
      "id": "pl631-verification;to-check-whether-subscriptions-are-populated-properly-in-customer,cat-and-dealer-subscription-dropdown-for-the-device-type-pl631.;;2"
    }
  ],
  "keyword": "Examples"
});
formatter.background({
  "line": 4,
  "name": "",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 5,
  "name": "Navigate to \"My worklist\"",
  "keyword": "When "
});
formatter.step({
  "line": 6,
  "name": "The page \"Myworklist\" should be displayed",
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "My worklist",
      "offset": 13
    }
  ],
  "location": "CommonSteps.menuBarNavigation(String)"
});
formatter.result({
  "duration": 33783302243,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Myworklist",
      "offset": 10
    }
  ],
  "location": "CommonSteps.isPageDisplayed(String)"
});
formatter.result({
  "duration": 124019137,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 17,
      "value": "#| PL631       | AUT10002 | PRODUCT LINK WEB  | Vitals (ES1-0),Aide (ES4-0)                                     | Vitals (ES1-0),Aide (ES4-0) | Vitals (ES1-0),Aide (ES4-0) |"
    }
  ],
  "line": 18,
  "name": "To check whether subscriptions are populated properly in Customer,cat and Dealer subscription dropdown for the device Type PL631.",
  "description": "",
  "id": "pl631-verification;to-check-whether-subscriptions-are-populated-properly-in-customer,cat-and-dealer-subscription-dropdown-for-the-device-type-pl631.;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 9,
      "name": "@Services"
    }
  ]
});
formatter.step({
  "line": 11,
  "name": "search Asset details as \"AUT10002\" in My Worklist Page",
  "matchedColumns": [
    1
  ],
  "keyword": "When "
});
formatter.step({
  "line": 12,
  "name": "select the services as \"VISION LINK\" from subscriptions page",
  "matchedColumns": [
    2
  ],
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "verify whether the subscription dropdown values \"Cat Basic - 4 Hours,Cat Basic - Hourly,Cat Essentials - 4 Hours\",\"\",\"\"  are populated according to the selected service",
  "matchedColumns": [
    3,
    4,
    5
  ],
  "keyword": "Then "
});
formatter.match({
  "arguments": [
    {
      "val": "AUT10002",
      "offset": 25
    }
  ],
  "location": "UI_Subscription.search_Asset_details_as_in_My_Worklist_Page(String)"
});
formatter.result({
  "duration": 71086468955,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "VISION LINK",
      "offset": 24
    }
  ],
  "location": "SubscripitionsNew.selectServices(String)"
});
formatter.result({
  "duration": 10872147364,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "Cat Basic - 4 Hours,Cat Basic - Hourly,Cat Essentials - 4 Hours",
      "offset": 49
    },
    {
      "val": "",
      "offset": 115
    },
    {
      "val": "",
      "offset": 118
    }
  ],
  "location": "SubscripitionsNew.verifySubscriptionDrpDwn(String,String,String)"
});
formatter.result({
  "duration": 10369604576,
  "error_message": "java.lang.NullPointerException\r\n\tat dsp.automation.runners.TestRunnerUI.embedScreenshot(TestRunnerUI.java:67)\r\n\tat stepDefenition.SubscripitionsNew.verifySubscriptionDrpDwn(SubscripitionsNew.java:93)\r\n\tat ✽.Then verify whether the subscription dropdown values \"Cat Basic - 4 Hours,Cat Basic - Hourly,Cat Essentials - 4 Hours\",\"\",\"\"  are populated according to the selected service(DeviceTypes_Applications_Subscriptions/PLE631_subscriptions.feature:13)\r\n",
  "status": "failed"
});
});