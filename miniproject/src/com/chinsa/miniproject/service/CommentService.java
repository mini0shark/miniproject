package com.chinsa.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinsa.miniproject.dao.CommentMapper;
import com.chinsa.miniproject.dto.CommentDTO;

@Service
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	public List<CommentDTO> getComments(int cPno){
		return commentMapper.getComments(cPno);
	}
	
	public CommentDTO getComment(int cNo){
		return commentMapper.getComment(cNo);
	}
	public CommentDTO insertComment(CommentDTO comment) {
		commentMapper.insertComment(comment);
		return comment;
	}
	public int deleteComment(int cNo) {
		return commentMapper.deleteComment(cNo);
	}
}
