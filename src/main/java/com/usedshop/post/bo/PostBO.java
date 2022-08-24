package com.usedshop.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usedshop.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	
	public void addPost(int userId, String subject, int price, int delivery, String productStatus, String content) {
		
		 postDAO.insertPost(userId, subject, price, delivery, productStatus, content);
	}
	
	

}
