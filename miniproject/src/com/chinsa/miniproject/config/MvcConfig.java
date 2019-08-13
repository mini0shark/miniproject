package com.chinsa.miniproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.chinsa.miniproject.controllers.ProjectController;


@Configuration
@EnableWebMvc
@ComponentScan("com.chinsa.miniproject")
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		// TODO Auto-generated method stub
		configurer.enable();
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/",".jsp");
	}

	//Css같은 정정자원들
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 정적인 자원들(css/ 자바스크립트... 등등)
		registry
		.addResourceHandler("/css/**")
		.addResourceLocations("/css/");
	}
	
	@Bean
	public ProjectController projectController() {
		return new ProjectController();
	}
}
