package reserve;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import OtherUser.OtherUser;

public class Reserve {
	//모든 유저들의 정보를 저장
	private List<OtherUser> reserveInfo;
	public Set reserveSeats;
	public Set reserveLockers;
	//나의 정보 저장
	private OtherUser myInfo;
	public ReserveDAO reserveDAO;
	
	public Reserve(List<OtherUser> reserveInfo, String myPhoneNumber) {
		reserveDAO = new ReserveDAO();
		this.reserveInfo = reserveInfo;
		reserveSeats = new HashSet<Integer>();
		reserveLockers = new HashSet<Integer>();
		for(int i=0;i<reserveInfo.size();i++) {
			if(reserveInfo.get(i).getSeatId()!=0) {
				reserveSeats.add(reserveInfo.get(i).getSeatId());
			}if(reserveInfo.get(i).getLockerId()!=0) {
				reserveLockers.add(reserveInfo.get(i).getLockerId());
			}
		} 
		//내 전화번호로 내 정보 가져오기
		ArrayList infoList = reserveDAO.getMyInfo(myPhoneNumber);
		myInfo = new OtherUser(infoList.get(0).toString(), infoList.get(1).toString(),
				infoList.get(2).toString(), (int)(infoList.get(3)),
				(int)infoList.get(4), (int)infoList.get(5),
				(Timestamp)infoList.get(6), (Timestamp)infoList.get(7));
	
	}
	
	public Reserve(List<OtherUser> reserveInfo, OtherUser myInfo) {
		reserveDAO = new ReserveDAO();
		this.reserveInfo = reserveInfo;
		this.myInfo = myInfo;
		reserveSeats = new HashSet<Integer>();
		reserveLockers = new HashSet<Integer>();
		for(int i=0;i<reserveInfo.size();i++) {
			if(reserveInfo.get(i).getSeatId()!=0) {
				reserveSeats.add(reserveInfo.get(i).getSeatId());
			}if(reserveInfo.get(i).getLockerId()!=0) {
				reserveLockers.add(reserveInfo.get(i).getLockerId());
			}
		} 
	}
	
	public int getNumOfSeats() {
		return reserveSeats.size();
	}
	
	public int getNumOfLockers() {
		return reserveLockers.size();
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

