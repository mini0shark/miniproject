package com.chinsa.miniproject.controllers;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinsa.miniproject.dto.UserDTO;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {

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
	public String postLogin(@RequestParam Map<String, String> data, final HttpSession session,
			HttpServletResponse response, @CookieValue(value="storedId", required=true) Cookie storedIdCookie) {
		ObjectMapper mapper = new ObjectMapper();
		String id = data.get("id");

		if(id!=null) {
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(0);//30분
			Cookie storeIdCookie = new Cookie("storedId", id);
			storeIdCookie.setPath("/");
			storeIdCookie.setMaxAge(0);
			response.addCookie(storeIdCookie);
		}
		else {
			return "aleadyLogout";
		}
		System.out.println(id);
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
