package wm.spring.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import wm.spring.dto.MemberDTO;
import wm.spring.security.UserDAO;
import wm.spring.services.MailSendService;
import wm.spring.services.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private PasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MailSendService mailSendService;

	// 로그인 페이지로 이동
	@GetMapping("signIn")
	public String signIn() {
		return "/member/signIn";
	}

	// 회원가입 페이지로 이동
	@GetMapping("signUp")
	public String signUp() {
		return "/member/signUp";
	}

	// 회원가입 처리
	@PostMapping("signUp")
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
	@GetMapping("/admin/")
	public String admin() {
		return "/admin";
	}

	// 이메일 인증
	@ResponseBody
	@GetMapping("toMailSend")
	public String toMailSend(String email) {
		String authNumber = mailSendService.sendMail(email);

		return authNumber;
	}

	// 이메일 중복 체크
	@ResponseBody
	@GetMapping("emailCheck")
	public boolean emailCheck(String email) {
		return memberService.emailCheck(email);
	}

	// 닉네임 중복 체크
	@ResponseBody
	@GetMapping("nicknameCheck")
	public boolean nicknameCheck(String nickname) {
		return memberService.nicknameCheck(nickname);
	}

	//예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
