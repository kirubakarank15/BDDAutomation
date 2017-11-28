package dsp.automation.utilities;

import java.util.List;
import java.util.logging.Logger;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


import dsp.automation.pom.Login;

/**
 * @author Kirubakaran.K(Krishk10)
 *DSP-ISSS Cucumber Automation
 * 
 */
public class MenuBarNaviagtions {
	//// following-sibling::a
	// @FindBy(xpath="//span[@id='dealerPopover']//following-sibling::a" )
	@FindBy(xpath = "//span[@id='dealerPopover']")
	private WebElement dealerCodeIcon;
	@FindBy(xpath = "//span[@id='dealerPopover']//ancestor::li//input")
	private WebElement txtDealerCode;
	String fieldValue = null;
	private final static Logger LOGGER = Logger.getLogger(MenuBarNaviagtions.class.getName());
	/*krishk10
	 * @param menu
	 * @throws CustomisedException
	 */
	public void menuNavigation(String menu) throws CustomisedException {
		fieldValue = menu;
		try {		TestFunctionsFactory.waitForPageLoaded();
			
			LOGGER.info("Navigating to Menubar "+ menu);
	
			String[] menuSplit = menu.split("->"); 
		
			for (String menuBar : menuSplit) {
	

				java.util.List<WebElement> links = TestFunctionsFactory.driver.findElements(By.xpath("//li//a"));
		
				for (WebElement element : links) {
			
					if (element.getText().replaceAll(" ", "").trim().toUpperCase()
							.startsWith(menuBar.replaceAll(" ", "").trim().toUpperCase())) {
					
					
						//TestFunctionsFactory.webWaitStaleCheck(20, element);
						TestFunctionsFactory.mouseHover(element);
				
						TestFunctionsFactory.webClick(element);
						
						if(menuBar.replaceAll(" ", "").trim().toUpperCase().equals("MYWORKLIST")){
						List<WebElement> obj=TestFunctionsFactory.driver.findElements(By.xpath("//button[contains(text(),'Cancel')]"));
						if(obj.size()!=0){
							LOGGER.info("Handled Warning Pop Up for not saving with Cancel"+obj);
							TestFunctionsFactory.waitForPageLoaded();
							TestFunctionsFactory.javaScriptClick(TestFunctionsFactory.driver.findElement(By.xpath("//button[contains(text(),'Cancel')]")));
						}
						
						List<WebElement> OkObj=TestFunctionsFactory.driver.findElements(By.xpath("//button[contains(text(),'OK')]"));
						if(OkObj.size()!=0){
							LOGGER.info("Handled Warning Pop Up for not saving with OK");
							TestFunctionsFactory.webClick(TestFunctionsFactory.driver.findElement(By.xpath("//button[contains(text(),'OK')]")));
						}
						}
						
					}

				}
			}

		} catch (Exception e) {
			
			CustomisedException obj = new CustomisedException(
					"Navigation to the " + fieldValue + "is having the following exception", e.getMessage().toString());
			throw obj;
		}

	}

	/*krishk10
	 * @param dealerCode
	 * @throws CustomisedException
	 */
	public void dealerSearch(String dealerCode) throws CustomisedException {
		fieldValue = dealerCode;
		try {
			// TestFunctionsFactory.webWait(60, dealerCodeIcon);
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.mouseHoverAndClick(dealerCodeIcon);

			TestFunctionsFactory.webWait(15, txtDealerCode);
			TestFunctionsFactory.webEditText(txtDealerCode, dealerCode);
			WebElement suggDealerCode = TestFunctionsFactory.driver
					.findElement(By.xpath("//ul[@id='dealerResult']//li[contains(text(),'" + dealerCode + "')]"));
			TestFunctionsFactory.webWait(30, suggDealerCode);
			TestFunctionsFactory.mouseHover(suggDealerCode);
			TestFunctionsFactory.javaScriptClick(suggDealerCode);
			//TestFunctionsFactory.webWait(60, dealerCodeIcon);
			
		} catch (Exception e) {
			CustomisedException obj = new CustomisedException(
					"Navigation to the " + fieldValue + "is facing the following exception", e.getMessage().toString());
			throw obj;
		}

	}

	/*krishk10
	 * @param dealerCode
	 * @throws CustomisedException
	 */
	public void delaerCodeVerification(String dealerCode) throws CustomisedException {
		fieldValue = dealerCode;
		try {
			
			TestFunctionsFactory.waitForPageLoaded();
			TestFunctionsFactory.webWait(30, dealerCodeIcon); 
			WebElement changedDealerIcon = TestFunctionsFactory.driver
					.findElement(By.xpath("//a[contains(text(),'" + dealerCode + "')]"));
			TestFunctionsFactory.verifyElementdisplayed(changedDealerIcon);
		} catch (Exception e) {
			CustomisedException obj = new CustomisedException(
					fieldValue + "is not displayed in dealer icon with the below error Message",
					e.getMessage().toString());
			throw obj;
		}
	}

}
