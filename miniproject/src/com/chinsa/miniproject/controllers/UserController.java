package com.chinsa.miniproject.controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.UserService;

@RestController
@RequestMapping("/api/user")

public class UserController {
	@Autowired
	UserService userService;
	
	@PostMapping("/login")
	public String postLogin(@RequestBody String checkStore, @RequestBody UserDTO userDTO, final HttpSession session,
			HttpServletResponse response, @CookieValue(value="storedId", required=false) Cookie storedIdCookie) {
		UserDTO user = userService.getUser(userDTO.getuId());
		if(user!=null) {
			if(user.getuPwd().equals(userDTO.getuPwd())) {
				if(user.getuLevel()==4)//관리자인지 아닌지
					session.setAttribute("auth", "admin");
				else
					session.setAttribute("auth", "user");
				session.setAttribute("id", user.getuId());
				session.setMaxInactiveInterval(60*30);//30분
				if(checkStore!=null) {
					Cookie storeIdCookie = new Cookie("storedId", user.getuId());
					storeIdCookie.setPath("/");
					storeIdCookie.setMaxAge(60*30);
					response.addCookie(storeIdCookie);
				}
				else {
					if(storedIdCookie!=null) {
						storedIdCookie.setPath("/");
						storedIdCookie.setMaxAge(0);
						response.addCookie(storedIdCookie);
					}
				}
				return "login success";
			}
		}
		return "login fail";
	}
	
	@PostMapping("/signup")
	public String postSignUp(@RequestBody String confirmPassword, @RequestBody UserDTO userDTO, HttpServletResponse response) {
		int result = 0;
		if(userDTO.getuPwd().equals(confirmPassword)) {
			if(userService.insertUser(userDTO)){
				Cookie storeIdCookie = new Cookie("storedId", userDTO.getuId());
				storeIdCookie.setPath("/");
				storeIdCookie.setMaxAge(60*30);
				response.addCookie(storeIdCookie);
				result = 1;
			}
		}
		if(result ==0) {
			return "signup fail";
		}
		else {
			return "signup success";
		}
	}
}
