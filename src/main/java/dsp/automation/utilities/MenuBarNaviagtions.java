package dsp.automation.utilities;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class MenuBarNaviagtions {
	//// following-sibling::a
	// @FindBy(xpath="//span[@id='dealerPopover']//following-sibling::a" )
	@FindBy(xpath = "//span[@id='dealerPopover']")
	private WebElement dealerCodeIcon;
	@FindBy(xpath = "//span[@id='dealerPopover']//ancestor::li//input")
	private WebElement txtDealerCode;
	String fieldValue = null;

	public void menuNavigation(String menu) throws CustomisedException {
		fieldValue = menu;
		try {

			String[] menuSplit = menu.split("->");
			for (String menuBar : menuSplit) {
				System.out.println("MEnu Navigation" + menuBar);

				java.util.List<WebElement> links = TestFunctionsFactory.driver.findElements(By.xpath("//li//a"));
				TestFunctionsFactory.webWait(60, links.get(0));
				for (WebElement element : links) {
					System.out.println("Ëlement" + element.getText());
					if (element.getText().replaceAll(" ", "").trim().toUpperCase()
							.startsWith(menuBar.replaceAll(" ", "").trim().toUpperCase())) {
						System.out.println("Target Element" + element.getText());
						TestFunctionsFactory.webWait(60, element);
						TestFunctionsFactory.mouseHover(element);
						TestFunctionsFactory.webClick(element);

					}

				}
			}

		} catch (Exception e) {
			CustomisedException obj = new CustomisedException(
					"Navigation to the " + fieldValue + "is having the following exception", e.getMessage().toString());
			throw obj;
		}

	}

	public void dealerSearch(String dealerCode) throws CustomisedException {
		fieldValue = dealerCode;
		try {
			// TestFunctionsFactory.webWait(60, dealerCodeIcon);

			TestFunctionsFactory.mouseHoverAndClick(dealerCodeIcon);

			TestFunctionsFactory.webWait(15, txtDealerCode);
			TestFunctionsFactory.webEditText(txtDealerCode, dealerCode);
			WebElement suggDealerCode = TestFunctionsFactory.driver
					.findElement(By.xpath("//ul[@id='dealerResult']//li[contains(text(),'" + dealerCode + "')]"));
			TestFunctionsFactory.webWait(30, suggDealerCode);
			TestFunctionsFactory.mouseHover(suggDealerCode);
			TestFunctionsFactory.javaScriptClick(suggDealerCode);
			TestFunctionsFactory.webWaitPages(60, dealerCodeIcon);
		} catch (Exception e) {
			CustomisedException obj = new CustomisedException(
					"Navigation to the " + fieldValue + "is facing the following exception", e.getMessage().toString());
			throw obj;
		}

	}

	public void delaerCodeVerification(String dealerCode) throws CustomisedException {
		fieldValue = dealerCode;
		try {
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
