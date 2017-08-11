package dsp.automation.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection_API {

	public Connection checkConnection() throws SQLException {
		//System.out.println("-------- SQL JDBC Connection Testing ------");

		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		} catch (ClassNotFoundException e) {

			//System.out.println("Where is your SQL JDBC Driver?");
			e.printStackTrace();

		}

		//System.out.println("SQL JDBC Driver Registered!");

		Connection connection = null;

		try {
			connection = DriverManager.getConnection("jdbc:sqlserver://dealerserviceportal-dev.database.windows.net:1433;database=DEALERSERVICEPORTAL-INT;user=dspapp;password=dspn0access@123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");

			// Properties DB_info = connection.getClientInfo();
			// System.out.println("clientinfo:" +DB_info);
			if (connection != null) {
				System.out.println("DB is Connected");
				//System.out.println("Doneee !");
			} else {
				System.out.println("Failed to make connection!");
			}
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}

		return connection;

	}
}
