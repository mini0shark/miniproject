package com.chinsa.miniproject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
//@ComponentScan(basePackages= {""}) 나중에 물어보기(왜 필요한지)
@Import({MybatisConfig.class})
public class ApplicationConfig {
	int abc;
}
