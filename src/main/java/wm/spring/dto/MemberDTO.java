package wm.spring.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private int memberCode;
	private String email;
	private String password;
	private String nickname;
	private String birthday;
	private Timestamp regDate;
	
	public MemberDTO() {}
	public MemberDTO(int memberCode, String email, String password, String nickname, String birthday,
			Timestamp regDate) {
		super();
		this.memberCode = memberCode;
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.birthday = birthday;
		this.regDate = regDate;
	}
	
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	};
}
