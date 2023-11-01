package wm.spring.security.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler {
	// 사용권한이 없는 경우 지정한 페이지로 이동
	@Override
	public void handle(HttpServletRequest request, 
			HttpServletResponse response, 
			AccessDeniedException ade)
					throws IOException, ServletException { 

		request.setAttribute("errMsg", 
				"<i class='bi bi-exclamation-circle'></i> 관리자만 사용할 수 있는 기능입니다.");
		
		// forward
		request.getRequestDispatcher("/").forward(request, response);
	}
}
