package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; // Connection : �����ͺ��̽��� �����ϰ� ���ִ� �ϳ��� ��ü 
	private PreparedStatement pstmt;
	private ResultSet rs; // ResultSet : ��� ������ ���� �� �ִ� ��ü 
	
	public UserDAO() { // �����ڸ� ���� UserDAO�� �ν��Ͻ��� �����Ǿ��� �� �ڵ����� DB Ŀ�ؼ��� �̷����������
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studycafe"; // localhost:3306 : �츮 ������ ��ġ�� mysql�� �ǹ�, /BBS : mysql���� BBS��� ������ ���̽��� ������ �� �ֵ��� ��.
			String dbID = "root"; // dbID = "root" : root ������ ������ �� �ֵ��� ��
			String dbPassword = "leeja813"; // �н����峪 ID�� �ٸ��� �Է��ϸ� ���������� DB�� ������ �� ����
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName : mysql driver�� ã�� �� �ֵ��� �� *Driver : mysql�� ������ �� �ֵ��� �Ű�ü ������ ���ִ� �ϳ��� ���̺귯�� 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn : getConnection(db URL, dbID, dbPassword)�� �̿��Ͽ� DB�� �����ϰ� ������ �Ϸᰡ �Ǹ� conn ��ü�ȿ� ���ӵ� ������ ����
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String phoneNumber, String userPassword) { // � ������ ���� ������ �α����� �õ��ϴ� �Լ�, ���ڰ����� ID�� Password�� �޾� login�� �Ǵ���.
		String SQL = "SELECT userPassword FROM user WHERE phoneNumber = ?"; // ������ DB�� �Էµ� ��ɾ SQL �������� ����.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
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
	
	public int registerCheck(String phoneNumber) {
		if(phoneNumber == null) {
			return -2;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE phoneNumber = ?"; // ������ DB�� �Էµ� ��ɾ SQL �������� ����.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; //�̹� �����ϴ� ȸ��
			}
			else {
				return 1; //���� ������ ȸ�� ���̵�
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
		return -1; // DB ����
	}
	
	/*public int register(UserDTO user) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)"; // ������ DB�� �Էµ� ��ɾ SQL �������� ����.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPhoneNumber());
			pstmt.setString(3, user.getUserPassword());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	*/
}