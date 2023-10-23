package wm.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wm.spring.dto.DuoDTO;
import wm.spring.repositories.DuoDAO;

@Service
public class DuoService {
	
	@Autowired
	private DuoDAO duoDAO;
	
	public int insertDuoSearch(DuoDTO dto) {
		return duoDAO.insertDuoSearch(dto);
	}
	
	
}
