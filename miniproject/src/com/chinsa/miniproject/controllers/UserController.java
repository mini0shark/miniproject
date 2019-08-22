package com.chinsa.miniproject.controllers;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.ProductService;
import com.chinsa.miniproject.service.UserService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
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


	@GetMapping("/user/logout")
	public String getLogout(final HttpSession session) {
		if(session.getAttribute("auth")!=null)
			session.removeAttribute("auth");
		if(session.getAttribute("id")!=null)
			session.removeAttribute("id");
		else {
			return "aleadyLogout";
		}
		return "mainpage";
	}

	@GetMapping("/user/mypage")
	public String getMyPage() {
		
		return "user/myPage";
	}

	@GetMapping("/user/update")
	public String getUserEdit() {
		return "user/userEdit";
	}

	@GetMapping("/user/adminpage")
	public String adminPage() {
		return "user/adminPage";
	}
}
