package dsp.automation.utilities;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class DBMapValues {
	public static String value = null;

	public static TreeMap<String, List<String>> getMapValues(String query)
			throws SQLException {
		// String sNumber=(String) htable.get("serialNumber");
		// String makeNum=(String) htable.get("make");
		DBconnection_API dbConnection = new DBconnection_API();
		Statement st = dbConnection.checkConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

		String sql = (query);
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
	
	public static String dbValue(String columName, String Query) throws SQLException {

		TreeMap<String, List<String>> map = getMapValues(Query);
		//System.out.println("Printing"+map);
		
		value = map.get(columName.toUpperCase()).get(0);
		
		if(value==null)
		{
			System.out.println("No Value is Present in DB");
		}
		return value;
 
	}

}
