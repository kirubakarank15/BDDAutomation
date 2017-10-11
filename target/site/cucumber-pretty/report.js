$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("DeviceTypes_SetSubscriptions/PL631_setSubscriptions.feature");
formatter.feature({
  "line": 2,
  "name": "",
  "description": "",
  "id": "",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@Regression"
    },
    {
      "line": 1,
      "name": "@PL631_SetSubscriptions"
    }
  ]
});
formatter.scenarioOutline({
  "line": 9,
  "name": "To set different base subscrip\ttions for PL631 device with VISIONLINK application",
  "description": "",
  "id": ";to-set-different-base-subscrip-tions-for-pl631-device-with-visionlink-application",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 8,
      "name": "@Services"
    }
  ]
});
formatter.step({
  "line": 10,
  "name": "search Asset details as \"\u003cS/N\u003e\" in My Worklist Page",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "Set Subscription details as \"\u003cServices\u003e\",\"\u003cBase Level\u003e\",\"\u003cAdditional Services\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 12,
  "name": "submit subscription details",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "search Asset details as \"\u003cS/N\u003e\" in My Worklist Page",
  "keyword": "And "
});
formatter.step({
  "line": 14,
  "name": "Verify Subscription details are displayed with \"\u003cServices\u003e\",\"\u003cExpected Base Level\u003e\",\"\u003cAdditional Services\u003e\" in My Worklist page",
  "keyword": "Then "
});
formatter.examples({
  "line": 16,
  "name": "",
  "description": "",
  "id": ";to-set-different-base-subscrip-tions-for-pl631-device-with-visionlink-application;",
  "rows": [
    {
      "cells": [
        "S/N",
        "Services",
        "Base Level",
        "Additional Services",
        "Expected Base Level"
      ],
      "line": 17,
      "id": ";to-set-different-base-subscrip-tions-for-pl631-device-with-visionlink-application;;1"
    },
    {
      "comments": [
        {
          "line": 18,
          "value": "#| AUT10002 | VISION LINK | Cat Basic - Hourly          |                     | Cat Basic - Hourly          |"
        }
      ],
      "cells": [
        "AUT10002",
        "VISION LINK",
        "Cat Essentials - 4 Hours",
        "VisionLink Load and Cycle Project Monitoring",
        "Cat Essentials - 4 Hours"
      ],
      "line": 19,
      "id": ";to-set-different-base-subscrip-tions-for-pl631-device-with-visionlink-application;;2"
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
  "duration": 47999391177,
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
  "duration": 10123004006,
  "status": "passed"
});
formatter.scenario({
  "comments": [
    {
      "line": 18,
      "value": "#| AUT10002 | VISION LINK | Cat Basic - Hourly          |                     | Cat Basic - Hourly          |"
    }
  ],
  "line": 19,
  "name": "To set different base subscrip\ttions for PL631 device with VISIONLINK application",
  "description": "",
  "id": ";to-set-different-base-subscrip-tions-for-pl631-device-with-visionlink-application;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 8,
      "name": "@Services"
    },
    {
      "line": 1,
      "name": "@Regression"
    },
    {
      "line": 1,
      "name": "@PL631_SetSubscriptions"
    }
  ]
});
formatter.step({
  "line": 10,
  "name": "search Asset details as \"AUT10002\" in My Worklist Page",
  "matchedColumns": [
    0
  ],
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "Set Subscription details as \"VISION LINK\",\"Cat Essentials - 4 Hours\",\"VisionLink Load and Cycle Project Monitoring\"",
  "matchedColumns": [
    1,
    2,
    3
  ],
  "keyword": "And "
});
formatter.step({
  "line": 12,
  "name": "submit subscription details",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "search Asset details as \"AUT10002\" in My Worklist Page",
  "matchedColumns": [
    0
  ],
  "keyword": "And "
});
formatter.step({
  "line": 14,
  "name": "Verify Subscription details are displayed with \"VISION LINK\",\"Cat Essentials - 4 Hours\",\"VisionLink Load and Cycle Project Monitoring\" in My Worklist page",
  "matchedColumns": [
    1,
    3,
    4
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
  "duration": 71019923337,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "VISION LINK",
      "offset": 29
    },
    {
      "val": "Cat Essentials - 4 Hours",
      "offset": 43
    },
    {
      "val": "VisionLink Load and Cycle Project Monitoring",
      "offset": 70
    }
  ],
  "location": "SubscripitionsNew.set_Subscription_details_as(String,String,String,String\u003e)"
});
formatter.result({
  "duration": 1212515,
  "error_message": "cucumber.runtime.CucumberException: Don\u0027t know how to convert \"VisionLink Load and Cycle Project Monitoring\" into java.util.Map.\nTry writing your own converter:\n\n@cucumber.deps.com.thoughtworks.xstream.annotations.XStreamConverter(MapConverter.class)\npublic class Map {}\n\r\n\tat cucumber.runtime.ParameterInfo.convert(ParameterInfo.java:150)\r\n\tat cucumber.runtime.StepDefinitionMatch.transformedArgs(StepDefinitionMatch.java:68)\r\n\tat cucumber.runtime.StepDefinitionMatch.runStep(StepDefinitionMatch.java:37)\r\n\tat cucumber.runtime.Runtime.runStep(Runtime.java:300)\r\n\tat cucumber.runtime.model.StepContainer.runStep(StepContainer.java:44)\r\n\tat cucumber.runtime.model.StepContainer.runSteps(StepContainer.java:39)\r\n\tat cucumber.runtime.model.CucumberScenario.run(CucumberScenario.java:44)\r\n\tat cucumber.runtime.model.CucumberScenarioOutline.run(CucumberScenarioOutline.java:46)\r\n\tat cucumber.runtime.model.CucumberFeature.run(CucumberFeature.java:165)\r\n\tat cucumber.api.testng.TestNGCucumberRunner.runCucumber(TestNGCucumberRunner.java:63)\r\n\tat cucumber.api.testng.AbstractTestNGCucumberTests.feature(AbstractTestNGCucumberTests.java:21)\r\n\tat sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n\tat sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.lang.reflect.Method.invoke(Method.java:498)\r\n\tat org.testng.internal.MethodInvocationHelper.invokeMethod(MethodInvocationHelper.java:108)\r\n\tat org.testng.internal.Invoker.invokeMethod(Invoker.java:661)\r\n\tat org.testng.internal.Invoker.invokeTestMethod(Invoker.java:869)\r\n\tat org.testng.internal.Invoker.invokeTestMethods(Invoker.java:1193)\r\n\tat org.testng.internal.TestMethodWorker.invokeTestMethods(TestMethodWorker.java:126)\r\n\tat org.testng.internal.TestMethodWorker.run(TestMethodWorker.java:109)\r\n\tat org.testng.TestRunner.privateRun(TestRunner.java:744)\r\n\tat org.testng.TestRunner.run(TestRunner.java:602)\r\n\tat org.testng.SuiteRunner.runTest(SuiteRunner.java:380)\r\n\tat org.testng.SuiteRunner.runSequentially(SuiteRunner.java:375)\r\n\tat org.testng.SuiteRunner.privateRun(SuiteRunner.java:340)\r\n\tat org.testng.SuiteRunner.run(SuiteRunner.java:289)\r\n\tat org.testng.SuiteRunnerWorker.runSuite(SuiteRunnerWorker.java:52)\r\n\tat org.testng.SuiteRunnerWorker.run(SuiteRunnerWorker.java:86)\r\n\tat org.testng.TestNG.runSuitesSequentially(TestNG.java:1301)\r\n\tat org.testng.TestNG.runSuitesLocally(TestNG.java:1226)\r\n\tat org.testng.TestNG.runSuites(TestNG.java:1144)\r\n\tat org.testng.TestNG.run(TestNG.java:1115)\r\n\tat org.apache.maven.surefire.testng.TestNGExecutor.run(TestNGExecutor.java:295)\r\n\tat org.apache.maven.surefire.testng.TestNGXmlTestSuite.execute(TestNGXmlTestSuite.java:84)\r\n\tat org.apache.maven.surefire.testng.TestNGProvider.invoke(TestNGProvider.java:90)\r\n\tat org.apache.maven.surefire.booter.ForkedBooter.invokeProviderInSameClassLoader(ForkedBooter.java:203)\r\n\tat org.apache.maven.surefire.booter.ForkedBooter.runSuitesInProcess(ForkedBooter.java:155)\r\n\tat org.apache.maven.surefire.booter.ForkedBooter.main(ForkedBooter.java:103)\r\n",
  "status": "failed"
});
formatter.match({
  "location": "SubscripitionsNew.submit_subscription_details()"
});
formatter.result({
  "status": "skipped"
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
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "VISION LINK",
      "offset": 48
    },
    {
      "val": "Cat Essentials - 4 Hours",
      "offset": 62
    },
    {
      "val": "VisionLink Load and Cycle Project Monitoring",
      "offset": 89
    }
  ],
  "location": "SubscripitionsNew.verify_Subscription_details_should_be_displayed_with_in_My_Worklist_page(String,String,String)"
});
formatter.result({
  "status": "skipped"
});
});