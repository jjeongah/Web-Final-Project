package reserve;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import OtherUser.OtherUser;

public class Reserve {
	//store all user's information
	private List<OtherUser> reserveInfo;
	//store current reserved seats and lockers
	public Set reserveSeats;
	public Set reserveLockers;
	//store current user's information
	private OtherUser myInfo;
	public ReserveDAO reserveDAO;
	
	public Reserve(List<OtherUser> reserveInfo, String myPhoneNumber) {
		reserveDAO = new ReserveDAO();
		this.reserveInfo = reserveInfo;
		reserveSeats = new HashSet<Integer>();
		reserveLockers = new HashSet<Integer>();
		for(int i=0;i<reserveInfo.size();i++) {
			//store only valid seat and locker in set.
			if(reserveInfo.get(i).checkValidSeat()==true) {
				reserveSeats.add(reserveInfo.get(i).getSeatId());
			}if(reserveInfo.get(i).checkValidLocker()==true) {
				reserveLockers.add(reserveInfo.get(i).getLockerId());
			}
		} 
		//get current user's information with his/her phone number
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
			//store only valid seat and locker in set.
			if(reserveInfo.get(i).checkValidSeat()==true) {
				reserveSeats.add(reserveInfo.get(i).getSeatId());
			}if(reserveInfo.get(i).checkValidLocker()==true) {
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

