package demo.pageObjectModel;

import java.util.LinkedHashMap;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

public class AEHome {

	@FindBy(xpath = "//*[contains(text(),'Our top agents')]")
	private WebElement lblTopAgent;
	
	

	@FindBy(xpath = "//div[contains(@class,'tile_images')]//img")
	private WebElement imgFirstAgent;



	@FindBy(xpath = "//header[@id='header']//a/img[@alt='propertyfinder.ae']")
	private WebElement logoProperty;

	@FindBy(xpath = "//ul//li/a[contains(text(),'Find agent')]")
	private WebElement tabFindAgent;

	@FindBy(xpath = "//ul//li/a[contains(text(),'Buy')]")
	private WebElement tabBuy;

	@FindBy(xpath = "//div[@class='searchform_dropdowns']//div[contains(@class,'searchform_column')][2]")
	private WebElement btnLanguages;
	
	@FindBy(xpath = "//div[@class='searchform_dropdowns']//div[contains(@class,'searchform_column')][3]")
	private WebElement btnNationality;

	@FindBy(xpath = "//button[text()='Find']")
	private WebElement btnFind;
	
	@FindBy(xpath = "//div[@data-qs='agent-list']//div[@class='heading']/h1")
	private WebElement lblAgentCount;
	
	private static int agentCount = 0;

	public void isPageDisplayed() throws CustomisedException {
		try {
			TestFunctionsFactory.waitForPageLoaded();
			if (!lblTopAgent.isDisplayed())
				throw new CustomisedException("PropertyFinder Home", "page is not displayed");
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("PropertyFinder Home", e.getMessage());
		}
	}
	public void clickFirstAgent() throws CustomisedException{
		try{
		TestFunctionsFactory.mouseHoverAndClick(imgFirstAgent);
		}catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("First Agent Image", e.getMessage());
		}
	}
	public void moveToTab(String tab) throws CustomisedException {
		try {
			switch (tab.replaceAll(" ", "").toLowerCase()) {
			case "findagent":
				TestFunctionsFactory.webClick(tabFindAgent);
				break;
			case " buy":
				TestFunctionsFactory.webClick(tabBuy);
				break;
			}
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Moving to Tab", e.getMessage());
		}
	}

	public void searchAgents(String details) throws CustomisedException {
		try {
			System.out.println("Details is "+details);
			LinkedHashMap<String, String> dataMap = TestFunctionsFactory.getTestData(details);
			Set<String> fields = dataMap.keySet();
			for (String temp : fields) {
				switch (temp.replaceAll(" ", "").toLowerCase()) {
				case "languages":
				case "language":
					for (String lang : dataMap.get(temp).split("[+]")) {
						try {
							System.out.println("Language is "+lang);
							TestFunctionsFactory.webClick(btnLanguages);
							TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(By
									.xpath("//div[@class='searchform_dropdowns']//div[contains(@class,'searchform_column')][2]//div[text()='"
											+ lang + "']")));
						} catch (NoSuchElementException ne) {
							throw new CustomisedException("Language Select",
									"The given language " + lang + " is not present");
						}
					}
					break;
				case "nationality" :
					try {
						TestFunctionsFactory.webClick(btnNationality);
						TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(By
								.xpath("//div[@class='searchform_dropdowns']//div[contains(@class,'searchform_column')][3]//div[text()='"
										+ dataMap.get(temp) + "']")));
					} catch (NoSuchElementException ne) {
						throw new CustomisedException("Nationality Select",
								"The given language " + dataMap.get(temp) + " is not present");
					}
					break;
				}
			}
			TestFunctionsFactory.webClick(btnFind);
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Search Agents", e.getMessage());
		}
	}

	
	@SuppressWarnings("static-access")
	public void verifyAgentCount(String verify) throws CustomisedException
	{
		try{
			System.out.println("Agent count before : "+this.agentCount);
			 int count = Integer.parseInt(lblAgentCount.getText().split(" ")[0]); 
			if(verify.equals(""))
				this.agentCount = count;
			else
			{
				if(verify.equals("more")&&count<this.agentCount)
					throw new CustomisedException("Verifying agent Filters", "The count should be more after applying the filter but the count is less \nPrevious Count : "+this.agentCount + "\nCount after applying filter : "+count);
				if(verify.equals("less")&&count>this.agentCount)
					throw new CustomisedException("Verifying agent Filters", "The count should be less after applying the filter but the count is more \nPrevious Count : "+this.agentCount + "\nCount after applying filter : "+count);
				this.agentCount = count;
			}
			System.out.println("Agent count : "+this.agentCount);
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Search Agents", e.getMessage());
		}
		}
	


}
