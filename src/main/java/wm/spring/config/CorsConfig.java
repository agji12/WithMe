package wm.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {

	@Bean
	public CorsFilter corsFilter() {
		// 크로스 오리진 정책 허용x, 모든 요청 허용
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		CorsConfiguration config = new CorsConfiguration();
		config.setAllowCredentials(true); // 서버가 응답할 때 json을 자바스크립트에서 처리할 수 있게 할지 설정하는 것
		config.addAllowedOrigin("*"); // 모든 ip에 응답 허용
		config.addAllowedHeader("*"); // 모든 header에 응답 허용
		config.addAllowedMethod("*"); // 모든 post, get, put, delete, patch 요청 허용

		source.registerCorsConfiguration("/api/**", config); // /api/** 로 들어오는 주소는 config를 타라
		return new CorsFilter(source);
	}
}
