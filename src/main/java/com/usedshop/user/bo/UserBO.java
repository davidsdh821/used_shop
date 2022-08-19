package com.usedshop.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usedshop.user.dao.UserDAO;
import com.usedshop.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean getUserId(String loginId) {
		
		
		return userDAO.selectUserId(loginId);
		
	}
	
	public User getUserPwByLoginId(String loginId, String email) {
		
		return userDAO.selectUserPwByLoginId(loginId, email);
	}
	
	public void addUser(String name, String loginId, String password, String email) {
		
		
		userDAO.insertUser(name, loginId, password, email);
	}
	
	public User getUser(String loginId, String password) {
		
		
		return userDAO.selectUser(loginId, password);
	}
	
	public String getUserById(String userName, String email) {
		
		return userDAO.selectUserById(userName, email);
		
	}
	
	
}
