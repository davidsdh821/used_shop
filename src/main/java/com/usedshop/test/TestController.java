package com.usedshop.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/post")
@Controller
public class TestController {
	
	//http://localhost/post/test_view
	@RequestMapping("/test_view")
	public String test(Model model) {
		
		model.addAttribute("gnbViewName", "include/gnb");
		model.addAttribute("viewName", "post/post_list_view");
		
		
		return "template/layout";
	}

	
}