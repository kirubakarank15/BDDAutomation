package demo.pageObjectModel;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

public class QAHome {

	@FindBy(xpath = "//header[@id='header']//a/img[@alt='propertyfinder.qa']")
	private WebElement logoProperty;

	@FindBy(xpath = "//section[@id='search']//div[contains(@class,'category-select')]/select")
	private WebElement drpCategory;
	@FindBy(xpath = "//ul//li/a[contains(text(),'Find agent')]")
	private WebElement tabFindAgent;
	@FindBy(xpath = "//section[@id='search']//div[contains(@class,'category-select')]//button")
	private WebElement btnCategory;

	@FindBy(xpath = "//section[@id='search']//div[contains(@class,'category-select')]//div/ul")
	private WebElement lstCategory;

	@FindBy(xpath = "//section[@id='search']//div[contains(@class,'settings minimized')]//select[contains(@data-url,'propertytype')]/..//button")
	private WebElement btnPropertyType;

	@FindBy(xpath = "//input[@name='q']")
	private WebElement txtLocation;

	@FindBy(xpath = "//input[@name='q']/../div//div/div")
	private WebElement lnkFirstLocation;

	@FindBy(xpath = "//section[@id='search']//div[contains(@class,'settings minimized')]//select[@name='bf']/..//button")
	private WebElement btnMinBeds;

	@FindBy(xpath = "//section[@id='search']//div[contains(@class,'settings minimized')]//select[@name='bt']/..//button")
	private WebElement btnMaxBeds;

	@FindBy(xpath = "//div[text()='Find']/..")
	private WebElement btnFind;

	@FindBy(xpath = "//span[text()='Sort by:']/..//button")
	private WebElement btnSortBy;

	public void isPageDisplayed() throws CustomisedException {
		try {
			TestFunctionsFactory.webWait(30, tabFindAgent);;
			if (!tabFindAgent.isDisplayed())
				throw new CustomisedException("PropertyFinder Home", "page is not displayed");
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("PropertyFinder Home", e.getMessage());
		}
	}

	public void searchDetails(String details) throws CustomisedException {
		try {
			LinkedHashMap<String, String> dataMap = TestFunctionsFactory.getTestData(details);
			Set<String> fields = dataMap.keySet();
			for (String temp : fields) {
				switch (temp.replaceAll(" ", "").toLowerCase()) {
				case "category":
					TestFunctionsFactory.webClick(btnCategory);
					List<WebElement> lstCategories = TestFunctionsFactory.driver.findElements(
							By.xpath("//section[@id='search']//div[contains(@class,'category-select')]//div/ul/li"));
					int count = 0;
					for (WebElement element : lstCategories) {
						if (element.getText().equalsIgnoreCase(dataMap.get(temp))) {
							count++;
							TestFunctionsFactory.webClick(element);
						}
					}
					if (count == 0)
						throw new CustomisedException("Category",
								"The given value " + dataMap.get(temp) + " is not present");

					break;
				case "propertytype":
					TestFunctionsFactory.webClick(btnPropertyType);
					List<WebElement> lstPropTypes = TestFunctionsFactory.driver.findElements(By.xpath(
							"//section[@id='search']//div[contains(@class,'settings minimized')]//select[contains(@data-url,'propertytype')]/..//div/ul/li"));
					int propCount = 0;
					for (WebElement element : lstPropTypes) {
						if (element.getText().equalsIgnoreCase(dataMap.get(temp))) {
							propCount++;
							TestFunctionsFactory.webClick(element);
						}
					}
					if (propCount == 0)
						throw new CustomisedException("Property Type",
								"The given value " + dataMap.get(temp) + " is not present");

					break;
				case "location":
					TestFunctionsFactory.webEditText(txtLocation, dataMap.get(temp));
					TestFunctionsFactory.webClick(lnkFirstLocation);
					break;
				case "minimumbeds":
					TestFunctionsFactory.webClick(btnMinBeds);
					List<WebElement> lstMinBeds = TestFunctionsFactory.driver.findElements(By.xpath(
							"//section[@id='search']//div[contains(@class,'settings minimized')]//select[@name='bf']/..//div/ul/li"));
					int minBedCount = 0;
					for (WebElement element : lstMinBeds) {
						if (element.getText().toLowerCase().contains(dataMap.get(temp))) {
							minBedCount++;
							TestFunctionsFactory.webClick(element);
						}
					}
					if (minBedCount == 0)
						throw new CustomisedException("Minimum Bed Count",
								"The given value " + dataMap.get(temp) + " is not present");

					break;

				case "maximumbeds":
					TestFunctionsFactory.webClick(btnMaxBeds);
					List<WebElement> lstMaxBeds = TestFunctionsFactory.driver.findElements(By.xpath(
							"//section[@id='search']//div[contains(@class,'settings minimized')]//select[@name='bt']/..//div/ul/li"));
					int maxBedCount = 0;
					for (WebElement element : lstMaxBeds) {
						if (element.getText().toLowerCase().contains(dataMap.get(temp))) {
							maxBedCount++;
							TestFunctionsFactory.webClick(element);
						}
					}
					if (maxBedCount == 0)
						throw new CustomisedException("Minimum Bed Count",
								"The given value " + dataMap.get(temp) + " is not present");

					break;
				}
			}
			TestFunctionsFactory.webClick(btnFind);
			// getPropertyDetails();
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("PropertyFinder Home", e.getMessage());
		}
	}

	public void performSort(String details) throws CustomisedException {
		try {
			TestFunctionsFactory.webClick(btnSortBy);
			TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(
					By.xpath("//span[text()='Sort by:']/..//ul/li[contains(text(),'" + details.trim() + "')]")));
			// span[text()='Sort by:']/..//ul/li
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("PropertyFinder Home", e.getMessage());
		}
	}

	public void getPropertyDetails() throws CustomisedException {
		try {
			LinkedHashMap<String, String> detailsMap = new LinkedHashMap<>();
			String propName = "";
			String propValue = "";
			String propCurr = "";

			List<WebElement> lstTopProperty = TestFunctionsFactory.driver
					.findElements(By.xpath("//section[@id='serp']//li//div[@class='property-content']//bdi"));
			List<WebElement> lstTopPropertyValues = TestFunctionsFactory.driver.findElements(By.xpath(
					"//section[@id='serp']//li//div[@class='property-content']//div[@class='info-area']//span[@class='val']"));
			List<WebElement> lstTopPropertyCurrencies = TestFunctionsFactory.driver.findElements(By.xpath(
					"//section[@id='serp']//li//div[@class='property-content']//div[@class='info-area']//span[@class='currency']"));
			int counter = 0;
			for (WebElement temp : lstTopProperty) {
				propName = temp.getText();
				propValue = lstTopPropertyValues.get(counter).getText();
				propCurr = lstTopPropertyCurrencies.get(counter).getText();
				detailsMap.put(propName, propValue + " " + propCurr);
				counter++;
			}
			System.out.println("Prop details : " + detailsMap);
			BufferedWriter writer = new BufferedWriter(new FileWriter("example.csv"));
			CSVPrinter csvPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT
                    .withHeader("Listing Title", "Price"));
			for(String temp : detailsMap.keySet())
				csvPrinter.printRecord(temp , detailsMap.get(temp) );
			csvPrinter.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomisedException("PropertyFinder Home", e.getMessage());
		}

	}


}
