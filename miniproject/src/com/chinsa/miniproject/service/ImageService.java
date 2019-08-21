package com.chinsa.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinsa.miniproject.dao.ImageMapper;
import com.chinsa.miniproject.dto.ImageDTO;

@Service
public class ImageService {
	@Autowired
	ImageMapper imageDao;
	
	public ImageDTO getImageNum(int iNo) {
		return imageDao.getImageNum(iNo);
	}
	
	public ImageDTO getImagePath(String iPath) {
		return imageDao.getImagePath(iPath);
	}
	
	public boolean insertUser(ImageDTO image) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = imageDao.insertImage(image);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result==0)
			return false;
		else
			return true;
	}
}
