package com.usedshop.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/post")
public class TestController {
	
	//http://localhost/post/test_view
	@RequestMapping("/test_view")
	public String test() {
		
		
		return "template/layout";
	}

	
}