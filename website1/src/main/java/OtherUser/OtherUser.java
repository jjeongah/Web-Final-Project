package OtherUser;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class OtherUser {
	private String userName;
	private String userPassword;
	private String phoneNumber;
	private int chargedFee;
	private int seatId;
	private int lockerId;
	private Timestamp seatStartTime;
	private Timestamp seatEndTime;
	
	public OtherUser(){}
	
	public OtherUser(String userName, String userPassword, String phoneNumber,
			int chargedFee, int seatId, int lockerId, Timestamp seatStartTime,  Timestamp seatEndTime) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.phoneNumber = phoneNumber;
		this.chargedFee = chargedFee;
		this.seatId = seatId;
		this.lockerId = lockerId;
		this.seatStartTime = seatStartTime;
		this.seatEndTime = seatEndTime;
	}
	
	public Boolean checkValidSeat() {
		//check seat is valid(currently used seat)
		//if seatId is 0
		//if seatEndTime is null or before current time
		//--->it is invalid seat
		Timestamp currenttimestamp = new Timestamp(System.currentTimeMillis());
		if(seatId==0) {
			return false;
		}else if(seatEndTime==null) {
			return false;
		}
		else if(seatEndTime.before(currenttimestamp)) {
			return false;
		}
		return true;
	}
	
	public Boolean checkValidLocker() {
		//check locker is valid(currently used seat)
		//if lockerId is 0
		//--->it is invalid locker
		if(lockerId==0) {
			return false;
		}
		return true;
	}
	
	//get and set methods
	public String getuserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public int getChargedFee() {
		return chargedFee;
	}
	public void setChargedFee(int chargedFee) {
		this.chargedFee = chargedFee;
	}
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	
	public int getLockerId() {
		return lockerId;
	}
	public void setLockerId(int lockerId) {
		this.lockerId = lockerId;
	}
	
	public Timestamp getSeatStartTime() {
		return seatStartTime;
	}
	public Timestamp getSeatEndTime() {
		return seatEndTime;
	}
	public void setSeatStartTime(Timestamp seatStartTime) {
		this.seatStartTime = seatStartTime;
	}
	public void setSeatEndTime(Timestamp seatEndTime) {
		this.seatEndTime = seatEndTime;
	}
	public void setTimes(Timestamp seatStartTime, Timestamp seatEndTime) {
		this.seatStartTime = seatStartTime;
		this.seatEndTime = seatEndTime;
	}
}
