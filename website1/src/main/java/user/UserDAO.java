package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; // Connection : 데이터베이스에 접근하게 해주는 하나의 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // ResultSet : 어떠한 정보를 담을 수 있는 객체 
	
	public UserDAO() { // 생성자를 통해 UserDAO의 인스턴스가 생성되었을 때 자동으로 DB 커넥션이 이루어지도록함
		try {
			String dbURL = "jdbc:mysql://localhost:3306/studycafe"; // localhost:3306 : 우리 서버에 설치된 mysql을 의미, /BBS : mysql안의 BBS라는 데이터 베이스에 접속할 수 있도록 함.
			String dbID = "root"; // dbID = "root" : root 계정에 접근할 수 있도록 함
			String dbPassword = "leeja813"; // 패스워드나 ID를 다르게 입력하면 정상적으로 DB에 접속할 수 없음
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName : mysql driver를 찾을 수 있도록 함 *Driver : mysql에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn : getConnection(db URL, dbID, dbPassword)를 이용하여 DB에 접속하고 접속이 완료가 되면 conn 객체안에 접속된 정보가 담긴다
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String phoneNumber, String userPassword) { // 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
		String SQL = "SELECT userPassword FROM USER WHERE phoneNumber = ?"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
			rs = pstmt.executeQuery(); // 어떠한 결과를 받아오는 ResultSet 타입의 rs 변수에 쿼리문을 실행한 결과를 넣어줌 
			if (rs.next()) {
				if (rs.getString(1).contentEquals(userPassword)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
				return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 오류 
	}	
	
	public int registerCheck(String phoneNumber) {
		if(phoneNumber == null) {
			return -2;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE phoneNumber = ?"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  phoneNumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; //이미 존재하는 회원
			}
			else {
				return 1; //가입 가능한 회원 아이디
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
		return -1; // DB 오류
	}
	
	/*public int register(UserDTO user) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
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