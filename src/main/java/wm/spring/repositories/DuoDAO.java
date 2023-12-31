package wm.spring.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wm.spring.dto.DuoDTO;
import wm.spring.dto.DuoReplyDTO;

@Repository
public class DuoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertDuoSearch(DuoDTO dto) {
		return sqlSession.insert("Duo.insertDuoSearch", dto);
	}
	
	public List<DuoDTO> selectDuoSearch(){
		return sqlSession.selectList("Duo.selectDuoSearch");
	}
	
	public int insertDuoReply(DuoReplyDTO dto) {
		return sqlSession.insert("Duo.insertDuoReply", dto);
	}
	
	public List<DuoReplyDTO> selectDuoReply() {
		return sqlSession.selectList("Duo.selectDuoReply");
	}
	
}
