package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class ReserveDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int reserveSeatId;
	private int reserveSeatTimeNumber;
	private String userPhoneNumber;
	private int userChargedFee;
	private int neededFee;
	private String seatEndTime;
	
	private int reserveLockerId;
	public ReserveDAO() {
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
	
	
	public ArrayList getMyInfo(String userPhoneNumber) {
		//get current user's information with user's phone number
		ArrayList infoList = new ArrayList();
		String SQL = "SELECT * FROM studycafe.user WHERE phoneNumber = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPhoneNumber);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				infoList.add(rs.getString(1));//user name
				infoList.add(rs.getString(2));//user password
				infoList.add(rs.getString(3));//phone number
				infoList.add(rs.getInt(4));//charged fee
				infoList.add(rs.getInt(5));//seatId
				infoList.add(rs.getInt(6));//lockerId
				infoList.add(rs.getTimestamp(7));//seatStartTime
				infoList.add(rs.getTimestamp(8));//seatEndTime
			}
			return infoList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoList;
	}
	
	public int reserveSeat(String userPhoneNumber,int userChargedFee,int neededFee, int reserveSeatId, int reserveTime) {
		//do "reserve seat" for current user
		//if user's charged fee is smaller than needed fee -> error message
		if(userChargedFee<neededFee) {
			return -1;
		}
		//get current time(seatStartTime)
		java.util.Date date = new Date();
		long time = date.getTime();
		Timestamp start = new Timestamp(time);
		//add reserveTime to current time(seatEndTime)
		Calendar cal = Calendar.getInstance();
		cal.setTime(start);
		cal.add(Calendar.HOUR, reserveTime);
		Timestamp end = new Timestamp(time);
		end.setTime(cal.getTime().getTime());
		
		String SQL = "UPDATE studycafe.user SET seatId=?, seatStartTime=?, seatEndTime=?, chargedFee=? WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  reserveSeatId);
			pstmt.setTimestamp(2,  start);
			pstmt.setTimestamp(3,  end);
			pstmt.setInt(4,  userChargedFee-neededFee);
			pstmt.setString(5,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
		return 1;
	}
	
	public Boolean reserveLocker(String userPhoneNumber, int reserveLockerId) {
		//do "reserve locker" for current user
		//it is rent service without paying money
		//so just record this in database
		String SQL = "UPDATE studycafe.user SET lockerId=? WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  reserveLockerId);
			pstmt.setString(2,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public int extendSeat(String userPhoneNumber,int userChargedFee,int neededFee, 
			int reserveSeatId, int reserveTime, String seatEndTime) {
		//do "extend seat" for current user
		//if user's charged fee is smaller than needed fee -> error message
		if(userChargedFee<neededFee) {
			return -1;
		}
		//will change seatEndTime to new extended end time
		Timestamp seatEndTimeStamp = null;
		try {
			//transform string -> timestamp
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		    Date parsedDate = dateFormat.parse(seatEndTime);
		    seatEndTimeStamp = new Timestamp(parsedDate.getTime());
		} catch(Exception e) {
			e.printStackTrace();
		}
		//add extendtime to original seatEndTime
		Calendar cal = Calendar.getInstance();
		cal.setTime(seatEndTimeStamp);
		cal.add(Calendar.HOUR, reserveTime);
		Timestamp end = seatEndTimeStamp;
		end.setTime(cal.getTime().getTime());
		
		String SQL = "UPDATE studycafe.user SET seatEndTime=?, chargedFee=? WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setTimestamp(1,  end);
			pstmt.setInt(2,  userChargedFee-neededFee);
			pstmt.setString(3,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
		return 1;
	}
	
	public void setReserveSeatId( int reserveSeatId) {
		this.reserveSeatId = reserveSeatId;
	}
	public void setReserveSeatTimeNumber( int reserveSeatTimeNumber) {
		this.reserveSeatTimeNumber = reserveSeatTimeNumber;
	}
	public int getReserveSeatId() {
		return reserveSeatId;
	}
	public int getReserveSeatTimeNumber() {
		return reserveSeatTimeNumber;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public int getUserChargedFee() {
		return userChargedFee;
	}

	public void setUserChargedFee(int userChargedFee) {
		this.userChargedFee = userChargedFee;
	}

	public int getNeededFee() {
		return neededFee;
	}

	public void setNeededFee(int neededFee) {
		this.neededFee = neededFee;
	}

	public int getReserveLockerId() {
		return reserveLockerId;
	}

	public void setReserveLockerId(int reserveLockerId) {
		this.reserveLockerId = reserveLockerId;
	}

	public String getSeatEndTime() {
		return seatEndTime;
	}

	public void setSeatEndTime(String seatEndTime) {
		this.seatEndTime = seatEndTime;
	}

}