package com.chinsa.miniproject.controllers;

import java.io.File;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chinsa.miniproject.dto.FileUploadDTO;
import com.chinsa.miniproject.dto.UserDTO;

@Controller
public class ProjectController {
	
	
	public ProjectController(){
		System.out.println("생성!!");
	}

	@RequestMapping("/")
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
	
	
	@GetMapping("/product/registration")
	public String getRegister() {
		return "product/registration";
	}
	
	@GetMapping("/product/search")
	public String getSearch(@RequestParam Map<String, String> map) {
		System.out.println(map.get("category"));
		System.out.println(map.get("soso"));
		System.out.println(map.get("good"));
		return "product/search";
	}
	
	@SuppressWarnings("deprecation")
	@PostMapping("/product/imageupload")
	public String imageUpload(HttpServletRequest request, Model model, FileUploadDTO fileUpload) {
		Date date = new Date();
		int year = date.getYear();
		int month = date.getMonth();
		String monthStr = "";
		if(month < 10) 
			monthStr = "0"+month;
		else 
			monthStr = ""+month;
		String defaultPath = request.getRealPath("/");
		String contextPath = request.getSession().getServletContext().getContextPath();
		String fileUploadPathTail = "ckImage/"+year+""+monthStr;
		String fileUploadPath = defaultPath+"/"+fileUploadPathTail;
		
		try {
			MultipartFile file = fileUpload.getUpload();
			if(file!=null) {
				String fileName = file.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".")+1);
				if(!"".equals(fileName)) {
					File destD = new File(fileUploadPath);
					if(!destD.exists()) {
						destD.mkdirs();
					}
					File destination = File.createTempFile("ckeditor_", "."+fileNameExt, destD);
					file.transferTo(destination);
					
					fileUpload.setFileName(destination.getName());
					fileUpload.setPath(contextPath+"/"+fileUploadPathTail+"/"+destination.getName());
					model.addAttribute("fileUpload", fileUpload);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "product/imageUpload";
	}
	
	

	@GetMapping("/product/productview")
	public String productView() {
		return "product/productView";
	}
}
