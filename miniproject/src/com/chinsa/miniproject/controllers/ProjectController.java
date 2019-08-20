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
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	@GetMapping("/user/update")
	public String getUserEdit() {
		return "user/userEdit";
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
	@RequestMapping("/product/imageupload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam MultipartFile upload ) throws Exception{
		//CKEditor 에서 파일을 넘겨주는 이름이 upload 로 설정 되어 있다. 반드시 upload 로 설정
		//헤더 설정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		OutputStream out =null;
		PrintWriter printWriter =null;
		
		String fileName =upload.getOriginalFilename(); //첨부 파일 이름
		byte[] bytes =upload.getBytes(); //첨부파일을 바이트 배열로 저장
	    

		//String uploadPath ="업로드할 디렉토리 경로" + fileName; //물리적 실제 저장소
	    String uploadPath =UploadPath.path(request) +fileName;
		
	    out=new FileOutputStream(new File(uploadPath));
	    out.write(bytes); //서버에 파일 업로드
	    
	    
	    String callback =request.getParameter("CKEditorFuncNum");
	    
	    printWriter=response.getWriter();
	    //URL 상에서 볼수 있는 이미지 경로
	   // String fileUrl =request.getContextPath()+"/upload/"+ fileName;
	    String fileUrl ="/resources/upload/"+ fileName;
	    
	    Map<String, Object> data = new HashMap<String, Object>();
		data.put("uploaded", 1);
		data.put("fileName", fileName);
		data.put("url", fileUrl);
	    
	    printWriter.println(data);
	    printWriter.flush();
	    
	    
	}
	
	

	@GetMapping("/product/productview")
	public String productView() {
		return "product/productView";
	}
	
	@GetMapping("/user/adminpage")
	public String adminPage() {
		return "user/adminPage";
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
