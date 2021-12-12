package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; // Connection : An object that provides access to the database
	private PreparedStatement pstmt;
	private ResultSet rs; // ResultSet : An object that can contain any information
	
	public UserDAO() { // 
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studycafe"; // localhost:3306: means mysql installed on our server, 
																	//studycafe: allows access to the database called BBS in mysql.
			String dbID = "root"; // dbID = "root" : Allow access to the root account
			String dbPassword = "leeja813"; // If you enter a different password or ID, you cannot access the DB normally.
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName :Helps find mysql driver 
														//*Driver: A library that acts as an intermediary to connect to mysql
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn: Connect to DB using getConnection(db URL, dbID, dbPassword), 
														//and when the connection is complete, the connected information is stored in the conn object.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String phoneNumber, String userPassword) { // A function that actually tries to log in to a certain account, 
																// and determines the login by receiving the ID and password as parameters.
		String SQL = "SELECT userPassword FROM user WHERE phoneNumber = ?"; //the commands to be input to the DB are made into SQL statements.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
			rs = pstmt.executeQuery(); // Put the result of executing the query statement in the rs variable of the ResultSet type that receives a certain result
			if (rs.next()) {
				if (rs.getString(1).contentEquals(userPassword)) {
					return 1; // login complete
				}
				else {
					return 0; // wrong password
				}
			}
				return -1; // this ID doesn't exist
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB error
	}	
	
	public int registerCheck(String phoneNumber) {
		if(phoneNumber == null) {
			return -2;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE phoneNumber = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; 
			}
			else {
				return 1; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // DB 
	}
	
}