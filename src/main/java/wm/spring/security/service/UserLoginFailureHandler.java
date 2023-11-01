package wm.spring.security.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler {
	// 로그인 실패 시 실행
    @Override
    public void onAuthenticationFailure(
            HttpServletRequest request, 
            HttpServletResponse response,
            AuthenticationException exception) 
                    throws IOException, ServletException {
        
        request.setAttribute("errMsg",
                "<i class='bi bi-exclamation-circle'></i> 아이디 또는 비밀번호가 일치하지 않습니다.");
        
        // forward
        request.getRequestDispatcher(
        		"/member/toSignIn")
                    .forward(request, response);
    }
}
