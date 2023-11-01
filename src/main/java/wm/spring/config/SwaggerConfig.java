package wm.spring.config;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.ResponseMessage;
import springfox.documentation.service.VendorExtension;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
@EnableWebMvc
public class SwaggerConfig {
	
	@Bean
	public Docket api() { 
		return new Docket(DocumentationType.SWAGGER_2)  
				.useDefaultResponseMessages(false) // 기존의 응답 메시지 미사용
				.globalResponseMessage(RequestMethod.POST, getArrayList()) // 함수에서 정의한 응답 메시지 사용
				.apiInfo(apiInfo())
				.select()                                  
				.apis(RequestHandlerSelectors.any())              
				.paths(PathSelectors.any()) // url path 지정 (어떤 url 공개할 것인지)         
				.build();
	}
	
	// 선택 항목 (Swagger UI에서 보여지는 정보)
	private ApiInfo apiInfo() {
		return new ApiInfo(
				"My REST API", 
				"REST Api Documentation",
				"API TOS", 
				"Terms of service", 
				new Contact("Kim Eunji", "", ""), // 작성자 정보
				"License of API", "API license URL", new ArrayList<VendorExtension>());
	}
	
	private ArrayList<ResponseMessage> getArrayList() {
        ArrayList<ResponseMessage> lists = new ArrayList<ResponseMessage>();
        lists.add(new ResponseMessageBuilder().code(500).message("500 ERROR").build());
        lists.add(new ResponseMessageBuilder().code(403).message("403 ERROR").build());
        lists.add(new ResponseMessageBuilder().code(401).message("401 ERROR").build());
        return lists;
    }
	
}
