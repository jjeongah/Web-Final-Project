package reserve;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import OtherUser.OtherUser;

public class Reserve {
	//모든 유저들의 정보를 저장
	private List<OtherUser> reserveInfo;
	//나의 정보 저장
	private OtherUser myInfo;
	public ReserveDAO reserveDAO;
	
	public Reserve(List<OtherUser> reserveInfo, String myPhoneNumber) {
		reserveDAO = new ReserveDAO();
		this.reserveInfo = reserveInfo;
		//내 전화번호로 내 정보 가져오기
		ArrayList infoList = reserveDAO.getMyInfo(myPhoneNumber);
		myInfo = new OtherUser(infoList.get(0).toString(), infoList.get(1).toString(),
				infoList.get(2).toString(), (int)(infoList.get(3)),
				(int)infoList.get(4), (int)infoList.get(5),
				(Timestamp)infoList.get(6), (Timestamp)infoList.get(7));
		for(int i=0;i<8;i++) {
			System.out.println(infoList.get(i));
		}
	
	}
	
	public Reserve(List<OtherUser> reserveInfo, OtherUser myInfo) {
		reserveDAO = new ReserveDAO();
		this.reserveInfo = reserveInfo;
		this.myInfo = myInfo;
	}
	
	public void setReserveInfo(List<OtherUser> reserveInfo) {
		this.reserveInfo = reserveInfo;
	}
	public List<OtherUser> getReserveInfo(){
		return reserveInfo;
	}
	
	public void setMyInfo(OtherUser myInfo) {
		this.myInfo = myInfo;
	}
	public OtherUser getMyInfo(){
		return myInfo;
	}
	
}

