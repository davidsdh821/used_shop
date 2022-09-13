package com.usedshop.wish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.usedshop.post.model.Post;

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
	
	public List<Integer> selectWishPostIds(int userId);
	
	public Post selectWishList(int wishPostId);
}
