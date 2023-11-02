package wm.spring.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler  {
	// 로그인 성공 시 실행
    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request, 
            HttpServletResponse response,
            Authentication auth) 
                    throws IOException, ServletException {
        
    	System.out.println("로그인 성공");
        //인증된 사용자의 정보 리턴
        UserDTO dto=(UserDTO)auth.getPrincipal();
        
        // 시작페이지로 포워딩
        response.sendRedirect(request.getContextPath()+ "/");
        //request.getRequestDispatcher("/").forward(request, response);
    }
}
