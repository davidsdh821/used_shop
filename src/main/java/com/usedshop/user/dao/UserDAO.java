package com.usedshop.user.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	
	public boolean selectUserId(String loginId);
	
}
