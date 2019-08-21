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
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/product/imageupload", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
 
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = "d://upload//" + fileName;//저장경로
 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
 
            printWriter = response.getWriter();
            String fileUrl = "d://upload//" + fileName;//url경로
 
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
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
