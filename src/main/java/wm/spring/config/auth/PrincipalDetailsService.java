package wm.spring.config.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class PrincipalDetailsService implements UserDetailsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("아이디 : " + username);
		// 사용자 아이디 확인
		Map<String,Object> user = sqlSession.selectOne("Member.signIn", username);
        System.out.println(user);
        
     // 아이디가 없으면 예외 발생시킴 (throw)
        if(user==null) 
            throw new UsernameNotFoundException(username);
    
        // 사용권한 목록
        List<GrantedAuthority> authority=new ArrayList<>();
        
        // Oracle DB의 경우 자바코드에서 테이블 필드명을 쓸 땐 대문자로 써야함
        authority.add(new SimpleGrantedAuthority(
                user.get("AUTHORITY").toString()));
        
        return new UserDTO(user.get("USERNAME").toString(),
                user.get("PASSWORD").toString(),
                (Integer)Integer.valueOf(user.get("ENABLED").toString())==1,
                true,true,true,authority,
                user.get("USERNAME").toString());
	}

}
