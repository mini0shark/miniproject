package com.chinsa.miniproject.controllers;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ProjectController {
	
	
	public ProjectController(){
		System.out.println("생성!!");
	}
	
	@RequestMapping(".")
	public String mainPage() { 
		return "mainpage";
		
	}
	
	@GetMapping("/user/signup")
	public String getSignUp() {
		return "user/signUp";
	}
	
	@GetMapping("/user/signin")
	public String getLogin(Model model , @CookieValue(value="storedId", required=false) Cookie storedIdCookie) {
		String storedId = "";
		boolean checked = false;
		if(storedIdCookie!=null) {
			storedId = storedIdCookie.getValue();
			checked = true;
		}
		model.addAttribute("storedId", storedId);
		model.addAttribute("checked", checked);
		return "user/signIn";
	}
	
	@GetMapping("/user/mypage")
	public String getMyPage() {
		return "user/myPage";
	}

}
