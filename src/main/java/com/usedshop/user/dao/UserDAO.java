package com.usedshop.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.usedshop.user.model.User;

@Repository
public interface UserDAO {
	
	
	public boolean selectUserId(String loginId);
	
	
	public void insertUser(
			@Param("name") String name, 
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("email") String email);
	
	
	public User selectUser(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public String selectUserById(
			@Param("userName") String userName, 
			@Param("email") String email);
	
	
}
