package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; // Connection : 
	private PreparedStatement pstmt;
	private ResultSet rs; // ResultSet :
	
	public UserDAO() { // 
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studycafe"; //
			String dbID = "root"; // dbID = "root" : 
			String dbPassword = "leeja813"; // 
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName : mysql driver
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn : getConnection(db URL, dbID, dbPassword)
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String phoneNumber, String userPassword) { //
		String SQL = "SELECT userPassword FROM user WHERE phoneNumber = ?"; //
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
			rs = pstmt.executeQuery(); // 
			if (rs.next()) {
				if (rs.getString(1).contentEquals(userPassword)) {
					return 1; // 
				}
				else {
					return 0; // 
				}
			}
				return -1; // 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 
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