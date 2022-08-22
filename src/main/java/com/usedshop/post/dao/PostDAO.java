package com.usedshop.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId, 
			@Param("subject") String subject, 
			@Param("price") int price, 
			@Param("delivery") int delivery, 
			@Param("productStatus") String productStatus, 
		 	@Param("content") String content);
	
	
	

}
