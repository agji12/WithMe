package wm.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wm.spring.commons.EncryptionUtils;
import wm.spring.dto.MemberDTO;
import wm.spring.repositories.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public int signUp(MemberDTO dto) throws Exception {
		// 비밀번호 Sha512 적용
		String shaPw = EncryptionUtils.sha512(dto.getPassword());
		dto.setPassword(shaPw);
		
		return memberDAO.signUp(dto);
	}
	
	public boolean signIn(MemberDTO dto) throws Exception {
		// 비밀번호 Sha512 적용
		String shaPw = EncryptionUtils.sha512(dto.getPassword());
		dto.setPassword(shaPw);
		
		return memberDAO.signIn(dto);
	}
	
	public boolean emailCheck(String email) {
		return memberDAO.emailCheck(email);
	}
	
	public boolean nicknameCheck(String nickname) {
		return memberDAO.nicknameCheck(nickname);
	}
	
}
