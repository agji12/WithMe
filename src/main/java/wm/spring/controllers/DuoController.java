package wm.spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import wm.spring.dto.DuoDTO;
import wm.spring.dto.DuoReplyDTO;
import wm.spring.services.DuoService;
import wm.spring.services.MemberService;

@Controller
@RequestMapping("/duo/")
public class DuoController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private DuoService duoService;
	
	@Autowired
	private MemberService memberService;
	
	// 듀오 찾기 페이지로
	@RequestMapping("toDuoSearch")
	public String toDuoSearch(Model model) {
		// 듀오 찾기 글 가져오기
		List<DuoDTO> duoList = duoService.selectDuoSearch();
		
		// 듀오 찾기 댓글 가져오기
		List<DuoReplyDTO> duoReplyList = duoService.selectDuoReply();
		
		model.addAttribute("duoList", duoList);		
		model.addAttribute("duoReplyList", duoReplyList);		
		return "/duo/duoSearch";
	}
	
	// 듀오 찾기 글 db에 insert
	@RequestMapping("insertDuoSearch")
	public String insertDuoSearch(DuoDTO dto, Authentication auth) {
		int memberCode = memberService.selectMemberCode(auth.getName());
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
	
	// 듀오 찾기 글의 댓글 db에 insert
	@RequestMapping("insertDuoReply")
	public String insertDuoReply(DuoReplyDTO dto, Authentication auth) {
		int memberCode = memberService.selectMemberCode(auth.getName());
		dto.setMemberCode(memberCode);
		
		duoService.insertDuoReply(dto);
		return "redirect:/duo/toDuoSearch";
	}
	
}
