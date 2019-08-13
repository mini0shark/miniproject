package com.chinsa.miniproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	
	public ProjectController(){
		System.out.println("생성!!");
	}
	@RequestMapping("/")
	public String mainPage() { 
		return "home";
	}

}
