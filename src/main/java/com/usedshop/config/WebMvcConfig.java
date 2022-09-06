package com.usedshop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.usedshop.common.FileManagerService;
import com.usedshop.interceptor.Permissioninterceoptor;

//이미지 주소 매핑
@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	//웹의 이미지주소와 실제 파일 경로를 매핑해주는 설정(실제 파일의 경로를 웹주소로 변환시키는 과정이라 생각하면 편하다)
	@Autowired
	private Permissioninterceoptor permissioninterceoptor;
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.
		addResourceHandler("/images/**") //이미지의 웹 주소 http://localhost/images/abc_213415151513/sun.png
		.addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH); //실제 파일이 있는 곳이다
		//aws는 file://다
		//그 외는 file:///
		
		//FILE_UPLOAD_PATH은 file매니저에 있다
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(permissioninterceoptor)
		.addPathPatterns("/**") // /** 아래 패스까지 모두확인
		.excludePathPatterns("/error", "/static/**", "/user/sign_out"); //예외(인터셉터 안타게 설정) 
	}
	
}
	