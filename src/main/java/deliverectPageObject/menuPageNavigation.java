package deliverectPageObject;

import java.awt.List;

import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

public class menuPageNavigation {
	@FindBys({ @FindBy(xpath = "//a//span") })
	private java.util.List<WebElement> linkMenuBar;
	@FindBys({ @FindBy(xpath = "//div[contains(@class,'item--dropdow')]") })
	private java.util.List<WebElement> drpDownMenuBar;
	@FindBys({ @FindBy(xpath = "//div[contains(@class,'menu-list')]//ul/li/a") })
	private java.util.List<WebElement> itemDropDownEachLink;

	public void menuBarHoverOrClick(String menuName, String subMenuOrDropDownItem) throws CustomisedException {

		try {
			//TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(By.xpath("//a//span")));
	//TestFunctionsFactory.waitForPageLoaded();
		this.menuLinkClick(menuName);
			this.menuItemHover(menuName,subMenuOrDropDownItem);

		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Moving to Tab", e.getMessage());//
		}

	}

	public void menuLinkClick(String menuName) throws CustomisedException {
		try {

				java.util.List<WebElement> elements=TestFunctionsFactory.driver.findElements((By.xpath("//a//span")));
				
				for(int i=0;i<elements.size();i++) {
				if (elements.get(i).getText().contains(menuName)) {
					
					TestFunctionsFactory.webClick(elements.get(i));
				}
			}
		} catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Moving to Tab", e.getMessage());
		}
	}

	public void menuItemHover(String menuItem,String subMenuOrDropDownItem) throws CustomisedException {
		try {    
//			for (WebElement itemElement :  TestFunctionsFactory.driver.findElements(By.xpath("//div[contains(@class,'item--dropdow')]"))) {
//
//				if (itemElement.getText().contains(menuItem)) {
//					TestFunctionsFactory.mouseHover(itemElement);
//					
//					this.eachDropDownItemClick(subMenuOrDropDownItem);
//					
//				}
//			}
			
			java.util.List<WebElement> elements=TestFunctionsFactory.driver.findElements((By.xpath("//div[contains(@class,'item--dropdow')]")));
			
			for(int i=0;i<elements.size();i++) {

				System.out.println(elements.get(i).toString());
				if (elements.get(i).getText().contains(menuItem)) {

					TestFunctionsFactory.mouseHoverAndClick(elements.get(i));
					this.eachDropDownItemClick(subMenuOrDropDownItem);
				}
			}
		} catch(StaleElementReferenceException e) {
			
		}catch (CustomisedException e) {
			e.printStackTrace();
			throw new CustomisedException("Moving to Tab", e.getMessage());
		}
	}

	public void eachDropDownItemClick(String dropDownItemsLink) throws CustomisedException {
		try {
			 
				java.util.List<WebElement> elements=TestFunctionsFactory.driver.findElements(By.xpath("//div[contains(@class,'menu-list')]//ul/li/a"));
				
				for(int i=0;i<elements.size();i++) {
					//TestFunctionsFactory.webWaitStaleCheck(15, elements.get(i));
					System.out.println(elements.get(i).getText()+" "+dropDownItemsLink);
					if (elements.get(i).getText().contains(dropDownItemsLink)) {

						TestFunctionsFactory.mouseHoverAndClick(elements.get(i));
						TestFunctionsFactory.elementHighlighter(elements.get(i));
						TestFunctionsFactory.waitForPageLoaded();
						
					}
				}
	
//			for (WebElement itemLInksElement :  TestFunctionsFactory.driver.findElements(By.xpath("//div[contains(@class,'menu-list')]//ul/li/a"))) {
//			   //  TestFunctionsFactory.webWaitUntilClickable(30, TestFunctionsFactory.driver.findElement(By.xpath(itemLInksElement.toString())));;
//       
//				if (TestFunctionsFactory.driver.findElement(By.xpath(itemLInksElement.toString())).getText().contains(dropDownItemsLink)) {
//
//					TestFunctionsFactory.mouseHoverAndClick(TestFunctionsFactory.driver.findElement(By.xpath(itemLInksElement.toString())));
//					;
//				}
////	
//			
//			}
			
			
		    // TestFunctionsFactory.webWaitUntilClickable(30, TestFunctionsFactory.driver.findElement(By.xpath("".toString())));;

		}
		catch(StaleElementReferenceException e) {
			
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new CustomisedException("Moving to Tab", e.getMessage()+"STALE");
		}
	}

}
