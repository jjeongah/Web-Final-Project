package OtherUser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OtherUserDAO {
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public OtherUserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studycafe";
			String dbID = "root";
			String dbPassword = "leeja813";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<OtherUser> getAllUsers() {
		String sqlquery = "SELECT * FROM studycafe.users;";
		List<OtherUser> list = new ArrayList<OtherUser>();
		try{
	    	 Statement st = conn.prepareStatement(sqlquery);
	    	 ResultSet rs = st.executeQuery(sqlquery);
	    	 while (rs.next()) {
	    		OtherUser otherUser = new OtherUser();
	    		otherUser.setUserName(rs.getString(1));
	    		otherUser.setUserPassword(rs.getString(2));
	    		otherUser.setPhoneNumber(rs.getString(3));
	    		otherUser.setChargedFee(rs.getInt(4));
	    		otherUser.setSeatId(rs.getInt(5));
	    		otherUser.setLockerId(rs.getInt(6));
	    		otherUser.setTimes(rs.getTimestamp(7), rs.getTimestamp(8));
	    		list.add(otherUser);
	    	}
	    	 return list;
	       }catch (SQLException s){
	    	 System.out.println("SQL statement is not executed!");
	    	 return list;
	      }
	}	
	
	public OtherUser getOneUser(String userPhoneNumber) {
		String sqlquery = "SELECT * FROM studycafe.users WHERE phoneNumber=?;";
		OtherUser otherUser = null;
		try{
			pstmt = conn.prepareStatement(sqlquery);
			pstmt.setString(1,  userPhoneNumber);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				otherUser = new OtherUser(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getTimestamp(7),  rs.getTimestamp(8));
			}
			return otherUser;
	       }catch (SQLException s){
	    	 System.out.println("SQL statement is not executed!");
	    	 return null;
	      }
	}	
	
	public void returnSeat(String userPhoneNumber) {
		String SQL = "UPDATE studycafe.users SET seatId=0 WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void returnLocker(String userPhoneNumber) {
		String SQL = "UPDATE studycafe.users SET lockerId=0 WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
