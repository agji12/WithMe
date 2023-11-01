package wm.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import wm.spring.dto.MemberDTO;
import wm.spring.repositories.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public boolean emailCheck(String email) {
		return memberDAO.emailCheck(email);
	}
	
	public boolean nicknameCheck(String nickname) {
		return memberDAO.nicknameCheck(nickname);
	}
	
	public int selectMemberCode(String email) {
		return memberDAO.selectMemberCode(email);
	}
	
}
