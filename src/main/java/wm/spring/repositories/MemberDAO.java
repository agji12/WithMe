package wm.spring.repositories;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wm.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertUser(Map<String, String> map) {
		return sqlSession.insert("Member.signUp", map);
	}
	
	public Map<String, Object> selectUser(String userid) {
		return sqlSession.selectOne("Member.signIn", userid);
	}
	
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
