package wm.spring.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import wm.spring.dto.DuoDTO;
import wm.spring.services.DuoService;

@Controller
@RequestMapping("/duo/")
public class DuoController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private DuoService duoService;
	
	@RequestMapping("toDuoSearch")
	public String toDuoSearch() {
		
		return "/duo/duoSearch";
	}
	
	@RequestMapping("insertDuoSearch")
	public String insertDuoSearch(DuoDTO dto) {
		System.out.println(dto.getSummonerName());
		System.out.println("큐 코드 : " + dto.getQueueCode());
		System.out.println(dto.getTierCode());
		System.out.println("주 포지션 : " + dto.getMainPositionCode());
		System.out.println("찾는 포지션 : " + dto.getSearchingPosition());
		System.out.println("메모 : " + dto.getMemo());
		System.out.println(dto.getMicrophone());
		int memberCode = (int) session.getAttribute("memberCode");
		dto.setMemberCode(memberCode);
		duoService.insertDuoSearch(dto);
		
		return "redirect:/duo/toDuoSearch";
	}
	
}
