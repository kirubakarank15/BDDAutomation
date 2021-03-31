package demo.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;

/**
 * @author Kirubakaran.K(kk)
 *PropertyFinder-Demo Cucumber Automation
 * 
 */
public class ExcelReadWrite_API {
	/*kk
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, String> excelReadWrite() throws Exception {
		HashMap<String, String> requestMap = new HashMap<>();
		try {
			File fileObj = new File("Resources\\keyAsset.xls");
			FileInputStream fsIP = new FileInputStream(fileObj);
			HSSFWorkbook wb = new HSSFWorkbook(fsIP);
			Sheet s = wb.getSheet("Sheet1");
			int rowcount = s.getLastRowNum();

			String key = null;
			String valueConcat = "";

			for (int i = 1; i <= rowcount; i++)

			{

				for (int j = 0; j < s.getRow(i).getLastCellNum(); j++) {
					if (j == 0) {
						key = s.getRow(i).getCell(j).toString();
						//System.out.println("key:" + key);

					}
					if (j == 1) {

						String Value = s.getRow(i).getCell(j).toString();
						//System.out.println(Value);
						String[] var = Value
								.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");

						long h;
						char[] zero = null;
						String zeroString = "";
						for (String k : var) {

							if (k.matches("[0-9]+")) {

								h = Long.parseLong(k) + 1;
								// System.out.println("h is "+h);
								if (k.startsWith("0")) {
									zero = k.toCharArray();
									for (char zeroLoop : zero) {
										if (zeroLoop != '0') {
											break;
										}

										zeroString = zeroString + zeroLoop;

									}
									valueConcat = valueConcat + zeroString + h;

								} else {
									valueConcat = valueConcat + h;
								}

							} else {

								valueConcat = valueConcat + k;

							}
							s.getRow(i).getCell(j).setCellValue(valueConcat);

						}

					}
				}

				requestMap.put(key, valueConcat);
				valueConcat = "";
			}

			System.out.println(requestMap);
			FileOutputStream outputStream = new FileOutputStream(fileObj);
			wb.write(outputStream);
			wb.close();
		} catch (NullPointerException e) {
			throw new Exception(e);
		}
		return requestMap;
	}
}
