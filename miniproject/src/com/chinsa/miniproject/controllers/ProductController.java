package com.chinsa.miniproject.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.ProductService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	
	
	@GetMapping("/product/registration")
	public String getregistration(final HttpSession session) {
		//로그인 안하면 여기서 튕기게 하기
		return "product/registration";
	}
	
//	@GetMapping("/product/search")
//	public String getSearch(@RequestParam Map<String, String> map) {
//		System.out.println(map.get("category"));
//		System.out.println(map.get("soso"));
//		System.out.println(map.get("good"));
//		return "product/search";
//	}
	

	@GetMapping("/product/productview")
	public String productView(@RequestParam Map<String, String> map, Model model) {
		String pNo = map.get("pNo");
		model.addAttribute("vo", productService.getProduct(Integer.parseInt(pNo)));//??
		return "product/productView";
	}
	
}

class UploadPath {

	public static String attach_path="resources/upload/";
	
	public static String path( HttpServletRequest request){
		String uploadPath ="/";
		try{
			
			String root_path =request.getSession().getServletContext().getRealPath("/");
				
			uploadPath=root_path+attach_path.replace('/', '\\');;	  
			
			return uploadPath;
		}catch(Exception e){
			e.printStackTrace();
		
			return uploadPath;
		}
	}

}
