package wm.spring.security.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import wm.spring.dto.MemberDTO;
import wm.spring.security.service.UserDAO;

@Controller
public class UserController {

	@Inject
	private PasswordEncoder bcryptPasswordEncoder;

	@Inject
	private UserDAO userDAO; 

	// 로그인 페이지로 이동
	@RequestMapping("/member/toSignIn")
	public String toSignIn() {
		return "/member/signIn";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("/member/toSignUp")
	public String toSignUp() {
		return "/member/signUp";
	}
	
	// 회원가입 처리
	@RequestMapping("/member/signUp")
	public String signUp(MemberDTO dto) {
		// 비밀번호 암호화
		dto.setPassword(bcryptPasswordEncoder.encode(dto.getPassword()));
		
		Map<String,String> map=new HashMap<>();
		map.put("email", dto.getEmail());
		map.put("password", dto.getPassword());
		map.put("nickname", dto.getNickname());
		map.put("birthday", dto.getBirthday());
		
		int result=userDAO.insertUser(map);
		
		return "/member/signIn";
	}
	
	// 관리자 페이지   
	@RequestMapping("/admin/")
	public String admin() {
		return "/admin";
	}
}
