package wm.spring.dto;

import java.sql.Timestamp;

public class DuoReplyDTO {
	private int duoReplyCode;
	private int duoCode;
	private int memberCode;
	private String content;
	private Timestamp regDate;
	private String nickname;
	private String regDateString;
	
	public DuoReplyDTO() {}
	public DuoReplyDTO(int duoReplyCode, int duoCode, int memberCode, String content, Timestamp regDate,
			String nickname, String regDateString) {
		super();
		this.duoReplyCode = duoReplyCode;
		this.duoCode = duoCode;
		this.memberCode = memberCode;
		this.content = content;
		this.regDate = regDate;
		this.nickname = nickname;
		this.regDateString = regDateString;
	}

	public int getDuoReplyCode() {
		return duoReplyCode;
	}
	public void setDuoReplyCode(int duoReplyCode) {
		this.duoReplyCode = duoReplyCode;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRegDateString() {
		return regDateString;
	}
	public void setRegDateString(String regDateString) {
		this.regDateString = regDateString;
	}
	
}
