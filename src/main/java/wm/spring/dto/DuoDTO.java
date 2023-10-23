package wm.spring.dto;

import java.sql.Timestamp;

public class DuoDTO {
	private int duoCode;
	private int memberCode;
	private int mainPositionCode;
	private int queueCode;
	private int TierCode;
	private String summonerName;
	private String searchingPosition;
	private String memo;
	private String microphone;
	private Timestamp regDate;
	
	public DuoDTO() {}
	public DuoDTO(int duoCode, int memberCode, int mainPositionCode, int queueCode, int tierCode, String summonerName,
			String searchingPosition, String memo, String microphone, Timestamp regDate) {
		super();
		this.duoCode = duoCode;
		this.memberCode = memberCode;
		this.mainPositionCode = mainPositionCode;
		this.queueCode = queueCode;
		TierCode = tierCode;
		this.summonerName = summonerName;
		this.searchingPosition = searchingPosition;
		this.memo = memo;
		this.microphone = microphone;
		this.regDate = regDate;
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
	public int getMainPositionCode() {
		return mainPositionCode;
	}
	public void setMainPositionCode(int mainPositionCode) {
		this.mainPositionCode = mainPositionCode;
	}
	public int getQueueCode() {
		return queueCode;
	}
	public void setQueueCode(int queueCode) {
		this.queueCode = queueCode;
	}
	public int getTierCode() {
		return TierCode;
	}
	public void setTierCode(int tierCode) {
		TierCode = tierCode;
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
	
}
