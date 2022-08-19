package com.usedshop.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/post")
public class PostRestController {
	
	@PostMapping("/create")
	public Map<String, Object> create() {
		
		Map<String, Object> result = new HashMap<>();
		
		return result;
	}
	
	
	
}
