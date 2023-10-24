package wm.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 듀오 찾기 페이지로
	@RequestMapping("toDuoSearch")
	public String toDuoSearch(Model model) {
		List<DuoDTO> duoList =  duoService.selectDuoSearch();
		
		model.addAttribute("duoList", duoList);		
		return "/duo/duoSearch";
	}
	
	// 듀오 찾기 글 db에 insert
	@RequestMapping("insertDuoSearch")
	public String insertDuoSearch(DuoDTO dto) {
		int memberCode = (int) session.getAttribute("memberCode");
		dto.setMemberCode(memberCode);
		
		// 마이크 유뮤 값 변경
		if(dto.getMicrophone() == null) {
			dto.setMicrophone("F");
		}else {
			dto.setMicrophone("T");
		}
		
		duoService.insertDuoSearch(dto);
		return "redirect:/duo/toDuoSearch";
	}
	
}
