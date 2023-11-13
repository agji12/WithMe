package wm.spring.config.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import wm.spring.config.auth.UserDTO;

public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

	public JwtAuthorizationFilter(AuthenticationManager authenticationManager) {
		super(authenticationManager);
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//super.doFilterInternal(request, response, chain);
		System.out.println("인증이나 권한이 필요한 주소 요청이 됨.");
		
		String header = request.getHeader("Authorization");
		System.out.println("jwtHeader : " + header);
		
		// header 유무 확인
		if (header == null || !header.startsWith("Bearer")) {
			chain.doFilter(request, response); // 필터를 타겟에 넘겨버리고 리턴
			return;
		}
		
		// JWT 토큰 검증
		String token = request.getHeader("Authorization").replace("Bearer ", "");
		String username = 
				JWT.require(Algorithm.HMAC256("cos")).build().verify(token).getClaim("username").asString();
		
		// 서명이 정상적으로 됨
		//if(username != null) {
			
			// Jwt 토큰 서명을 통해 서명이 정상이면 Authentication 객체 생성
			
			
		//}
		
		
		
	}
 
}
