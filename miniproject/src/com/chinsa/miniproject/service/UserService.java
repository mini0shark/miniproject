package com.chinsa.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinsa.miniproject.dao.UserMapper;
import com.chinsa.miniproject.dto.UserDTO;

@Service
public class UserService {
	@Autowired
	UserMapper userDao;
	
	public UserDTO getUser(String uId) {
		return userDao.getUser(uId);
	}
	
	public List<UserDTO> getUsers() {
		// TODO Auto-generated method stub
		return userDao.getUsers();
	}
	
	public boolean updateUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		result = userDao.updateUser(userDTO);
		if(result==0)
			return false;
		else
			return true;
	}
	
	public boolean insertUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = userDao.insertUser(userDTO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result==0)
			return false;
		else
			return true;
	}
	
	public boolean deleteUser(String uId) {
		// TODO Auto-generated method stub
		int result = 0;
		result = userDao.deleteUser(uId);
		if(result==0)
			return false;
		else
			return true;
	}
}
