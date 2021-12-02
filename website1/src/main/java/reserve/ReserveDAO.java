package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class ReserveDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReserveDAO() {
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
	
	public ArrayList getMyInfo(String userPhoneNumber) {
		ArrayList infoList = new ArrayList();
		String SQL = "SELECT * FROM studycafe.users WHERE phoneNumber = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPhoneNumber);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				infoList.add(rs.getString(1));
				infoList.add(rs.getString(2));
				infoList.add(rs.getString(3));
				infoList.add(rs.getInt(4));
				infoList.add(rs.getInt(5));
				infoList.add(rs.getInt(6));
				infoList.add(rs.getTimestamp(7));
				infoList.add(rs.getTimestamp(8));
			}
			return infoList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoList;
	}
	
	public int reserveSeat(String userPhoneNumber,int userChargedFee,int neededFee, int reserveSeatId, int reserveTime) {
		if(userChargedFee<neededFee) {
			return -1;
		}
		
		java.util.Date date = new Date();
		long time = date.getTime();
		Timestamp start = new Timestamp(time);
		//여기까지가 Date를 Timestamp로 전환하는 과정
		 
		//이제 Timestamp에 계산하기, 3일을 더해보자.
		Calendar cal = Calendar.getInstance();
		cal.setTime(start);
		cal.add(Calendar.HOUR, reserveTime);
		Timestamp end = new Timestamp(time);
		end.setTime(cal.getTime().getTime());
		
		String SQL = "UPDATE studycafe.users SET seatId=?, seatStartTime=?, seatEndTime=? WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  reserveSeatId);
			pstmt.setTimestamp(2,  start);
			pstmt.setTimestamp(3,  end);
			pstmt.setString(4,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	public void reserveLocker(String userPhoneNumber, int reserveLockerId) {
		String SQL = "UPDATE studycafe.users SET lockerId=? WHERE (phoneNumber = ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  reserveLockerId);
			pstmt.setString(2,  userPhoneNumber);
			int i= pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}