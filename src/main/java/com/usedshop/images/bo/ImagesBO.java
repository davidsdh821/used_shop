package com.usedshop.images.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.usedshop.common.FileManagerService;
import com.usedshop.images.dao.ImagesDAO;

@Service
public class ImagesBO {
	
	@Autowired
	private FileManagerService FileManager;
	
	@Autowired
	private ImagesDAO imagesDAO;
	
	public void addImages(List<MultipartFile> files, int postId, String userLoginId) {
		for(int i = 0; i< files.size(); i++) {	
			String imagePath = null;
			if(files != null) {	
			imagePath = FileManager.saveFile(userLoginId, files.get(i));
			imagesDAO.insertImages(imagePath, postId);
			}
			
		}
		
	}
	
	public String getImagesListFirst(int postId) {
		
		return imagesDAO.selectImagesListFirst(postId);
		
	}
	
}
