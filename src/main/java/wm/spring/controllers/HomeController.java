package wm.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("/test")
	public String test() {
		return "/test";
	}
	
}
