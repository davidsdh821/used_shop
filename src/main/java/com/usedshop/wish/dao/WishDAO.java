package com.usedshop.wish.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WishDAO {
	
	public int selectCountWish(int PagePostId);
	
	public boolean selectCheckWish(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public void insertWish(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public void deleteWish(			
			@Param("postId") int postId, 
			@Param("userId") int userId);
}
