package wm.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/duo/")
public class DuoController {
	
	@RequestMapping("toDuoSearch")
	public String toDuoSearch() {
		
		return "/duo/duoSearch";
	}
	
	/*
	@RequestMapping("toPopup")
	public String toPopup() {

		return "/duo/writingPopup";
	}
	*/
	
}
