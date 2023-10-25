package wm.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wm.spring.dto.DuoDTO;
import wm.spring.dto.DuoReplyDTO;
import wm.spring.repositories.DuoDAO;

@Service
public class DuoService {
	
	@Autowired
	private DuoDAO duoDAO;
	
	public int insertDuoSearch(DuoDTO dto) {
		return duoDAO.insertDuoSearch(dto);
	}
	
	public List<DuoDTO> selectDuoSearch(){
		List<DuoDTO> duoDTO = duoDAO.selectDuoSearch();
		
		// 찾는 포지션 숫자 -> 한글 변경 (1 -> 탑)
		for(int i = 0;i < duoDTO.size();i++) {
			String[] position = duoDTO.get(i).getSearchingPosition().split(",");
			String temp = "";
			
			for(int j = 0;j < position.length;j++) {
				if(position[j].equals("0")) {
					temp += "모든 포지션";
					break;
				}
				if(position[j].equals("1")) {
					temp += "탑 ";
				}
				if(position[j].equals("2")) {
					temp += "정글 ";
				}
				if(position[j].equals("3")) {
					temp += "미드 ";
				}
				if(position[j].equals("4")) {
					temp += "원딜 ";
				}
				if(position[j].equals("5")) {
					temp += "서폿 ";
				}
			}
			duoDTO.get(i).setSearchingPosition(temp);
		}
		
		return duoDTO;
	}
	
	public int insertDuoReply(DuoReplyDTO dto) {
		return duoDAO.insertDuoReply(dto);
	}
	
	public List<DuoReplyDTO> selectDuoReply() {
		return duoDAO.selectDuoReply();
	}
	
}
