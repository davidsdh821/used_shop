package com.usedshop.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usedshop.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean getUserId(String loginId) {
		
		
		return userDAO.selectUserId(loginId);
		
	}
	
	
	
}
