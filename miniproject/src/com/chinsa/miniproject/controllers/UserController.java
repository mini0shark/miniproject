package com.chinsa.miniproject.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.UserService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api/user")

public class UserController {
	@Autowired
	UserService userService;
	
	@PostMapping("/login")
	public String postLogin(@RequestBody Map data, final HttpSession session,
			HttpServletResponse response, @CookieValue(value="storedId", required=false) Cookie storedIdCookie) {
		ObjectMapper mapper = new ObjectMapper();
		UserDTO userDTO = null;
		try {
			userDTO = mapper.readValue(mapper.writeValueAsString(data.get("user")), UserDTO.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		UserDTO user = userService.getUser(userDTO.getuId());
		if(user!=null) {
			if(user.getuPwd().equals(userDTO.getuPwd())) {
				if(user.getuLevel()==4)//관리자인지 아닌지
					session.setAttribute("auth", "admin");
				else
					session.setAttribute("auth", "user");
				session.setAttribute("id", user.getuId());
				session.setMaxInactiveInterval(60*30);//30분
				if(data.get("checkStore")!=null) {
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
				return "login";
			}
			else {
				return "pwdErr";
			}
		}
		return "idErr";
	}
	
	@PostMapping("/signup")
	public String postSignUp(@RequestBody Map data, HttpServletResponse response) {
		int result = 0;
		ObjectMapper mapper = new ObjectMapper();
		UserDTO userDTO = null;
		try {
			userDTO = mapper.readValue(mapper.writeValueAsString(data.get("user")), UserDTO.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		if(userDTO.getuPwd().equals(data.get("confirmPwd"))) {
			if(userService.insertUser(userDTO)){
				Cookie storeIdCookie = new Cookie("storedId", userDTO.getuId());
				storeIdCookie.setPath("/");
				storeIdCookie.setMaxAge(60*30);
				response.addCookie(storeIdCookie);
				result = 1;
			}
		}
		if(result ==0) {
			return "signupErr";
		}
		else {
			return "signup";
		}
	}
	
	@PutMapping("/update")
	public String putUpdate(@RequestBody Map data) {
		int result = 0;
		ObjectMapper mapper = new ObjectMapper();
		UserDTO userDTO = null;
		try {
			userDTO = mapper.readValue(mapper.writeValueAsString(data.get("user")), UserDTO.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		if(userDTO.getuPwd().equals(data.get("confirmPwd"))) {
			if(userService.updateUser(userDTO)){
				result = 1;
			}
		}
		if(result==0) {
			return "updateErr";
		}
		else {
			return "update";
		}
	}
	
	@PostMapping("/logout")
	public String postLogout(final HttpSession session) {
		if(session.getAttribute("auth")!=null)
			session.removeAttribute("auth");
		if(session.getAttribute("id")!=null)
			session.removeAttribute("id");
		return "logout";
	}
	
	@PostMapping("/delete")
	public String postDelete(@RequestBody Map data) {
		ObjectMapper mapper = new ObjectMapper();
		UserDTO userDTO = null;
		try {
			userDTO = mapper.readValue(mapper.writeValueAsString(data.get("user")), UserDTO.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		UserDTO user = userService.getUser(userDTO.getuId());
		if(user!=null) {
			if(userDTO.getuPwd().equals(user.getuPwd())) {
				if(userService.deleteUser(user.getuId())){
					return "delete";
				}
				else {
					return "dbErr";
				}
			}
			else {
				return "pwdErr";
			}
		}
		else {
			return "idErr";
		}
	}
	
	@GetMapping("/{uId}")
	public UserDTO getUser(@PathVariable String uId) {
		UserDTO userDTO = userService.getUser(uId);
		if(userDTO!=null) {
			return userDTO;
		}
		else {
			return null;
		}
	}
	
	@GetMapping("/")
	public List<UserDTO> getUsers() {
		List<UserDTO> users = userService.getUsers();
		if(users!=null) {
			return users;
		}
		else {
			return null;
		}
	}
}
