package wm.spring.dto;

import java.sql.Timestamp;

public class DuoDTO {
	private int duoCode;
	private int memberCode;
	private int myPositionCode;
	private int queueCode;
	private int tierCode;
	private String summonerName;
	private String searchingPosition;
	private String memo;
	private String microphone;
	private Timestamp regDate;
	private String queueName;
	private String tierName;
	private String positionName;
	
	public DuoDTO() {}
	public DuoDTO(int duoCode, int memberCode, int myPositionCode, int queueCode, int tierCode, String summonerName,
			String searchingPosition, String memo, String microphone, Timestamp regDate, String queueName,
			String tierName, String positionName) {
		super();
		this.duoCode = duoCode;
		this.memberCode = memberCode;
		this.myPositionCode = myPositionCode;
		this.queueCode = queueCode;
		this.tierCode = tierCode;
		this.summonerName = summonerName;
		this.searchingPosition = searchingPosition;
		this.memo = memo;
		this.microphone = microphone;
		this.regDate = regDate;
		this.queueName = queueName;
		this.tierName = tierName;
		this.positionName = positionName;
	}

	public int getDuoCode() {
		return duoCode;
	}
	public void setDuoCode(int duoCode) {
		this.duoCode = duoCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getMyPositionCode() {
		return myPositionCode;
	}
	public void setMyPositionCode(int myPositionCode) {
		this.myPositionCode = myPositionCode;
	}
	public int getQueueCode() {
		return queueCode;
	}
	public void setQueueCode(int queueCode) {
		this.queueCode = queueCode;
	}
	public int getTierCode() {
		return tierCode;
	}
	public void setTierCode(int tierCode) {
		this.tierCode = tierCode;
	}
	public String getSummonerName() {
		return summonerName;
	}
	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}
	public String getSearchingPosition() {
		return searchingPosition;
	}
	public void setSearchingPosition(String searchingPosition) {
		this.searchingPosition = searchingPosition;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getMicrophone() {
		return microphone;
	}
	public void setMicrophone(String microphone) {
		this.microphone = microphone;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getQueueName() {
		return queueName;
	}
	public void setQueueName(String queueName) {
		this.queueName = queueName;
	}
	public String getTierName() {
		return tierName;
	}
	public void setTierName(String tierName) {
		this.tierName = tierName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
}
