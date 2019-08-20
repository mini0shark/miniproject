package com.chinsa.miniproject.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.chinsa.miniproject.dto.FileUploadDTO;
import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.ProductService;
import com.chinsa.miniproject.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@RestController
@RequestMapping("/api/product")
//@RequestMapping("/product")
public class ProductRestController {
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@PostMapping("/register")
	public String postRegister(@RequestBody Map map, 
			final HttpSession session) {
		String uId = (String)session.getAttribute("id");
		UserDTO seller = userService.getUser(uId);
		ProductDTO product = null;
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("id : "+uId);
		if(uId==null) {
			return "loginNeeded";
		}
		
		try {
			product = mapper.readValue(mapper.writeValueAsString(map.get("product")), ProductDTO.class);
			product.setpSeller(seller.getuName());
			product.setpImg("임시로 저장 이거 나중에 바꿔야함!!!!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(productService.insertProduct(product)) {
			return "registerSuccess";
		}
		
		return "registerErr";
	}
	
	@GetMapping("/search")
	public List<ProductDTO> getSearch(@RequestParam Map<String, String> map) {
		ObjectMapper mapper = new ObjectMapper();
		List<ProductDTO> result = null;
		String pCategory = null;
		String pLoc = null;
		String pSeller = null;
		String pName = null;
		String orderBy = "DESC";
		try {
			pCategory = mapper.readValue(mapper.writeValueAsString(map.get("pCategory")), String.class);
			pLoc = mapper.readValue(mapper.writeValueAsString(map.get("pLoc")), String.class);
			pSeller = mapper.readValue(mapper.writeValueAsString(map.get("pCeller")), String.class);
			pName = mapper.readValue(mapper.writeValueAsString(map.get("pName")), String.class);
			orderBy = mapper.readValue(mapper.writeValueAsString(map.get("orderBy")), String.class);
			System.out.println(pSeller);
			if(orderBy==null) {
				orderBy = "DESC";
			}
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			result = productService.getProductsInCategory(pCategory,pLoc, pSeller, pName, orderBy);	
		} catch (NullPointerException e) {
			// TODO: handle exception
			result =null;
		}
		return result;
	}
}

