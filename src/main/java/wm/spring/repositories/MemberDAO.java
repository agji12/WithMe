package wm.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wm.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public boolean emailCheck(String email) {
		return sqlSession.selectOne("Member.emailCheck", email);
	}
	
	public boolean nicknameCheck(String nickname) {
		return sqlSession.selectOne("Member.nicknameCheck", nickname);
	}
	
	public int selectMemberCode(String email) {
		return sqlSession.selectOne("Member.selectMemberCode", email);
	}

}
