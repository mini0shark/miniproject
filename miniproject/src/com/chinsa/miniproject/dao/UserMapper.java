package com.chinsa.miniproject.dao;

import java.util.List;

import com.chinsa.miniproject.dto.UserDTO;
import com.chinsa.miniproject.mapper.Mapper;

@Mapper
public interface UserMapper {
	public UserDTO getUser(String uId);
	public List<UserDTO> getUsers();
	public int updateUser(UserDTO user);
	public int insertUser(UserDTO user);
	public int deleteUser(String uId);
}
