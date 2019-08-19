package com.chinsa.miniproject.controllers;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.ProductService;
import com.chinsa.miniproject.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;


@RestController
@RequestMapping("/api/product")
//@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@PostMapping("/register")
	public String postRegister(@RequestBody Map map, 
			final HttpSession session) {
		String uId = (String)session.getAttribute("id");
		UserDTO seller = userService.getUser(uId);
		ProductDTO product = null;
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("id : "+uId);
		if(uId==null) {
			return "loginNeeded";
		}
		
		try {
			product = mapper.readValue(mapper.writeValueAsString(map.get("product")), ProductDTO.class);
			product.setpSeller(seller.getuName());
			product.setpImg("임시로 저장 이거 나중에 바꿔야함!!!!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(productService.insertProduct(product)) {
			return "registerSuccess";
		}
		
		return "registerErr";
	}
	@GetMapping("/search")
	public String getSearch(@RequestParam Map<String, String> map) {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(map.get("category"));
	}
}

