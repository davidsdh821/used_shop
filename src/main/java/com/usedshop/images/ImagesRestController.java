package com.usedshop.images;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.usedshop.images.bo.ImagesBO;

@RestController
@RequestMapping("/images")
public class ImagesRestController {
	
	@Autowired 
	private ImagesBO imageBO;

	@PostMapping("/createimgs")
	public Map<String, Object> createimgs(
			@RequestParam("files") List<MultipartFile> files,
			@RequestParam("postId") int postId,
			@RequestParam("userLoginId") String userLoginId
			) {
		
		Map<String, Object> result2 = new HashMap<>();
		
		//db insert
		
		imageBO.addImages(files, postId, userLoginId);
		
		result2.put("result2", "succsess");
		
		
		return result2;
	}
	
	
}
