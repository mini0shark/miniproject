package com.chinsa.miniproject.controllers;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.service.ProductService;


@RestController
@RequestMapping("/api/product")
//@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService productService;
	@PostMapping("/register")
	public String postRegister(@RequestBody Map map, 
			final HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		
		System.out.println("id : "+id);
		System.out.println("1=1=1=1=1=1=1=1==");
		
		System.out.println(map.get("product")+"------");
		return "registerErr";
	}
	
}
