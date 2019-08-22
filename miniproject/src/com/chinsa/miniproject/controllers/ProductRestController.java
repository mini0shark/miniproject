package com.chinsa.miniproject.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.chinsa.miniproject.dto.ImageDTO;
import com.chinsa.miniproject.dto.ProductDTO;
import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.service.ImageService;
import com.chinsa.miniproject.service.ProductService;
import com.chinsa.miniproject.service.UserService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@RestController
@RequestMapping("/api/product")
public class ProductRestController {
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@Autowired
	ImageService imageService;
	@PostMapping("/registration")
	public String postRegister(@RequestParam MultipartFile upload, ProductDTO product,
			final HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		String result = null;
		ImageDTO image = new ImageDTO();
		OutputStream out = null;
		String loginUser = (String) session.getAttribute("id");
		if(loginUser!=null) {
			product.setpSeller(loginUser);
			if(upload!=null) {
				if(upload.getSize()>0 && upload.getName()!=null) {//추후 확인 필요
					if(upload.getContentType().toLowerCase().startsWith("image/")) {
						try {
							String fileName = upload.getName();
							byte[] bytes = upload.getBytes();
							String uploadPath = "C:\\hahaha\\miniproject\\miniproject\\resources\\images\\img";
							File uploadFile = new File(uploadPath);
							if(!uploadFile.exists()) {
								uploadFile.mkdirs();
							}
							fileName = UUID.randomUUID().toString() + ".jpg";
							image.setiFilename(fileName);
							uploadPath = uploadPath +"\\"+fileName;
							image.setiPath(uploadPath);
							imageService.insertImage(image);
							System.out.println(uploadPath);
							out = new FileOutputStream(new File(uploadPath));
							out.write(bytes);
							String fileUrl = "http://localhost:8080/miniproject/display/path/"+fileName;
							product.setpImg(fileUrl);
							if(productService.insertProduct(product))
								result = "register";
							else
								result = "registerErr";
						}catch(IOException e) {
							e.printStackTrace();
						}finally {
							if(out!=null) {
								out.close();
							}
						}
					}
					else {
						result = "notImage";
					}
				}
			}
			else {
				result = "fileErr";
			}
		}
		else {
			result = "notLogin";
		}
		return result;
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
			if(pName==null&& pCategory==null&& pLoc==null && pSeller==null) {
				result= productService.getProducts();
			}
			else {
				result = productService.getProductsInCategory(pCategory,pLoc, pSeller, pName, orderBy);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			result =null;
		}

		return result;
	}


	@GetMapping("/initproduct")
	public List<ProductDTO> getInitproduct() {
		return productService.getProducts();
	}
	@GetMapping("/checkproduct")
	public String getCheckProduct(@RequestParam Map<String,Integer> map) {
		ObjectMapper mapper = new ObjectMapper();
		int pNo;
		try {
			pNo = mapper.readValue(mapper.writeValueAsString(map.get("pNo")), Integer.class);
			ProductDTO dto = productService.getProduct(pNo);
			if(dto==null)
				return "false";
			else
				return "true";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "false";
	}

	@RequestMapping(value="/imageupload", method=RequestMethod.POST)
	public String fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception{
		ImageDTO image = new ImageDTO();
		PrintWriter printWriter = null;
		OutputStream out = null;
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(upload);
		if(upload!=null) {
			if(upload.getSize()>0 && upload.getName()!=null) {//추후 확인 필요
				if(upload.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = upload.getName();
						byte[] bytes = upload.getBytes();
						String uploadPath = "C:\\hahaha\\miniproject\\miniproject\\resources\\images\\img";
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString() + ".jpg";
						image.setiFilename(fileName);
						uploadPath = uploadPath +"\\"+fileName;
						image.setiPath(uploadPath);
						imageService.insertImage(image);
						System.out.println(uploadPath);
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						printWriter = response.getWriter();
						response.setContentType("text/html");
						String fileUrl = "http://localhost:8080/miniproject/display/path/"+fileName;
						System.out.println(fileUrl);
						System.out.println(request.getContextPath());
						Map<String, Object> data = new HashMap<String, Object>();
						data.put("uploaded", 1);
						data.put("fileName", fileName);
						data.put("url", fileUrl);
						printWriter.println(mapper.writeValueAsString(data));
					}catch(IOException e) {
						e.printStackTrace();
					}finally {
						if(out!=null) {
							out.close();
						}
						if(printWriter!=null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}
}

