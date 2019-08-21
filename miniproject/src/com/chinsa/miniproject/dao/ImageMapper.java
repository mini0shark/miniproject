package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.ImageDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface ImageMapper {
	public ImageDTO getImageNum(int iNo);
	public ImageDTO getImagePath(String iPath);
	public int insertImage(ImageDTO image);
}
