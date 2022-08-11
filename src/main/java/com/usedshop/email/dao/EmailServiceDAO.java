package com.usedshop.email.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailServiceDAO {
	public void insertEmailNumberAndsendEmail(
			@Param("email") String email,
			@Param("number") int number); 
	
	public int deleteEmailByNumber(
			@Param("email") String email,
			@Param("number") int number);
}
