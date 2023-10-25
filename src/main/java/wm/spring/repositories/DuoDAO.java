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
	private SqlSessionTemplate db;
	
	public int insertDuoSearch(DuoDTO dto) {
		return db.insert("Duo.insertDuoSearch", dto);
	}
	
	public List<DuoDTO> selectDuoSearch(){
		return db.selectList("Duo.selectDuoSearch");
	}
	
	public int insertDuoReply(DuoReplyDTO dto) {
		return db.insert("Duo.insertDuoReply", dto);
	}
	
	public List<DuoReplyDTO> selectDuoReply() {
		return db.selectList("Duo.selectDuoReply");
	}
	
}
