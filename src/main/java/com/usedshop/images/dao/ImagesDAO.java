package com.usedshop.images.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public interface ImagesDAO {
	
	
	public void insertImages(
			@Param("imagePath") String imagePath, 
			@Param("postId") int postId);
	
	
	public String selectImagesListFirst(int postId);
}
