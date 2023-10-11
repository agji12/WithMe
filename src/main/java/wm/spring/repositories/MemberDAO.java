package wm.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wm.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int signUp(MemberDTO dto) {
		return db.insert("Member.signUp", dto);
	}
	
	public boolean signIn(MemberDTO dto) {
		return db.selectOne("Member.signIn", dto);
	}
	
	public boolean emailCheck(String email) {
		return db.selectOne("Member.emailCheck", email);
	}
	
	public boolean nicknameCheck(String nickname) {
		return db.selectOne("Member.nicknameCheck", nickname);
	}

}
