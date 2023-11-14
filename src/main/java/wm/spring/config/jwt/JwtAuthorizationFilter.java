package wm.spring.config.jwt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import wm.spring.config.auth.UserDTO;
import wm.spring.repositories.MemberDAO;

public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

	private MemberDAO memberDAO;
	
	public JwtAuthorizationFilter(AuthenticationManager authenticationManager, MemberDAO memberDAO) {
		super(authenticationManager);
		this.memberDAO = memberDAO;
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("인증이나 권한이 필요한 주소 요청이 됨.");
		
		String header = request.getHeader(JwtProperties.HEADER_STRING);
		System.out.println("jwtHeader : " + header);
		
		// header 유무 확인
		if (header == null || !header.startsWith(JwtProperties.TOKEN_PREFIX)) {
			chain.doFilter(request, response); // 필터를 타겟에 넘겨버리고 리턴
			return;
		}
		
		// JWT 토큰 검증
		String token = request.getHeader(JwtProperties.HEADER_STRING)
				.replace(JwtProperties.TOKEN_PREFIX, "");
		System.out.println(token);
		String username = 
				JWT.require(Algorithm.HMAC256(JwtProperties.SECRET)).build()
				.verify(token).getClaim("username").asString();
		
		System.out.println("토큰 검증 완료");
		
		
		// 서명이 정상적으로 됨
		if(username != null) {
			Map<String,Object> user = memberDAO.selectUser(username);
			// 사용권한 목록
	        List<GrantedAuthority> authority=new ArrayList<>();
	        
	        // Oracle DB의 경우 자바코드에서 테이블 필드명을 쓸 땐 대문자로 써야함
	        authority.add(new SimpleGrantedAuthority(
	                user.get("AUTHORITY").toString()));
			UserDTO userDTO = new UserDTO(user.get("USERNAME").toString(),
	                user.get("PASSWORD").toString(),
	                (Integer)Integer.valueOf(user.get("ENABLED").toString())==1,
	                true,true,true,authority,
	                user.get("USERNAME").toString());
			
			// Jwt 토큰 서명을 통해 서명이 정상이면 Authentication 객체 생성
			Authentication authentication = new UsernamePasswordAuthenticationToken(
					userDTO, // 나중에 컨트롤러에서 DI해서 쓸 때 사용하기 편함.
					null, // 패스워드는 모르니까 null 처리, 어차피 지금 인증하는게 아니니까!!
					userDTO.getAuthorities());

			// 강제로 시큐리티의 세션에 접근하여 값 저장
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
		}
		
		chain.doFilter(request, response);
	}
 
}
