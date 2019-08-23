package com.chinsa.miniproject.controllers;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.chinsa.miniproject.dto.CommentDTO;
import com.chinsa.miniproject.service.CommentService;
import com.chinsa.miniproject.service.ProductService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api/comment")
public class CommentRestController {
	@Autowired
	CommentService commentService;
	@Autowired
	ProductService productService;
	@GetMapping("/load")
	public List<CommentDTO> getLoad(@RequestParam String pNo) {
		int number = Integer.parseInt(pNo);
		return commentService.getComments(number);
	}


	@PostMapping("/commentresister")
	public CommentDTO postCommentResister(@RequestBody Map<String, String> map, final HttpSession session) {
		System.out.println(map);
		String id = (String)session.getAttribute("id");
		int pNo = Integer.parseInt(map.get("pNo"));
		CommentDTO commentDto = new CommentDTO();
		commentDto.setcContent((String)map.get("comment"));
		commentDto.setcPno(pNo);
		commentDto.setcUid(id);
		return commentService.getComment(commentService.insertComment(commentDto).getcNo());
	}



	@DeleteMapping("/deletecomment")
	public String deleteDeleteComment(@RequestBody Map<String, Integer> map, final HttpSession session) {
		int cNo = map.get("cNo");
		String id =(String)session.getAttribute("id");
		String auth = (String)session.getAttribute("auth");


		if(auth=="admin") {
			if(commentService.deleteComment(cNo)==1)
				return "deleted";
			else
				return "err";
		}
		else {
			if(commentService.getComment(cNo).getcUid().equals(id)) {
				if(commentService.deleteComment(cNo)==1)
					return "deleted";
				else
					return "err";
			}
			else
				return "auth";
		}
	}
}