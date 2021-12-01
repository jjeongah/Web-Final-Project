package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	public int login(String userID, String userPassword) { // � ������ ���� ������ �α����� �õ��ϴ� �Լ�, ���ڰ����� ID�� Password�� �޾� login�� �Ǵ���.
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; // ������ DB�� �Էµ� ��ɾ SQL �������� ����.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery(); // ��� ����� �޾ƿ��� ResultSet Ÿ���� rs ������ �������� ������ ����� �־��� 
			if (rs.next()) {
				if (rs.getString(1).contentEquals(userPassword)) {
					return 1; // �α��� ����
				}
				else {
					return 0; // ��й�ȣ ����ġ
				}
			}
				return -1; // ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB ���� 
	}	

}