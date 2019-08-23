package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.CommentDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface CommentMapper {
	public List<CommentDTO> getComments(int cPno);
	public CommentDTO getComment(int cNo);
	public void insertComment(CommentDTO comment);
	public int deleteComment(int cNo);
}
