package com.usedshop.wish.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usedshop.images.bo.ImagesBO;
import com.usedshop.post.model.CardView;
import com.usedshop.post.model.Post;
import com.usedshop.wish.dao.WishDAO;

@Service
public class WishBO {
	@Autowired
	private WishDAO wishDAO;
	
	@Autowired
	private ImagesBO imagesBO;
	
	public void CheckedWish(int postId, int userId) {
		boolean check = wishDAO.selectCheckWish(postId, userId);
	if(check == true) {
		wishDAO.deleteWish(postId, userId);
	} else {
		wishDAO.insertWish(postId, userId);
	}
	
}
	
	public int getCountWish(int PagePostId) {
		
		return wishDAO.selectCountWish(PagePostId);
	}
	
	//postId 조회
	public List<Integer> getWishPostIds(int userId) {
		return wishDAO.selectWishPostIds(userId);
	}
	
	public Post getWishList(int postIds){
		
		return wishDAO.selectWishList(postIds);
	}
	
	public List<CardView> getWishViewList(int userId) {
		
		List<CardView> result = new ArrayList<>();
		
		//postId 조회
		List<Integer> postIds  = new ArrayList<>();
		
		postIds =  getWishPostIds(userId);
		
		//post가져오기
		List<Post> wishList = new ArrayList<>();
		for(int wishPostId : postIds) {
			wishList.add(wishDAO.selectWishList(wishPostId));	
		}
		
		//이미지 가져오기
		for(Post post : wishList) {
			
			CardView card = new CardView();
			
			card.setPost(post);
			
			int postId = post.getId();
			
			String image = imagesBO.getImagesListFirst(postId);
			
			card.setImage(image);
			
		
			result.add(card);
		}
	
		return result;
		
	}
	
}
