package com.chinsa.miniproject.controllers;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chinsa.miniproject.dto.ImageDTO;
import com.chinsa.miniproject.service.ImageService;


@Controller
@RequestMapping("/display")
public class ImageController {
	@Autowired
	ImageService imageService;
	
	@GetMapping("/path/{iPath}")
	public @ResponseBody byte[] displayFile(@PathVariable String iPath) throws IOException {
		InputStream in = null;
		ImageDTO image = imageService.getImagePath(iPath);
		in = new BufferedInputStream(new FileInputStream(image.getiPath()));
		return IOUtils.toByteArray(in);
	}
	
	@GetMapping("/num/{iNo}")
	public @ResponseBody byte[] displayFile(@PathVariable int iNo) throws IOException {
		InputStream in = null;
		ImageDTO image = imageService.getImageNum(iNo);
		in = new BufferedInputStream(new FileInputStream(image.getiPath()));
		return IOUtils.toByteArray(in);
	}
	
}
