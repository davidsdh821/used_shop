package com.usedshop.images;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/images")
public class ImagesRestController {

	@PostMapping("/createimgs")
	public Map<String, Object> createimgs(
			@RequestParam("files") List<MultipartFile> files,
			@RequestParam("postId") int postId,
			@RequestParam("userLoginId") String userLoginId
			) {
		
		Map<String, Object> result2 = new HashMap<>();
		
		//db insert
		
		
		
		
		
		
		return result2;
	}
	
	
}
