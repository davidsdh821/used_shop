package com.usedshop.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usedshop.images.bo.ImagesBO;
import com.usedshop.post.dao.PostDAO;
import com.usedshop.post.model.CardView;
import com.usedshop.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private ImagesBO imagesBO;
	
	
	public void addPost(int userId, String subject, int price, int delivery, String productStatus, String content) {
		
		 postDAO.insertPost(userId, subject, price, delivery, productStatus, content);
	}
	
	public int getPostId(int userId) {
		
		return postDAO.selectPostId(userId);
	}
	
	public List<Post> getPostList() {
		
		
		return postDAO.selectPostList();
	}
	
	
	public List<CardView> getCardViewList() {
		List<CardView> result = new ArrayList<>();
		
		//이곳에서 최신순으로 바꿀 수 있다
		
		List<Post> postList = getPostList();
		for(Post post : postList) {
			
			CardView card = new CardView();
			
			card.setPost(post);
			
			int postId = post.getId();
			
			String image = imagesBO.getImagesListFirst(postId);
			
			card.setImage(image);
			
		
			result.add(card);
		}
	
		return result;
	
	}
	
	public Post getPostById(int postId) {
		
		return postDAO.selectPostById(postId);
	}

}
