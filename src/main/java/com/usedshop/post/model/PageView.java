package com.usedshop.post.model;

import java.util.List;

public class PageView {
	private Post post;
	private List<String> images;
	private String loginId;
	private List<CardView> userPost;
	
	public List<CardView> getUserPost() {
		return userPost;
	}
	public void setUserPost(List<CardView> userPost) {
		this.userPost = userPost;
	}
	private int wish;
	
	public int getWish() {
		return wish;
	}
	public void setWish(int wish) {
		this.wish = wish;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	
}
