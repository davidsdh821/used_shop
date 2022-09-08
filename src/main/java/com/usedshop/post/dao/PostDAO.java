package com.usedshop.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.usedshop.post.model.CardView;
import com.usedshop.post.model.Post;

@Repository
public interface PostDAO {
	
	public void insertPost(
			@Param("userId") int userId, 
			@Param("subject") String subject, 
			@Param("price") int price, 
			@Param("delivery") int delivery, 
			@Param("productStatus") String productStatus, 
		 	@Param("content") String content);
	
	public int selectPostId(int userId);
	
	public List<Post> selectPostList();
	
	public Post selectPostById(int postId);
	
	
	
	public List<Post> selectCardViewListByWord(String word);
	
	public void updatePostView(int postId);
}
