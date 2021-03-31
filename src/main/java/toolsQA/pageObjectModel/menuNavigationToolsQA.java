
package toolsQA.pageObjectModel;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import demo.utilities.CustomisedException;
import demo.utilities.TestFunctionsFactory;

/**
 * @author Kirubakaran.K(kk) PropertyFinder-Demo Cucumber Automation
 * 
 */
public class menuNavigationToolsQA {
	/*
	 * kk
	 * 
	 * @param menu
	 * 
	 * @throws CustomisedException
	 */
	static String s = "";

	public void menuNavigation(String menu) throws CustomisedException {
		String fieldValue = menu;
		try {
			TestFunctionsFactory.waitForPageLoaded();

			String[] menuSplit = menu.split("->");

			for (int i = 0; i < menuSplit.length; i++) {
				List<WebElement> simpleMenu = TestFunctionsFactory.driver
						.findElements(By.xpath("//ul[@id='primary-menu']//li//a//span"));

				for (WebElement element : simpleMenu) {
					if (element.getText().trim().replaceAll(" ", "").toUpperCase()
							.equals(menuSplit[i].trim().replaceAll(" ", "").toUpperCase())) {

						TestFunctionsFactory.mouseHoverAndClick(element);
						System.out.println("clicked" + element.getText());
						break;
					

					}
				}
			}

		} catch (Exception e) {

			CustomisedException obj = new CustomisedException(
					"Navigation to the " + fieldValue + "is having the following exception", e.getMessage().toString());
			throw obj;
		}

	}

}
