package com.usedshop.wish.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usedshop.wish.dao.WishDAO;

@Service
public class WishBO {
	@Autowired
	private WishDAO wishDAO;
	
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
	
}
