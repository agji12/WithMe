package wm.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wm.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public boolean emailCheck(String email) {
		return db.selectOne("Member.emailCheck", email);
	}
	
	public boolean nicknameCheck(String nickname) {
		return db.selectOne("Member.nicknameCheck", nickname);
	}

}
