package OtherUser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
}
