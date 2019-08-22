package com.chinsa.miniproject.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

//import com.mysql.jdbc.Driver;
//import org.mariadb.jdbc.Driver;
import com.mysql.cj.jdbc.Driver;

@Configuration
@ComponentScan(basePackages = { "com.chinsa.miniproject.dao", "com.chinsa.miniproject.service" })
@Import({ MybatisConfig.class })
public class ApplicationConfig {

	@Bean
	public DataSource dataSource() {
		SimpleDriverDataSource simpleDriverDataSource = new SimpleDriverDataSource();
		simpleDriverDataSource.setDriverClass(Driver.class);
		simpleDriverDataSource.setUrl("jdbc:mysql://117.17.143.71:3306/skudb?serverTimezone=UTC");
		simpleDriverDataSource.setUsername("sku");
		simpleDriverDataSource.setPassword("sku");
		return simpleDriverDataSource;
	}

	@Bean // 인터페이스를 가져다 쓰는거
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}

}
