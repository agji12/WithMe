package wm.spring.config.auth;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserDTO extends User {
	// 스프링 시큐리티 내장 객체로 사용자의 상세 정보 담는다
	private String email;

	public UserDTO(String username, String password, boolean enabled, boolean accountNonExpired,
            boolean credentialsNonExpired, 
            boolean accountNonLocked,  Collection<? extends GrantedAuthority> authorities,
			String email) {
		super(username, password, enabled, accountNonExpired
                , credentialsNonExpired, accountNonLocked
                , authorities);
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
