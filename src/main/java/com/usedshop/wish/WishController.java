package com.usedshop.wish;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wish")
@Controller
public class WishController {
	
	
	//http://localhost/wish/wish_mywish_view
	@RequestMapping("/wish_mywish_view")
	public String test(Model model) {
		
		model.addAttribute("gnbViewName", "include/gnb");
		model.addAttribute("viewName", "wish/mywish_view");
		
		
		return "template/layout";
	}

}
