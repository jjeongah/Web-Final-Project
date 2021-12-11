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
//class for connect "OtherUser" object with BackEnd
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;
	public String userPhoneNumber;
	private int userChargedFee;
	
	public OtherUserDAO() {
		try {
			//connect with mysql database
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
		//get all user's information
		String sqlquery = "SELECT * FROM studycafe.user;";
		List<OtherUser> list = new ArrayList<OtherUser>();
		try{
	    	 Statement st = conn.prepareStatement(sqlquery);
	    	 rs = st.executeQuery(sqlquery);
	    	 while (rs.next()) {
	    		OtherUser otherUser = new OtherUser();
	    		otherUser.setUserName(rs.getString(1));//user name
	    		otherUser.setUserPassword(rs.getString(2));//user password
	    		otherUser.setPhoneNumber(rs.getString(3));//phone number
	    		otherUser.setChargedFee(rs.getInt(4));//charged fee
	    		otherUser.setSeatId(rs.getInt(5));//seat id
	    		otherUser.setLockerId(rs.getInt(6));//locker id
	    		otherUser.setTimes(rs.getTimestamp(7), rs.getTimestamp(8));//seat starttime, endtime
	    		list.add(otherUser);
	    	}
	    	 return list;
	       }catch (SQLException s){
	    	 System.out.println("SQL statement is not executed!");
	    	 return list;
	      }
	}	
	
	public OtherUser getOneUser(String userPhoneNumber) {
		//get only one user's information with user's phone number
		//Using phone number, select wanted user
		String sqlquery = "SELECT * FROM studycafe.user WHERE phoneNumber=?;";
		if(userPhoneNumber==null) {return null;}
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
	
	public Boolean returnSeat(String userPhoneNumber) {
		//do "return seat" action with user's phone number
		//Using phone number, update seatId to 0
		//"seatId:0" means "user don't reserve seat"
		String SQL = "UPDATE studycafe.user SET seatId=0 WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Boolean returnLocker(String userPhoneNumber) {
		//do "return locker" action with user's phone number
		//Using phone number, update lockerId to 0
		//"lockerId:0" means "user don't reserve locker"
		String SQL = "UPDATE studycafe.user SET lockerId=0 WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Boolean chargeFee(String userPhoneNumber, int userChargedFee) {
		//do "charge fee" action with user's phone number
		//Using phone number, update new chargedFee
		String SQL = "UPDATE studycafe.user SET chargedFee=chargedFee+? WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  userChargedFee);
			pstmt.setString(2,  userPhoneNumber);
			int i= pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//get and set methods
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public int getUserChargedFee() {
		return userChargedFee;
	}

	public void setUserChargedFee(int userChargedFee) {
		this.userChargedFee = userChargedFee;
	}
}
