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
		List<String> imagePath = null;
		
		if(files != null) {
			imagePath = FileManager.saveFile(userLoginId, files);
				
		}
		
		
		for(int i = 0; i< files.size(); i++) {		
			
			imagesDAO.insertImages(imagePath.get(i), postId);
			
		}
		
	}
	
}
