package dsp.automation.utilities;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

/**
 * @author Kirubakaran.K(Krishk10)
 *DSP-ISSS Cucumber Automation
 * 
 */
public class DBMapValues {
	public static String value = null;

	/*krishk10
	 * @param query
	 * @return complete DB result as TreeMap<String, List<String>>
	 * @throws SQLException
	 * @throws InterruptedException
	 */
	public static TreeMap<String, List<String>> getMapValues(String query)
			throws SQLException, InterruptedException {
		// String sNumber=(String) htable.get("serialNumber");
		// String makeNum=(String) htable.get("make");
		DBconnection_API dbConnection = new DBconnection_API();
		Statement st = dbConnection.checkConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

		String sql = (query);
		//Thread.sleep(10000);
		ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		/*
		 * int noOfRows=0; int k=0; rs.last(); noOfRows = rs.getRow(); // Move
		 * to beginning rs.beforeFirst(); System.out.println(noOfRows);
		 */
		int columnsNumber = rsmd.getColumnCount();
		List<String> columnNameList = new ArrayList<>();
		TreeMap<String, List<String>> dbValues = new TreeMap<>();

		for (int columnName = 1; columnName <= columnsNumber; columnName++) {
			columnNameList.add(rsmd.getColumnLabel(columnName));
		}
		// System.out.println(querylist);

		for (String columnName : columnNameList) {
			rs.beforeFirst();
			// System.out.println(St);
			List<String> colValues = new ArrayList<>();
			while (rs.next()) {
				String columnValue = rs.getString(columnName);
				// System.out.println(columnValue);
				colValues.add(columnValue);

				if (!rs.next()) {
					dbValues.put(columnName.toUpperCase(), colValues); 

					break;
				}
				rs.previous();

			}
			// System.out.println(colValues);
		}
		System.out.println(dbValues);
		return dbValues;
	}
	
	/*krishk10
	 * @param columName
	 * @param Query
	 * @return
	 * @throws SQLException
	 * @throws InterruptedException
	 */
	public static String dbValue(String columName, String Query) throws SQLException, InterruptedException {

		TreeMap<String, List<String>> map = getMapValues(Query);
		//System.out.println("Printing"+map);
		//Thread.sleep(10000);
		value = map.get(columName.toUpperCase()).get(0);
		
		if(value==null)
		{
			System.out.println("No Value is Present in DB");
		}
		return value;
 
	}

}
