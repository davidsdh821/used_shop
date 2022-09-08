package com.usedshop.post.model;

import java.util.List;

public class PageView {
	private Post post;
	private List<String> images;
	private String loginId;
	private List<Post> userPost;
	
	public List<Post> getUserPost() {
		return userPost;
	}
	public void setUserPost(List<Post> userPost) {
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
