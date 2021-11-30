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